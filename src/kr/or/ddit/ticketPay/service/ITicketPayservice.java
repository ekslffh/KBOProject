package kr.or.ddit.ticketPay.service;

import java.util.List;
import kr.or.ddit.comm.service.ServiceIfs;
import kr.or.ddit.ticketPay.vo.TicketPayVO;

public interface ITicketPayservice extends ServiceIfs<TicketPayVO> {

	/**
	 * 회원아이디 기준으로 결제내역 가져오기
	 * @return 특정회원에 대한 티켓결제내역
	 */
	List<TicketPayVO> findByMemId(String memId);
	
	/**
	 * 특정 멤버의 예매에 대한  총 결제금액 가져오기
	 * @return 특정 멤버의 예매에 대한  총 결제금액
	 */
	int getTotalTicketPriceByMemId(String memId);
	
	/**
	 * 특정 멤버의 상품에 대한 총 결제금액 가져오기
	 * @return 특정 멤버의 상품에 대한 총 결제금액
	 */
	int getTotalProductPriceByMemId(String memId);
	
}
