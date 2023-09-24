package kr.or.ddit.product.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import kr.or.ddit.comm.service.AtchFileServiceImpl;
import kr.or.ddit.comm.service.IAtchFileService;
import kr.or.ddit.comm.vo.AtchFileVO;
import kr.or.ddit.product.service.IProductService;
import kr.or.ddit.product.service.ProductServiceImpl;
import kr.or.ddit.product.vo.ProductVO;

@MultipartConfig
@WebServlet("/prod/insert.do")
public class InsertProdController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");

		// 상품정보 받아오기
		String category = req.getParameter("category");
		String prodName = req.getParameter("prodName");
		String prodPrice = req.getParameter("prodPrice");
		int prodStock = Integer.parseInt(req.getParameter("prodStock"));
		String prodDetail = req.getParameter("prodDetail");

		String prodNo = UUID.randomUUID().toString();
		String cbNo = (String) req.getSession().getAttribute("cbNo");

		// 서비스 객체 생성
		IProductService prodService = ProductServiceImpl.getInstance();

		IAtchFileService fileService = AtchFileServiceImpl.getInstance();

		// 첨부파일 안넣었을 때 오류가 나지 않게 하기 위해서 (null point exception)
		AtchFileVO atchFileVO = new AtchFileVO();

		try {
			// 첨부파일 목록 저장(공통기능)
			atchFileVO = fileService.saveAtchFileList(req);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		// pv객체에 상품정보 저장
		ProductVO pv = new ProductVO();
		pv.setCgName(category);
		pv.setProdName(prodName);
		pv.setProdPrice(prodPrice);
		pv.setProdStock(prodStock);
		pv.setProdDetail(prodDetail);
		pv.setProdNo(prodNo);
		pv.setCbNo(cbNo);
		
		// 첨부파일 아이디 저장
		pv.setAtchFileId(atchFileVO.getAtchFileId());

		// 회원정보 등록하기
		int cnt = prodService.insert(pv);
		String msg = "";

		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}

		// JSON 응답 데이터 생성
		JsonObject responseJson = new JsonObject();
		responseJson.addProperty("msg", msg);

		// JSON 형식으로 변환
		Gson gson = new Gson();
		String jsonResponse = gson.toJson(responseJson);

		// 응답 설정
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");

		// 응답 데이터 전송
		resp.getWriter().write(jsonResponse);
	}

	private String readPartAsString(Part part) throws IOException {
		InputStream inputStream = part.getInputStream();
		BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8));

		StringBuilder stringBuilder = new StringBuilder();
		String line;
		while ((line = reader.readLine()) != null) {
			stringBuilder.append(line);
		}

		return stringBuilder.toString();
	}

}
