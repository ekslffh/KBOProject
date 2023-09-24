package kr.or.ddit.notice.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.collections.map.HashedMap;

import kr.or.ddit.membership.vo.MembershipVO;
import kr.or.ddit.notice.dao.NoticeDaoImpl;
import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.product.service.IProductService;
import kr.or.ddit.product.service.ProductServiceImpl;
import kr.or.ddit.product.vo.ProductVO;

@WebServlet("/Notice")
public class NoticeController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	public NoticeController() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int currentPage = 1;
		
		currentPage = request.getParameter("page") == null ? 1: Integer.parseInt(request.getParameter("page"));
		
		// boardservice
		INoticeService noticeService = NoticeServiceImpl.getInstance();
		
		int countList = noticeService.countList();
//		System.out.println("전체 글 갯수 : " + countList);
		
		
		int perPage = 2;
		int perList = 10;
		
		int totalPage = (int)Math.ceil((double)countList / (double)perList);
//		System.out.println("전체 페이지 수 >>> " + totalPage);
		
		//페이지에 표시할 게시글의 범위(start ~ end)구하기
		//start = (currentPage - 1) * perList + 1;
		// 1페이지 일때 : (1-1)*5+1 => 1 
		// 2페이지 일때 : (2-1)*5+1 => 6 
		// 3페이지 일때 : (3-1)*5+1 => 11 
		int start = (currentPage -1) * perList + 1;
		
		// end = start + perList - 1;
		int end = start + perList - 1;
		if(end > countList) end = countList;
		
		int startPage = ((currentPage - 1) / perPage * perPage) + 1;
//		System.out.println("startPage(curr3일때)>>>" + startPage);
		
		int endPage = startPage + perPage -1;
		if(endPage > totalPage) endPage = totalPage;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		List<NoticeVO> noticeList = noticeService.noticeList(map);
		
				
		// 결과 (boardList)를 request에 담아서 출력할 페이지로 만듦
		request.setAttribute("list", noticeList);
		
		request.setAttribute("sPage", startPage);
		request.setAttribute("ePage", endPage);
		request.setAttribute("tPage", totalPage);
		request.setAttribute("cPage", currentPage);
		
		//WEB-INF폴더 내부 jsp로 이동하기위해 requestDispatcher객체 도움을 받을 고양
		request.getRequestDispatcher("noticeList.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		String writer = request.getParameter("memId");
		doGet(request, response);
		
	}
	
}
