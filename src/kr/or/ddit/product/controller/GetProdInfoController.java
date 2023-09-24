package kr.or.ddit.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.product.service.IProductService;
import kr.or.ddit.product.service.ProductServiceImpl;
import kr.or.ddit.product.vo.ProductVO;

@WebServlet("/GetProdInfoController")
public class GetProdInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetProdInfoController() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IProductService prodService = ProductServiceImpl.getInstance();
		String prodNo = req.getParameter("prodNo");
		
		ProductVO findById = prodService.findById(prodNo);
		
		req.setAttribute("prodNo", prodNo);
		req.setAttribute("findById", findById);
		req.getRequestDispatcher("/manager/prodUpdate.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
