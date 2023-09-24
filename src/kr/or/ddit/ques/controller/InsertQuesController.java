package kr.or.ddit.ques.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.ques.service.IQuestionService;
import kr.or.ddit.ques.service.QuestionServiceImpl;
import kr.or.ddit.ques.vo.QuestionVO;

@WebServlet("/InsertQues")
public class InsertQuesController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public InsertQuesController() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		HttpSession session = req.getSession();
		String memId = (String) session.getAttribute("memId");
		String uPw = null;

		if (session.getAttribute("loginCode") != null && session.getAttribute("loginPw") != null) {
			memId = (String) session.getAttribute("loginCode");
			uPw = (String) session.getAttribute("loginPw");
		}

		IQuestionService questionService = QuestionServiceImpl.getInstance();


		String pqTitle = req.getParameter("pqTitle");
		System.out.println("등록할 글의 제목 : " + pqTitle);

		String pqContent = req.getParameter("pqContent");
		System.out.println("글의 내용 : " + pqContent);

		//	    String memId = req.getParameter("memId");
		System.out.println("글의 작성자 : " + memId);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String pqDate = sdf.format(new Date());

		//	    String pqDate = req.getParameter("pqDate");
		System.out.println("작성 시간 : " + pqDate);

		String prodNo = req.getParameter("prodNo");
		System.out.println("상품번호 : " + prodNo);


		QuestionVO ques = new QuestionVO();
		ques.setPqTitle(pqTitle);
		ques.setPqContent(pqContent);
		ques.setMemId(memId);
		ques.setPqDate(pqDate);
		ques.setProdNo(prodNo);
		questionService.insertQues(ques);

		System.out.println("게시글 작성내용 : " + ques);

		//	    req.getRequestDispatcher("questionList.jsp").forward(req, resp);

		resp.sendRedirect("/KBOProject/Question");
	}
}
