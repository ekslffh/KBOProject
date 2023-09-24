package kr.or.ddit.ticket.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.comm.dao.MyBatisDao;
import kr.or.ddit.ticket.dto.MonthlyAmountDTO;
import kr.or.ddit.ticket.dto.SectionMatchDTO;
import kr.or.ddit.ticket.vo.TicketVO;

public class TicketDaoImpl extends MyBatisDao implements ITicketDao {

	private static ITicketDao ticketDao;
	
	private TicketDaoImpl() {}
	
	public static ITicketDao getInstance() {
		if (ticketDao == null) {
			ticketDao = new TicketDaoImpl();
		}
		return ticketDao;
	}
	
	@Override
	public List<TicketVO> findAll() {
		return selectList("ticket.findAll");
	}

	@Override
	public TicketVO findById(String id) {
		return selectOne("ticket.findById", id);
	}

	@Override
	public int insert(TicketVO ticketVO) {
		return insert("ticket.insert", ticketVO);
	}

	@Override
	public int update(TicketVO ticketVO) {
		return update("ticket.update", ticketVO);
	}

	@Override
	public int deleteById(String id) {
		return delete("ticket.deleteById", id);
	}

	@Override
	public List<SectionMatchDTO> findSectionByMatch(String mNo) {
		return selectList("ticket.findSectionByMatch", mNo);
	}

	@Override
	public List<TicketVO> findByMatchAndSection(TicketVO ticketVO) {
		return selectList("ticket.findByMatchAndSection", ticketVO);
	}
	
	@Override
	public int insertMultipleData(List<TicketVO> ticketList) {
		return insert("ticket.insertMultipleData", ticketList);
	}

	@Override
	public List<TicketVO> findByMemId(String memId) {
		return selectList("ticket.findByMemId", memId);
	}

	@Override
	public int updatePayNo(Map<String, Object> map) {
		return update("ticket.updatePayNo", map);
	}

	@Override
	public List<MonthlyAmountDTO> getMonthlyAmt() {
		return selectList("ticket.getMonthlyAmt");
	}

}
