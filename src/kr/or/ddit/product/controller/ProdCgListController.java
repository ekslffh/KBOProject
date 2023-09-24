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

@WebServlet("/ProdCgListController")
public class ProdCgListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProdCgListController() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IProductService prodService = ProductServiceImpl.getInstance();
		IAtchFileService atchFileService = AtchFileServiceImpl.getInstance();
		
		String cgName = req.getParameter("cgName");
		
		List<ProductVO> findProdByCg = prodService.findProdByCg(cgName);
		
		req.setAttribute("cgName", cgName);
		req.setAttribute("findProdByCg", findProdByCg);
		
		Map<String, AtchFileVO> map = new HashedMap();
		
		for (ProductVO pv : findProdByCg) {
			AtchFileVO fileVO = new AtchFileVO();
			fileVO.setAtchFileId(pv.getAtchFileId());

			List<AtchFileVO> atchFileList = atchFileService.getAtchFileList(fileVO);
			map.put(pv.getProdNo(), atchFileList.get(0));
		}

		req.setAttribute("imageInfo", map);
		
		req.getRequestDispatcher("prodCgList.jsp").forward(req, resp);
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);	
		
	}

}
