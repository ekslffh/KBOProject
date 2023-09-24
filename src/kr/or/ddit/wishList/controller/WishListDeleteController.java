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


@WebServlet("/WishListDeleteController")
public class WishListDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public WishListDeleteController() {

    }
    
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String prodNo = req.getParameter("prodNo");
		String memId = req.getParameter("memId");
		System.out.println("memId: " + memId);
		Map<String, String> wishMap = new HashMap<String, String>();
		
		wishMap.put("prodNo", prodNo);
		wishMap.put("memId", memId);
		
		
		IWishListService wishService = WishListServiceImpl.getInstance();
		WishListVO wv = wishService.findByProd(wishMap);
		
		wishService.delete(wv);
		System.out.println("삭제되었습니다.");
		
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		
		String message = "관심 상품에서 삭제되었습니다.";
		String redirectUrl = "WishProdController?memId="+memId;
	    out.print("<script>");
	    out.print("alert('" + message + "');");
	    out.print("location.href='" + redirectUrl + "';");
	    out.print("</script>");

	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
