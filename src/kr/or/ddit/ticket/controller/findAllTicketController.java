package kr.or.ddit.ticket.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.or.ddit.ticket.service.ITicketService;
import kr.or.ddit.ticket.service.TicketServiceImpl;
import kr.or.ddit.ticket.vo.TicketVO;

@WebServlet("/ticket/findAll")
public class findAllTicketController extends HttpServlet {
	
	private ITicketService ticketService;
	
	public findAllTicketController() {
		ticketService = TicketServiceImpl.getInstance();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<TicketVO> ticketList = ticketService.findAll();
		
		req.setAttribute("ticketList", ticketList);
		req.setAttribute("name", "나성민");
		
		TicketVO tv = ticketList.get(0);
		req.getRequestDispatcher("/admin/index.jsp").forward(req, resp);;
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
