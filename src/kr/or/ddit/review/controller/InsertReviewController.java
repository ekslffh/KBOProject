package kr.or.ddit.review.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.review.service.IReviewService;
import kr.or.ddit.review.service.ReviewServiceImpl;
import kr.or.ddit.review.vo.ReviewVO;


@WebServlet("/InsertReview")
public class InsertReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public InsertReviewController() {

    }


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		String memId = (String) session.getAttribute("memId");
		
		IReviewService revService = ReviewServiceImpl.getInstance();
		
		String revContent = req.getParameter("revContent");
		System.out.println("내용 : " + revContent);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String revDate = sdf.format(new Date());
        System.out.println("시간 : " + revDate);
		
		String prodNo = req.getParameter("prodNo");
		System.out.println("상품번호 : " + prodNo);
		
		ReviewVO rv = new ReviewVO();
		rv.setPrContent(revContent);
		rv.setMemId(memId);
		rv.setAtchFileId(0);
		rv.setPrFile("");
		rv.setPrHeart(0);
		rv.setPrDate(revDate);
		rv.setProdNo(prodNo);
		
		revService.insert(rv);
		
		System.out.println(rv);
	}

}
