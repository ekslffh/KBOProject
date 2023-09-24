package kr.or.ddit.pay.dao;

import java.util.List;

import kr.or.ddit.comm.dao.MyBatisDao;
import kr.or.ddit.pay.vo.PayVO;
import kr.or.ddit.product.vo.ProductVO;


public class PayDaoImpl extends MyBatisDao implements IPayDao{

   private static IPayDao payDao;
      
      private PayDaoImpl() {}
      
      public static IPayDao getInstance() {
         if (payDao == null) {
        	 payDao = new PayDaoImpl();
         }
         return payDao;
      }

   @Override
   public List<PayVO> findAll() {
      List<PayVO> payList = selectList("pay.findAll");
      return payList;
   }

   @Override
   public PayVO findById(String payNo) {
	   PayVO pv = selectOne("pay.findById", payNo);
      return pv;
   }

   @Override
   public int insert(PayVO pv) {
      int cnt = insert("pay.insert", pv);
      return cnt;
   }

   @Override
   public int update(PayVO pv) {
      int cnt = update("pay.update", pv);
      return cnt;
   }

   @Override
   public int deleteById(String payNo) {
      int cnt = delete("pay.deleteById", payNo);
      return cnt;
   }

//@Override
//public List<ProductVO> findProdByCg(String cgName) {
//	List<ProductVO> prodList = selectList("product.findProdByCg", cgName);
//    return prodList;
//}
//
//@Override
//public List<ProductVO> findProdByCb(String cbNo) {
//	List<ProductVO> prodList = selectList("product.findProdByCb", cbNo);
//    return prodList;
//}


}