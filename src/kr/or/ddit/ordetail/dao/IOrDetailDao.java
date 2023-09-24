package kr.or.ddit.ordetail.dao;

import java.util.List;

import kr.or.ddit.comm.dao.DaoIfs;
import kr.or.ddit.ordetail.vo.OrDetailVO;
import kr.or.ddit.product.vo.ProductVO;

public interface IOrDetailDao extends DaoIfs<OrDetailVO> {

	List<OrDetailVO> selectAllByProdNo(String prodNo);
	
}
