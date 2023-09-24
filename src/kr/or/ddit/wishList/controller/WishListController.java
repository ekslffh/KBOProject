package kr.or.ddit.wishList.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.wishList.service.IWishListService;
import kr.or.ddit.wishList.service.WishListServiceImpl;
import kr.or.ddit.wishList.vo.WishListVO;

@WebServlet("/WishListController")
public class WishListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public WishListController() {
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String prodNo = req.getParameter("prodNo");
		String memId = req.getParameter("memId");

		Map<String, String> wishMap = new HashMap<String, String>();
		wishMap.put("prodNo", prodNo);
		wishMap.put("memId", memId);

		IWishListService wishService = WishListServiceImpl.getInstance();
		Date date = wishService.findByWish(wishMap);
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();

		if (date != null) {
			
			String message = "이미 관심 상품에 추가한 상품입니다.";
		    String redirectUrl = "javascript:history.back();";
		    out.print("<script>");
		    out.print("alert('" + message + "');");
		    out.print("location.href='" + redirectUrl + "';");
		    out.print("</script>");

		} else {
	
			//cartService.insert(cartVO);

			WishListVO wv = new WishListVO();
			wv.setMemId(memId);
			wv.setProdNo(prodNo);
			wv.setWiDate(new Date());
			
			wishService.insert(wv);
			
			System.out.println("성공");
	
			req.setAttribute("memId", memId);
			
			String message = "관심 상품에 담겼습니다.";
		    String redirectUrl = "WishProdController?memId="+memId;
		    out.print("<script>");
		    out.print("alert('" + message + "');");
		    out.print("location.href='" + redirectUrl + "';");
		    out.print("</script>");
//			resp.sendRedirect("wishList.jsp");
			
			

			// req.getRequestDispatcher("cart.jsp").forward(req, resp);
		}

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doGet(req, resp);
	}

}
