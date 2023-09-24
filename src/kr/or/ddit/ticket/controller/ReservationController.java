package kr.or.ddit.ticket.controller;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import kr.or.ddit.ticket.service.ITicketService;
import kr.or.ddit.ticket.service.TicketServiceImpl;
import kr.or.ddit.ticket.vo.TicketVO;
import kr.or.ddit.ticketPay.vo.TicketPayVO;

@WebServlet("/ticket/reservation")
public class ReservationController extends HttpServlet {

	private ITicketService ticketService;

	public ReservationController() {
		ticketService = TicketServiceImpl.getInstance();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 특정경기와 특정섹션값 받아오기
		String mNo = req.getParameter("mNo");
		String scNo = req.getParameter("scNo");
		String scPrice = req.getParameter("scPrice");
		
		// TicketVO객체에 저장하기
		TicketVO ticketVO = new TicketVO();
		ticketVO.setmNo(mNo);
		ticketVO.setScNo(scNo);
		// 특정경기, 특정세션에 대한 좌석에 대한 예매정보 가져오기
		List<TicketVO> ticketList = ticketService.findByMatchAndSection(ticketVO);
		// req에 예매정보 저장하기
		req.setAttribute("scPrice", scPrice);
		req.setAttribute("ticketList", ticketList);
		// seat.jsp에 넘겨주기
		req.getRequestDispatcher("/seat.jsp").forward(req, resp);
	}

	// 좌석예매하기
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// ObjectMapper 객체 생성
		ObjectMapper mapper = new ObjectMapper();
		// 요청에서 전송된 JSON 데이터 가져오기
	    String jsonData = req.getParameter("dataArr");
	    // JSON 데이터를 List<MyClass> 타입으로 변환
	    List<TicketVO> ticketList = mapper.readValue(jsonData, new TypeReference<List<TicketVO>>() {});
	    // TODO: 데이터 처리 로직 구현
	    int result = ticketService.insertMultipleData(ticketList);
	    resp.setContentType("application/json");
	    // AJAX 요청 결과를 응답으로 전송
	    System.out.println("result : " + result);
	    System.out.println("ticket size: " + ticketList.size());
	    if (result == ticketList.size()) {
	    	// 예매정보 생성 성공시 결제정보 만들어서 넘겨주기 (세션으로?)
	    	req.getSession().setAttribute("ticketList", ticketList);
	    	
	        String responseJson = new Gson().toJson("success");
	        resp.getWriter().write(responseJson);
	    } else {
	        String responseJson = new Gson().toJson("fail");
	        resp.getWriter().write(responseJson);
	    }
	}

}
