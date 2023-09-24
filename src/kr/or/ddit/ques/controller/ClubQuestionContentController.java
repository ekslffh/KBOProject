package kr.or.ddit.ques.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.ques.service.IQuestionService;
import kr.or.ddit.ques.service.QuestionServiceImpl;
import kr.or.ddit.ques.vo.QuestionVO;

@WebServlet("/clubQuestionContent")
public class ClubQuestionContentController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public ClubQuestionContentController() {
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IQuestionService questionService = QuestionServiceImpl.getInstance();
		
		String pqNo = req.getParameter("pqNo");
		System.out.println("pqNo:" + pqNo);
		
		QuestionVO findContentNo = questionService.findContentNo(pqNo);
		System.out.println("선택한 글 번호 : " + findContentNo);

		req.setAttribute("content", findContentNo);
		req.setAttribute("pqNo", pqNo);
		
		req.getRequestDispatcher("ManagerquestionContentView.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
