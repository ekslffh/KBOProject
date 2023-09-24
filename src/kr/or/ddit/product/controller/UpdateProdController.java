package kr.or.ddit.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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

@MultipartConfig
@WebServlet("/UpdateProdController")
public class UpdateProdController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateProdController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IProductService prodService = ProductServiceImpl.getInstance();

		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
		
		request.setCharacterEncoding("UTF-8");
		String prodNo = request.getParameter("prodNo");
		String cgName = request.getParameter("cgName");
        String prodName = request.getParameter("prodName");
        String prodPrice = request.getParameter("prodPrice");
        String prodStock = request.getParameter("prodStock");
        String prodDetail = request.getParameter("prodDetail");
        String atchFileId = request.getParameter("atch");
        
        
        ProductVO product = new ProductVO();
        product.setProdNo(prodNo);
        product.setCgName(cgName);
        product.setProdName(prodName);
        product.setProdPrice(prodPrice);
        product.setProdStock(Integer.parseInt(prodStock));
        product.setProdDetail(prodDetail);
        product.setAtchFileId(Integer.parseInt(atchFileId));
        
        AtchFileVO atchFileVO = null;
        
        try {
        	// 첨부파일 저장 (공통기능)
        	atchFileVO = fileService.saveAtchFileList(request);
        } catch (Exception e) {
        	e.printStackTrace();
        }
        
        if (atchFileVO == null) { // 신규 첨부파일이 존재하지 않는 경우...
			// 기존 첨부파일 ID 유지
			product.setAtchFileId(Long.parseLong(atchFileId));
		} else {
			product.setAtchFileId(atchFileVO.getAtchFileId());
		}
        
        
        String memId = (String) request.getSession().getAttribute("memId");
        String cbNo = (String) request.getSession().getAttribute("cbNo");
        int update = prodService.update(product);

        if (update > 0) {
            // 업데이트 성공 시
    		response.sendRedirect("SelectProdController?memId=" + memId + "&cbNo=" + cbNo);
            request.setAttribute("update", update);
        } else {
            System.out.println("업뎃실패");
    		response.sendRedirect("SelectProdController?memId=" + memId + "&cbNo=" + cbNo);
        }
        
	}

}
