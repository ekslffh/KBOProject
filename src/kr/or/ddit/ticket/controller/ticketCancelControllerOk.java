package kr.or.ddit.ticket.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.ticket.service.ITicketService;
import kr.or.ddit.ticket.service.TicketServiceImpl;
import kr.or.ddit.ticket.vo.TicketVO;

@WebServlet("/tiketCancleOk")
public class ticketCancelControllerOk extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public ticketCancelControllerOk() {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String tNo = req.getParameter("tNo");
		
		ITicketService ticketService = TicketServiceImpl.getInstance();
		ticketService.deleteById(tNo);
		
		req.getRequestDispatcher("/myPage").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
