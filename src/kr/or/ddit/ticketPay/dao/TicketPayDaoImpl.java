package kr.or.ddit.ticketPay.dao;

import java.util.List;
import kr.or.ddit.comm.dao.MyBatisDao;
import kr.or.ddit.ticketPay.vo.TicketPayVO;

public class TicketPayDaoImpl extends MyBatisDao implements ITicketPayDao {

	private static ITicketPayDao ticketPayDao;
	
	private TicketPayDaoImpl() {}
	
	public static ITicketPayDao getInstance() {
		if (ticketPayDao == null) {
			ticketPayDao = new TicketPayDaoImpl();
		}
		return ticketPayDao;
	}
	
	@Override
	public List<TicketPayVO> findAll() {
		return selectList("ticketPay.findAll");
	}

	@Override
	public TicketPayVO findById(String id) {
		return selectOne("ticketPay.findById", id);
	}

	@Override
	public int insert(TicketPayVO ticketPayVO) {
		return insert("ticketPay.insert", ticketPayVO);
	}

	@Override
	public int update(TicketPayVO ticketPayVO) {
		return update("ticketPay.update", ticketPayVO);
	}

	@Override
	public int deleteById(String id) {
		return delete("ticketPay.deleteById", id);
	}

	@Override
	public List<TicketPayVO> findByMemId(String memId) {
		return selectList("ticketPay.findByMemId", memId);
	}

	@Override
	public int getTotalTicketPriceByMemId(String memId) {
		return selectOne("ticketPay.getTotalTicketPriceByMemId");
	}

	@Override
	public int getTotalProductPriceByMemId(String memId) {
		return selectOne("ticketPay.getTotalProductPriceByMemId");
	}

}
