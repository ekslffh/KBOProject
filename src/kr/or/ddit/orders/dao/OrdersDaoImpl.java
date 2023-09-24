package kr.or.ddit.orders.dao;

import java.util.List;

import kr.or.ddit.comm.dao.MyBatisDao;
import kr.or.ddit.orders.vo.OrdersVO;
import kr.or.ddit.pay.dao.IPayDao;
import kr.or.ddit.pay.dao.PayDaoImpl;
import kr.or.ddit.pay.vo.PayVO;

public class OrdersDaoImpl extends MyBatisDao implements IOrdersDao {

	private static IOrdersDao ordersDao;
    
    private OrdersDaoImpl() {}
    
    public static IOrdersDao getInstance() {
       if (ordersDao == null) {
    	   ordersDao = new OrdersDaoImpl();
       }
       return ordersDao;
    }

	@Override
	public List<OrdersVO> findAll() {
		 List<OrdersVO> ordersList = selectList("orders.findAll");
	      return ordersList;
	}

	@Override
	public OrdersVO findById(String orNo) {
		OrdersVO ov = selectOne("orders.findById", orNo);
	      return ov;
	}

	@Override
	   public int insert(OrdersVO ov) {
	      int cnt = insert("orders.insert", ov);
	      return cnt;
	   }

	   @Override
	   public int update(OrdersVO ov) {
	      int cnt = update("orders.update", ov);
	      return cnt;
	   }

	   @Override
	   public int deleteById(String orNo) {
	      int cnt = delete("orders.deleteById", orNo);
	      return cnt;
	   }
}
