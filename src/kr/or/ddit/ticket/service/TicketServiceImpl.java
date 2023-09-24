package kr.or.ddit.ticket.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ticket.dao.ITicketDao;
import kr.or.ddit.ticket.dao.TicketDaoImpl;
import kr.or.ddit.ticket.dto.MonthlyAmountDTO;
import kr.or.ddit.ticket.dto.SectionMatchDTO;
import kr.or.ddit.ticket.vo.TicketVO;

public class TicketServiceImpl implements ITicketService {

	private ITicketDao ticketDao;
	
	private static ITicketService ticketService;
	
	private TicketServiceImpl() {
		ticketDao = TicketDaoImpl.getInstance();
	}
	
	public static ITicketService getInstance() {
		if (ticketService == null) {
			ticketService = new TicketServiceImpl();
		}
		return ticketService;
	}
	
	@Override
	public List<TicketVO> findAll() {
		return ticketDao.findAll();
	}

	@Override
	public TicketVO findById(String id) {
		return ticketDao.findById(id);
	}

	@Override
	public int insert(TicketVO ticketVO) {
		return ticketDao.insert(ticketVO);
	}

	@Override
	public int update(TicketVO ticketVO) {
		return ticketDao.update(ticketVO);
	}

	@Override
	public int deleteById(String id) {
		return ticketDao.deleteById(id);
	}

	@Override
	public List<SectionMatchDTO> findSectionByMatch(String mNo) {
		return ticketDao.findSectionByMatch(mNo);
	}

	@Override
	public List<TicketVO> findByMatchAndSection(TicketVO ticketVO) {
		return ticketDao.findByMatchAndSection(ticketVO);
	}

	@Override
	public int insertMultipleData(List<TicketVO> ticketList) {
		return ticketDao.insertMultipleData(ticketList);
	}

	@Override
	public List<TicketVO> findByMemId(String memId) {
		return ticketDao.findByMemId(memId);
	}

	@Override
	public int updatePayNo(Map<String, Object> map) {
		return ticketDao.updatePayNo(map);
	}

	@Override
	public List<MonthlyAmountDTO> getMonthlyAmt() {
		return ticketDao.getMonthlyAmt();
	}

}
