package kr.or.ddit.member.controller;

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

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;




@WebServlet("/FindId")
public class FindId extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FindId() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("findId.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String uName = request.getParameter("uName");
		String uTel = request.getParameter("uTel");
		String notMatch = "notMatch";
		
		PrintWriter out = response.getWriter();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uName", uName);
		map.put("uTel", uTel);
		
		//Controller >> Service >> Dao (sql조회) >> Service로 결과 반환 >> Controller결과 반환
		
		//service객체 생성
		IMemberService service = MemberServiceImpl.getInstance();
		String findId = service.findIdChk(map);
		
		System.out.println("결과 >>>" + findId);
		
		HttpSession session = request.getSession();
		
		//결과를 통해 
		if(findId != null) {
			//로그인 코드 생성하고 페이지로 전달하기 
			
			session.setAttribute("findIdCode", findId);
			
			out.println("{\"findIdCode\": \"" + findId + "\"}");
			
			
			
//			request.getRequestDispatcher("/").forward(request, response);
			//response.sendRedirect("findIdChk.jsp");
			
		}else {

			System.out.println("실패");
			//session.setAttribute("notMatch", "notMatch");
			out.println("{\"notMatch\": \"" + notMatch + "\"}");
			//response.sendRedirect("login.html");
		}
		
	}

}
