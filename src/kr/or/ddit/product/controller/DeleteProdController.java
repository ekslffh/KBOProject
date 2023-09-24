package kr.or.ddit.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.or.ddit.product.service.IProductService;
import kr.or.ddit.product.service.ProductServiceImpl;

@WebServlet("/prod/delete.do")
public class DeleteProdController extends HttpServlet {
	
	IProductService prodService;
	
	public DeleteProdController() {
		prodService = ProductServiceImpl.getInstance();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 상품번호 가져오기
		String prodNo = req.getParameter("prodNo");
		
		// 상품삭제하기
		int result = prodService.deleteById(prodNo);
		
		if (result > 0) { // 성공
			
		} else { // 실패
			
		}
		
		String memId = (String) req.getSession().getAttribute("memId");
		String cbNo = (String) req.getSession().getAttribute("cbNo");
		resp.sendRedirect("../SelectProdController?memId=" + memId + "&cbNo=" + cbNo);
	}
}
