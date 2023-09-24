package kr.or.ddit.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comm.service.AtchFileServiceImpl;
import kr.or.ddit.comm.service.IAtchFileService;
import kr.or.ddit.comm.vo.AtchFileVO;
import kr.or.ddit.product.service.IProductService;
import kr.or.ddit.product.service.ProductServiceImpl;
import kr.or.ddit.product.vo.ProductVO;

@WebServlet("/ProdDetailController")
public class ProductDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductDetailController() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String prodNo = req.getParameter("prodNo");

		IProductService prodService = ProductServiceImpl.getInstance();
		ProductVO pv = prodService.findById(prodNo);

		IAtchFileService atchFileService = AtchFileServiceImpl.getInstance();

		AtchFileVO fileVO = new AtchFileVO();
		fileVO.setAtchFileId(pv.getAtchFileId());
		
		List<AtchFileVO> atchFileList = atchFileService.getAtchFileList(fileVO);
		
		req.setAttribute("pv", pv);
		req.setAttribute("atch", atchFileList.get(0));
		
		req.getRequestDispatcher("prodDetail.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}