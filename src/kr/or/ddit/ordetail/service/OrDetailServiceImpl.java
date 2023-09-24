package kr.or.ddit.ordetail.service;

import java.util.List;

import kr.or.ddit.ordetail.dao.IOrDetailDao;
import kr.or.ddit.ordetail.dao.OrDetailDaoImpl;
import kr.or.ddit.ordetail.vo.OrDetailVO;
import kr.or.ddit.pay.dao.IPayDao;
import kr.or.ddit.pay.dao.PayDaoImpl;
import kr.or.ddit.pay.service.IPayService;
import kr.or.ddit.pay.service.PayServiceImpl;
import kr.or.ddit.product.vo.ProductVO;

public class OrDetailServiceImpl implements IOrDetailService {

	private IOrDetailDao orDetailDao;
	
	private static IOrDetailService orDetailService;
	
	private OrDetailServiceImpl() {
		orDetailDao = OrDetailDaoImpl.getInstance();
	}
	
	public static IOrDetailService getInstance() {
		if(orDetailService == null) {
			orDetailService = new OrDetailServiceImpl();
		}
		return orDetailService;
	}
	
	@Override
	public List<OrDetailVO> findAll() {
		return orDetailDao.findAll();
	}

	@Override
	public OrDetailVO findById(String orNo) {
		return orDetailDao.findById(orNo);
	}

	@Override
	public int insert(OrDetailVO ov) {
		int cnt = orDetailDao.insert(ov);
		return cnt;
	}

	@Override
	public int update(OrDetailVO ov) {
		return orDetailDao.update(ov);
	}

	@Override
	public int deleteById(String orNo) {
		return orDetailDao.deleteById(orNo);
	}

	@Override
	public List<OrDetailVO> selectAllByProdNo(String prodNo) {
		return orDetailDao.selectAllByProdNo(prodNo);
	}

}
