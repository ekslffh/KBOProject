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

import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.vo.NoticeVO;

@WebServlet("/NoticeCgList")
public class NoticeCgListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NoticeCgListController() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int currentPage = 1;
		
		currentPage = req.getParameter("page") == null ? 1: Integer.parseInt(req.getParameter("page"));
		
		INoticeService noticeService = NoticeServiceImpl.getInstance();

		int countList = noticeService.countList();
		
		int perPage = 2;
		int perList = 10;
		
		int totalPage = (int)Math.ceil((double)countList / (double)perList);
		
		String memId = req.getParameter("memId");

		int start = (currentPage - 1) * perList + 1;
		int end = start + perList - 1;
		
		if (end> countList) end = countList;
		
		int startPage = ((currentPage - 1) / perPage * perPage) + 1;
//		System.out.println("startPage : " + startPage);
		
		int endPage = startPage + perPage - 1;
		if(endPage>totalPage) endPage = totalPage;
		

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		List<NoticeVO> noticeList = noticeService.noticeList(map);
		
		List<NoticeVO> findNoticeByCg = noticeService.findNoticeByCg(memId); // 찾는 아이디만

		System.out.println("카데고리 결과 제발 >>>" + memId);
		System.out.println("카데고리 상품 결과 >>>" + findNoticeByCg);
		
		req.setAttribute("memId", memId);
		req.setAttribute("findNoticeByCg", findNoticeByCg);
		
		req.setAttribute("sPage", startPage);
		req.setAttribute("ePage", endPage);
		req.setAttribute("tPage", totalPage);
		req.setAttribute("cPage", currentPage);
		
		req.getRequestDispatcher("noticeListbyCg.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doGet(req, resp);   


	}

}