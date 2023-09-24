package kr.or.ddit.answer.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.answer.service.AnswerService;
import kr.or.ddit.answer.vo.AnswerVO;

@WebServlet("/answer/insert.do")
public class InsertAnswerController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		AnswerService answerService = new AnswerService();
		
		String pqNo = req.getParameter("pqNo");
		String answer = req.getParameter("answer");
		
		AnswerVO answerVO = new AnswerVO();
		answerVO.setPqNo(pqNo);
		answerVO.setPaContent(answer);
		
		int result = answerService.insert(answerVO);
		
		resp.setContentType("text/plain");
		if (result > 0) { // 성공
		    resp.getWriter().write("성공!");
		} else { // 실패
			resp.getWriter().write("실패!");
		}
		
	}
	
}
