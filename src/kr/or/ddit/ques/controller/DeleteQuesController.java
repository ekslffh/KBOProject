package kr.or.ddit.ques.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
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

@WebServlet("/DeleteQues")
public class DeleteQuesController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public DeleteQuesController() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pqNo = req.getParameter("pqNo");
		String memId = req.getParameter("memId");

		System.out.println("받아온 아이디 : " + memId);

		HttpSession session = req.getSession();
		String uId = (String) session.getAttribute("memId");
		//       String uPw = null;

		System.out.println("로그인 아이디 : " + uId);

		// 로그인 한 상태일 때 
//		if (session.getAttribute("loginCode") != null && session.getAttribute("loginPw") != null) {

			// 작성자 아이디와 로그인 아이디가 같을 때 삭제 실행
			if (memId.equals(uId)) {

				Map<String, String> map = new HashMap<String, String>();
				map.put("pqNo", pqNo);
				map.put("memId", memId);


				System.out.println(pqNo);
				System.out.println(memId);
				System.out.println(map);

				IQuestionService questionService = QuestionServiceImpl.getInstance();
				int qv = questionService.deleteQues(map);

				resp.setContentType("text/html; charset=UTF-8");
				PrintWriter out = resp.getWriter();

				String message = "문의글이 삭제되었습니다.";
				String redirectUrl = "Question";

				out.print("<script>");
				out.print("alert('" + message + "');");
				out.print("location.href='" + redirectUrl + "';");
				out.print("</script>");
			}
			// 아이디가 다를 때 
			else {

				resp.setContentType("text/html; charset=UTF-8");
				PrintWriter out = resp.getWriter();

				String message = "해당 게시물의 작성자가 아닙니다.";
				String redirectUrl = "Question";

				System.out.println("니가 쓴 거 아니자나...");
				out.print("<script>");
				out.print("alert('"+message+"');");
				out.print("location.herf='" + redirectUrl + "';");
				out.print("</script>");
			}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}