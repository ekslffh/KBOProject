package kr.or.ddit.ticket.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.ticket.service.ITicketService;
import kr.or.ddit.ticket.service.TicketServiceImpl;
import kr.or.ddit.ticket.vo.TicketVO;

@WebServlet("/ticketCancleController")
public class ticketCancelController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ticketCancelController() {
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// String tNo = (String) req.getSession().getAttribute("tNo");
		String tNo = req.getParameter("tNo");

		Map<String, String> ticketMap = new HashMap<String, String>();
		ticketMap.put("tNo", tNo);

		System.out.println("tNO : " + tNo);

		ITicketService ticketService = TicketServiceImpl.getInstance();
		TicketVO tv = ticketService.findById(tNo);
		System.out.println("tv : " + tv);
		//바로 삭제
		//ticketService.deleteById(tNo);
		//System.out.println("삭제되었습니다.");
		//req.getRequestDispatcher("/myPage").forward(req, resp);
		
		req.setAttribute("tv", tv);
		req.getRequestDispatcher("/ticketCancel.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
