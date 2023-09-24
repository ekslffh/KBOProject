package kr.or.ddit.ticket.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.comm.dao.DaoIfs;
import kr.or.ddit.ticket.dto.MonthlyAmountDTO;
import kr.or.ddit.ticket.dto.SectionMatchDTO;
import kr.or.ddit.ticket.vo.TicketVO;

public interface ITicketDao extends DaoIfs<TicketVO> {
	
	/**
	 * 경기정보를 받았을 때 해당 경기에 대한 섹션정보와 그에 따른 예매정보를 반환한다.
	 * @return 특정 경기에 대한 섹션 정보
	 */
	List<SectionMatchDTO> findSectionByMatch(String mNo);
	
	/**
	 * 섹션정보를 받았을 때 특정 경기에 대한 예매 내역 중 특정 섹션에 대한 좌석정보를 받아와야 한다.
	 * @return 특정 경기와 섹션에 대한 좌석예매 정보
	 */
	List<TicketVO> findByMatchAndSection(TicketVO ticketVO);
	 
	/**
	 * 여러개의 좌석을 선택해서 예매하기
	 * @param ticketList 예매할 좌석 번호
	 * @return 데이터 삽입 성공여부
	 */
	int insertMultipleData(List<TicketVO> ticketList);
	/**
	 * 회원아이디를 기준으로 조회하기
	 * @param memId 회원아이디
	 * @return 특정회원에 대한 예매정보
	 */
	List<TicketVO> findByMemId(String memId);
	
	/**
	 * 결제완료 후 티켓의 결제번호 업데이트 하기
	 * @param ticketList 업데이트할 티켓정보
	 * @return 성공시 업데이트된 행의 개수
	 */
	int updatePayNo(Map<String, Object> map);
	/**
	 * 올해기준 월별로 예매매출 정보를 가져온다.
	 * @return 월별 매출 정보
	 */
	List<MonthlyAmountDTO> getMonthlyAmt();
}
