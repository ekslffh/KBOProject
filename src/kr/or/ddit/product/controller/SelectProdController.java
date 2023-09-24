package kr.or.ddit.product.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.collections.map.HashedMap;
import kr.or.ddit.comm.service.AtchFileServiceImpl;
import kr.or.ddit.comm.service.IAtchFileService;
import kr.or.ddit.comm.vo.AtchFileVO;
import kr.or.ddit.product.service.IProductService;
import kr.or.ddit.product.service.ProductServiceImpl;
import kr.or.ddit.product.vo.ProductVO;

@WebServlet("/SelectProdController")
public class SelectProdController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public SelectProdController() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IProductService prodService = ProductServiceImpl.getInstance();
		IAtchFileService atchFileService = AtchFileServiceImpl.getInstance();

		List<ProductVO> findAll = prodService.findAll();

		String cbNo = req.getParameter("cbNo");

		req.getSession().setAttribute("cbNo", cbNo);

		List<ProductVO> findProdByCb = prodService.findProdByCb(cbNo);

		req.setAttribute("findAll", findAll);
		req.setAttribute("cbNo", cbNo);
		req.setAttribute("findProdByCb", findProdByCb);

		Map<String, AtchFileVO> map = new HashedMap();

		for (ProductVO pv : findProdByCb) {
			AtchFileVO fileVO = new AtchFileVO();
			fileVO.setAtchFileId(pv.getAtchFileId());

			List<AtchFileVO> atchFileList = atchFileService.getAtchFileList(fileVO);
			map.put(pv.getProdNo(), atchFileList.get(0));
		}

		req.setAttribute("imageInfo", map);

		req.getRequestDispatcher("/manager/productMng.jsp?cbNo=" + cbNo).forward(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
