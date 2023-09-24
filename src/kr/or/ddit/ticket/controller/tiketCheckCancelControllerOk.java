package kr.or.ddit.ticket.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.ticket.service.ITicketService;
import kr.or.ddit.ticket.service.TicketServiceImpl;

@WebServlet("/tiketCheckCancelControllerOk")
public class tiketCheckCancelControllerOk extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public tiketCheckCancelControllerOk() {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] tNoArr = req.getParameterValues("tNo");
		
		ITicketService ticketService = TicketServiceImpl.getInstance();

		for(int i = 0; i < tNoArr.length; i++) {
			String tNo = tNoArr[i];
			System.out.println("Ok tNo : " + tNo);
			ticketService.deleteById(tNo);
		}
		
		req.getRequestDispatcher("/myPage").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
