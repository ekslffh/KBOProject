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
import kr.or.ddit.product.service.IProductService;
import kr.or.ddit.product.service.ProductServiceImpl;
import kr.or.ddit.product.vo.ProductVO;


@WebServlet("/CartController")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CartController() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String prodNo = req.getParameter("prodNo");
		String memId = req.getParameter("memId");
		int ctQty = 0;
	    try {
	        ctQty = Integer.parseInt(req.getParameter("ctQty"));
	    } catch (NumberFormatException e) {
	    	System.out.println("수량 없음");
	    }
		
	    System.out.println(ctQty);

		Map<String, String> cartMap = new HashMap<String, String>();
		cartMap.put("prodNo", prodNo);
		cartMap.put("memId", memId);
		
		ICartService cartService = CartServiceImpl.getInstance();
		Integer qty = cartService.findByCart(cartMap);

		 
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		if(qty != null && qty != 0) {
			
			String message = "이미 장바구니에 있는 상품입니다.";
		    String redirectUrl = "javascript:history.back();";
		    out.print("<script>");
		    out.print("alert('" + message + "');");
		    out.print("location.href='" + redirectUrl + "';");
		    out.print("</script>");
			
			
			
		}else {

			
			CartVO cartVO = new CartVO();
			cartVO.setMemId(memId);
			cartVO.setProdNo(prodNo);
			cartVO.setCtQty(ctQty);
		    cartService.insert(cartVO);
			
		    
		    System.out.println("성공");
		    System.out.println(cartVO.getCtQty());
		    
		    req.setAttribute("memId", memId);
		    
		    String message = "장바구니에 담겼습니다.";
		    String redirectUrl = "cartProdController?memId="+memId;
		    out.print("<script>");
		    out.print("alert('" + message + "');");
		    out.print("location.href='" + redirectUrl + "';");
		    out.print("</script>");
		    
//		    resp.sendRedirect("cartProdController?memId="+memId);
		    
		  //req.getRequestDispatcher("cart.jsp").forward(req, resp);
		}
	
		
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
