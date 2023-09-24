package kr.or.ddit.ticketPay.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import kr.or.ddit.membership.service.IMembershipService;
import kr.or.ddit.membership.service.MembershipServiceImpl;
import kr.or.ddit.membership.vo.MembershipVO;
import kr.or.ddit.ticket.service.ITicketService;
import kr.or.ddit.ticket.service.TicketServiceImpl;
import kr.or.ddit.ticket.vo.TicketVO;
import kr.or.ddit.ticketPay.service.ITicketPayservice;
import kr.or.ddit.ticketPay.service.TicketPayServiceImpl;
import kr.or.ddit.ticketPay.vo.TicketPayVO;

@WebServlet("/ticket-pay/insert.do")
public class InsertTicketPayController extends HttpServlet {

	private ITicketPayservice ticketPayservice;
	
	private IMembershipService membershipService;
	
	private ITicketService ticketService;

	public InsertTicketPayController() {
		ticketPayservice = TicketPayServiceImpl.getInstance();
		membershipService = MembershipServiceImpl.getInstance();
		ticketService = TicketServiceImpl.getInstance();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 섹션 가격정보 받아서 전달
		
		// 해당 멤버아이디 기준으로 등급 받아오기
		String memId = (String) req.getSession().getAttribute("memId");
		MembershipVO membershipVO = membershipService.findByMemId(memId);
		
		req.setAttribute("msVO", membershipVO);
		req.setAttribute("scPrice", req.getParameter("scPrice"));
		req.getRequestDispatcher("/ticketPay.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// ObjectMapper 객체 생성
		ObjectMapper mapper = new ObjectMapper();
		// 요청에서 전송된 JSON 데이터 가져오기
	    String jsonData = req.getParameter("data");
	    // JSON 데이터를 List<MyClass> 타입으로 변환
	    TicketPayVO ticketPayVO = mapper.readValue(jsonData, new TypeReference<TicketPayVO>() {});
	    // TODO: 데이터 처리 로직 구현

	    // 현재 시간을 Date 객체로 생성
        Date currentDate = new Date();

        // SimpleDateFormat을 사용하여 원하는 날짜 형식으로 포맷팅
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String tpDate = dateFormat.format(currentDate);
        
        ticketPayVO.setTpDate(tpDate);
	    
		// 결제하기
		int payResult = ticketPayservice.insert(ticketPayVO);
		
		int ticktPayResult = 0;
		if (payResult > 0) {
			// 티켓리스트에도 결제번호 업데이트 해주기
			List<TicketVO> ticketList = (List<TicketVO>) req.getSession().getAttribute("ticketList");
			String tpNo = ticketPayVO.getTpNo();
			Map<String, Object> map = new HashedMap();
			map.put("tpNo", tpNo);
			map.put("ticketList", ticketList);
			ticktPayResult = ticketService.updatePayNo(map);
		}
		
		// 응답 전송
		resp.setContentType("application/json");
		if (ticktPayResult > 0) {
			req.getSession().setAttribute("ticketPayVO", ticketPayVO);
	        String responseJson = new Gson().toJson("success");
	        resp.getWriter().write(responseJson);
	    } else {
	        String responseJson = new Gson().toJson("fail");
	        resp.getWriter().write(responseJson);
	    }
		
	}

}
