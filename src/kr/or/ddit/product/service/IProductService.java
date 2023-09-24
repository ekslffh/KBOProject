package kr.or.ddit.product.service;

import java.util.List;

import kr.or.ddit.comm.service.ServiceIfs;
import kr.or.ddit.product.vo.ProductVO;

public interface IProductService extends ServiceIfs<ProductVO>{

	List<ProductVO> findProdByCg(String cgName);

	List<ProductVO> findProdByCb(String cbNo);

	List<ProductVO> findByIds(String[] prodNos);


	
}
