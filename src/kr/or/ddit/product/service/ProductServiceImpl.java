package kr.or.ddit.product.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.product.dao.IProductDao;
import kr.or.ddit.product.dao.ProductDaoImpl;
import kr.or.ddit.product.vo.ProductVO;

public class ProductServiceImpl implements IProductService {
	
	private IProductDao prodDao;
	
	private static IProductService prodService;
	
	private ProductServiceImpl() {
		prodDao = ProductDaoImpl.getInstance();
	}
	
	public static IProductService getInstance() {
		if(prodService == null) {
			prodService = new ProductServiceImpl();
		}
		return prodService;
	}

	@Override
	public List<ProductVO> findAll() {
		return prodDao.findAll();
	}

	@Override
	public ProductVO findById(String prodNo) {
		return prodDao.findById(prodNo);
	}

	@Override
	public int insert(ProductVO pv) {
		int cnt = prodDao.insert(pv);
		return cnt;
	}

	@Override
	public int update(ProductVO pv) {
		return prodDao.update(pv);
	}

	@Override
	public int deleteById(String prodNo) {
		return prodDao.deleteById(prodNo);
	}

	@Override
	public List<ProductVO> findProdByCg(String cgName) {
		return prodDao.findProdByCg(cgName);
	}

	@Override
	public List<ProductVO> findProdByCb(String cbNo) {
		return prodDao.findProdByCb(cbNo);
	}

	@Override
	public List<ProductVO> findByIds(String[] prodNos) {
	    if (prodNos == null || prodNos.length == 0) {
	        return new ArrayList<>(); // 빈 리스트 반환
	    }
	    
	    Map<String, Object> params = new HashMap<>();
	    params.put("prodNos", prodNos);
	    
	    return prodDao.findByIds(prodNos);
	}

}
