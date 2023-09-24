package kr.or.ddit.orders.service;

import java.util.List;

import kr.or.ddit.orders.dao.IOrdersDao;
import kr.or.ddit.orders.dao.OrdersDaoImpl;
import kr.or.ddit.orders.vo.OrdersVO;

public class OrderServiceImpl implements IOrdersService {

	private static IOrdersDao ordersDao;

	private static IOrdersService orderService;
    
    private OrderServiceImpl() {
    	ordersDao = OrdersDaoImpl.getInstance();
    }
    
    public static IOrdersService getInstance() {
       if (orderService == null) {
    	   orderService = new OrderServiceImpl();
       }
       return orderService;
    }

	@Override
	public List<OrdersVO> findAll() {
		return ordersDao.findAll();
	}

	@Override
	public OrdersVO findById(String orNo) {
		return ordersDao.findById(orNo);
	}

	@Override
	public int insert(OrdersVO ov) {
		int cnt = ordersDao.insert(ov);
		return cnt;
	}

	@Override
	public int update(OrdersVO ov) {
		return ordersDao.update(ov);
	}

	@Override
	public int deleteById(String orNo) {
		return ordersDao.deleteById(orNo);
	}
}
