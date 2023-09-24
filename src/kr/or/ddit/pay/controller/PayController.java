package kr.or.ddit.pay.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.pay.service.IPayService;
import kr.or.ddit.pay.service.PayServiceImpl;
import kr.or.ddit.pay.vo.PayVO;


/**
 * Servlet implementation class InsertProduct
 */
@WebServlet("/PayController")
public class PayController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PayController() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IPayService payService = PayServiceImpl.getInstance();
		
		List<PayVO> findAll = payService.findAll();
		
		String payNo = req.getParameter("payNo");
		
		PayVO findById = payService.findById(payNo);
		
		System.out.println("findAll 결과 >>>" + findAll);
		System.out.println("payNo 결과 >>>" + payNo);
		System.out.println("findById 결과 >>>" + findById);
		
		
		req.setAttribute("findAll", findAll);
		req.setAttribute("payNo", payNo);
		req.setAttribute("findById", findById);
		
		req.getRequestDispatcher("pay.jsp").forward(req, resp);
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
		
//		ProductVO pv = new ProductVO(prodNo, cgName, prodName, prodPrice, prodStock, cbNo, atchFileId);
		
		
	
	}

}
