package kr.or.ddit.cartProd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cartProd.dto.cartProdDto;
import kr.or.ddit.cartProd.service.CartProdServiceImpl;
import kr.or.ddit.cartProd.service.ICartProdService;

@WebServlet("/cartProdController")
public class cartProdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public cartProdController() {
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sessionMemId = (String) request.getSession().getAttribute("memId");
		System.out.println("sessionM: " + sessionMemId);
		
		ICartProdService cartProdService = CartProdServiceImpl.getInstance();
		
		List<cartProdDto> cartProdList = cartProdService.getCartProdList(sessionMemId);
		System.out.println(cartProdList);
		
		request.setAttribute("cartProdList", cartProdList);
		
		
		request.getRequestDispatcher("/cart.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
