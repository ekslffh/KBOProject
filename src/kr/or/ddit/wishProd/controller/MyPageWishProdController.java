package kr.or.ddit.wishProd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.wishProd.dto.wishProdDto;
import kr.or.ddit.wishProd.service.IWishProdService;
import kr.or.ddit.wishProd.service.WishProdServiceImpl;

@WebServlet("/MypageWishProdController")
public class MyPageWishProdController
 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MyPageWishProdController() {
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sessionMemId = (String) request.getSession().getAttribute("memId");
		System.out.println("sessionM: " + sessionMemId);
		
		IWishProdService wishProdService = WishProdServiceImpl.getInstance();
		
		List<wishProdDto> wishProdList = wishProdService.getWishProdList(sessionMemId);
		System.out.println(wishProdList);
		
		request.setAttribute("wishProdList", wishProdList);
		
		request.getRequestDispatcher("/myPage.jsp").forward(request, response); 
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
