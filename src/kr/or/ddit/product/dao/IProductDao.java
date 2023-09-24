package kr.or.ddit.product.dao;

import java.util.List;

import kr.or.ddit.comm.dao.DaoIfs;
import kr.or.ddit.product.vo.ProductVO;

public interface IProductDao extends DaoIfs<ProductVO> {

	List<ProductVO> findProdByCg(String cgName);

	List<ProductVO> findProdByCb(String cbNo);

	List<ProductVO> findByIds(String[] prodNos);

	
	
}
