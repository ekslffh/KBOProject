package kr.or.ddit.ticket.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.or.ddit.ticket.dto.SectionMatchDTO;
import kr.or.ddit.ticket.service.ITicketService;
import kr.or.ddit.ticket.service.TicketServiceImpl;

@WebServlet("/ticket/section")
public class SectionController extends HttpServlet {
	
	private ITicketService ticketService;
	
	public SectionController() {
		ticketService = TicketServiceImpl.getInstance();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 경기번호 받아오기
		String mNo = req.getParameter("mNo");
		// 경기번호에 대한 섹션정보 받아오기
		List<SectionMatchDTO> sectionMatchDTOs = ticketService.findSectionByMatch(mNo);
		// 섹션정보 req에 저장하기
		req.setAttribute("sectionMatchDtos", sectionMatchDTOs);
		// ticket.jsp로 이동하기
		req.getRequestDispatcher("/ticket.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
