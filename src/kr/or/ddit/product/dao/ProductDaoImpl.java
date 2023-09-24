package kr.or.ddit.product.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.comm.dao.MyBatisDao;
import kr.or.ddit.product.vo.ProductVO;


public class ProductDaoImpl extends MyBatisDao implements IProductDao{

   private static IProductDao prodDao;
      
      private ProductDaoImpl() {}
      
      public static IProductDao getInstance() {
         if (prodDao == null) {
            prodDao = new ProductDaoImpl();
         }
         return prodDao;
      }

   @Override
   public List<ProductVO> findAll() {
      List<ProductVO> prodList = selectList("product.findAll");
      return prodList;
   }

   @Override
   public ProductVO findById(String prodId) {
      ProductVO pv = selectOne("product.findById", prodId);
      return pv;
   }

   @Override
   public int insert(ProductVO pv) {
      int cnt = insert("product.insert", pv);
      return cnt;
   }

   @Override
   public int update(ProductVO pv) {
      int cnt = update("product.update", pv);
      return cnt;
   }

   @Override
   public int deleteById(String prodId) {
      int cnt = delete("product.deleteById", prodId);
      return cnt;
   }

@Override
public List<ProductVO> findProdByCg(String cgName) {
	List<ProductVO> prodList = selectList("product.findProdByCg", cgName);
    return prodList;
}

@Override
public List<ProductVO> findProdByCb(String cbNo) {
	List<ProductVO> prodList = selectList("product.findProdByCb", cbNo);
    return prodList;
}

@Override
public List<ProductVO> findByIds(String[] prodNos) {
	Map<String, Object> params = new HashMap<>();
    params.put("prodNos", prodNos);
    return selectList("product.findByIds", params);
}


}