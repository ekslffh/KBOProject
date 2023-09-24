package kr.or.ddit.ques.controller;

import java.io.IOException;
import java.io.PrintWriter;
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


@WebServlet("/UpdateQues")
public class UpdateQuesController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public UpdateQuesController() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		HttpSession session = req.getSession();
		// 로그인 아이디
		String uId = (String) session.getAttribute("memId");
		String memId = req.getParameter("memId");

		//		if (memId.equals(uId)) {

		IQuestionService questionService = QuestionServiceImpl.getInstance();

		String pqNo = req.getParameter("pqNo");
		System.out.println("글 번호:" + pqNo);

		QuestionVO findContent = questionService.findContentNo(pqNo);
		System.out.println("선택한 글 정보 : " + findContent);

		req.setAttribute("content", findContent);


		// 글 번호와 글 내용을 받아옴
		String pqContent = req.getParameter("pqContent");
		System.out.println(pqContent);



		req.setAttribute("findContentNo", findContent);

		req.getRequestDispatcher("quesUpdate.jsp").forward(req, resp);
		//		}

		//		else {
		//
		//			resp.setContentType("text/html; charset=UTF-8");
		//			PrintWriter out = resp.getWriter();
		//
		//			String message = "해당 게시물의 작성자가 아닙니다.";
		//			String redirectUrl = "/KBOProejct/Question";
		//
		//			out.print("<script>");
		//			out.print("alert('" + message + "');");
		//			out.print("location.href='" + redirectUrl + "';");
		//			out.print("</script>");
		//		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		IQuestionService questionService = QuestionServiceImpl.getInstance();
		
		String pqNo = req.getParameter("pqNo");
		String prodNo = req.getParameter("prodNo");
		String pqTitle = req.getParameter("pqTitle");
		String pqContent = req.getParameter("pqContent");
//		String contentNo = req.getParameter("contentNo");

//		System.out.println("글 번호 : " + pqNo);
//		System.out.println("상품 코드 : " + prodNo);
		System.out.println("글 제목 : " + pqTitle);
		System.out.println("글 내용 : " + pqContent);

//		Map<String, String> map = new HashMap<String, String>();
//		map.put("pqNo", contentNo);
//		map.put("pqContent", pqContent);

		QuestionVO qv = new QuestionVO();
		qv.setPqContent(pqContent);
		qv.setPqNo(pqNo);
		qv.setPqTitle(pqTitle);
		qv.setProdNo(prodNo);
		questionService.updateQues(qv);
		
		System.out.println("게시글 작성 내용 : " + qv);
		
		resp.sendRedirect("/KBOProject/Question");
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();

		String message = "문의글 수정이 완료되었습니다.";
		String redirectUrl = "/KBOProejct/QuestionContent?contentNo=" + pqNo;

		out.print("<script>");
		out.print("alert('" + message + "');");
		out.print("location.href='" + redirectUrl + "';");
		out.print("</script>");



	}
}
