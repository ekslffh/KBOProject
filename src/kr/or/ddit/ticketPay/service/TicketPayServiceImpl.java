package kr.or.ddit.ticketPay.service;

import java.util.List;
import kr.or.ddit.ticketPay.dao.ITicketPayDao;
import kr.or.ddit.ticketPay.dao.TicketPayDaoImpl;
import kr.or.ddit.ticketPay.vo.TicketPayVO;

public class TicketPayServiceImpl implements ITicketPayservice {

	private ITicketPayDao ticketPayDao;
	
	private TicketPayServiceImpl() {
		ticketPayDao = TicketPayDaoImpl.getInstance();
	}
	
	private static ITicketPayservice ticketService;
	
	public static ITicketPayservice getInstance() {
		if (ticketService == null) {
			ticketService = new TicketPayServiceImpl();
		}
		return ticketService;
	}
	
	@Override
	public List<TicketPayVO> findAll() {
		return ticketPayDao.findAll();
	}

	@Override
	public TicketPayVO findById(String tpNo) {
		return ticketPayDao.findById(tpNo);
	}

	@Override
	public int insert(TicketPayVO ticketPayVO) {
		return ticketPayDao.insert(ticketPayVO);
	}

	@Override
	public int update(TicketPayVO ticketPayVO) {
		return ticketPayDao.update(ticketPayVO);
	}

	@Override
	public int deleteById(String tpNo) {
		return ticketPayDao.deleteById(tpNo);
	}

	@Override
	public List<TicketPayVO> findByMemId(String memId) {
		return ticketPayDao.findByMemId(memId);
	}

	@Override
	public int getTotalTicketPriceByMemId(String memId) {
		return ticketPayDao.getTotalTicketPriceByMemId(memId);
	}

	@Override
	public int getTotalProductPriceByMemId(String memId) {
		return ticketPayDao.getTotalProductPriceByMemId(memId);
	}

}
