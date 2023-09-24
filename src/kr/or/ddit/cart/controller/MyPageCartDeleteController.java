package kr.or.ddit.cart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cart.service.CartServiceImpl;
import kr.or.ddit.cart.service.ICartService;
import kr.or.ddit.cart.vo.CartVO;

@WebServlet("/MyPageCartDeleteController")
public class MyPageCartDeleteController extends HttpServlet{
	private static final long serialVersionUID = 1L;

    public MyPageCartDeleteController() {

    }

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String prodNo = req.getParameter("prodNo");
		String memId = (String) req.getSession().getAttribute("memId");
		
		Map<String, String> cartMap = new HashMap<String, String>();
		cartMap.put("prodNo", prodNo);
		cartMap.put("memId", memId);
		
		ICartService cartService = CartServiceImpl.getInstance();
		CartVO cv = cartService.findByProd(cartMap);
		System.out.println("cv : " + cv);
		cartService.delete(cv);
		System.out.println("삭제되었습니다.");
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		
		String message = "장바구니에서 삭제되었습니다.";
		String redirectUrl = "MyPageCartProdController?memId="+memId;
	    out.print("<script>");
	    out.print("alert('" + message + "');");
	    out.print("location.href='" + redirectUrl + "';");
	    out.print("</script>");
		
				
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doGet(req, resp);
	}

}
