package kr.or.ddit.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.vo.NoticeVO;

@WebServlet("/NoticeContent")
public class NoticeContentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NoticeContentController() {
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		INoticeService noticeService = NoticeServiceImpl.getInstance();
		
		String contentNo = req.getParameter("contentNo");
		
		System.out.println("contentNo : " + contentNo);
		
		List<NoticeVO> findContentNo = noticeService.findContentNo(contentNo);
		
		System.out.println("선택한 글 번호 : " + findContentNo);
		
		req.setAttribute("content", findContentNo);
	
		req.getRequestDispatcher("noticeContentView.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	
}
