package kr.or.ddit.ticket.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cart.service.CartServiceImpl;
import kr.or.ddit.ticket.service.ITicketService;
import kr.or.ddit.ticket.service.TicketServiceImpl;
import kr.or.ddit.ticket.vo.TicketVO;

@WebServlet("/ticketCheckCancelController")
public class ticketCheckCancelController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public ticketCheckCancelController() {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] tNoArr = req.getParameterValues("tNo");
		
		ITicketService ticketService = TicketServiceImpl.getInstance();
		List<TicketVO> ticketList = new ArrayList<TicketVO>();
		
		if(tNoArr != null) {
			for(int i = 0; i < tNoArr.length; i++) {
				String tNo = tNoArr[i];
				System.out.println("tNo : " + tNo);
				ticketList.add(ticketService.findById(tNo));
			}
		}

		System.out.println("ticketList Controller : " + ticketList);
		
		req.setAttribute("ticketList", ticketList);
		req.getRequestDispatcher("/ticketCheckCancel.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
