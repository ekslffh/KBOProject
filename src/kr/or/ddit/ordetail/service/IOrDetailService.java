package kr.or.ddit.ordetail.service;

import java.util.List;

import kr.or.ddit.comm.service.ServiceIfs;
import kr.or.ddit.ordetail.vo.OrDetailVO;
import kr.or.ddit.product.vo.ProductVO;

public interface IOrDetailService extends ServiceIfs<OrDetailVO> {
	
	List<OrDetailVO> selectAllByProdNo(String prodNo);

}
