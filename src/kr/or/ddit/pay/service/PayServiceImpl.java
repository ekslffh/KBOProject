package kr.or.ddit.pay.service;

import java.util.List;

import kr.or.ddit.pay.dao.IPayDao;
import kr.or.ddit.pay.dao.PayDaoImpl;
import kr.or.ddit.pay.vo.PayVO;

public class PayServiceImpl implements IPayService {
	
	private IPayDao payDao;
	
	private static IPayService payService;
	
	private PayServiceImpl() {
		payDao = PayDaoImpl.getInstance();
	}
	
	public static IPayService getInstance() {
		if(payService == null) {
			payService = new PayServiceImpl();
		}
		return payService;
	}

	@Override
	public List<PayVO> findAll() {
		return payDao.findAll();
	}

	@Override
	public PayVO findById(String payNo) {
		return payDao.findById(payNo);
	}

	
	//////////////////////이 밑으로 안 씀/////////////////////
	@Override
	public int insert(PayVO pv) {
		int cnt = payDao.insert(pv);
		return cnt;
	}

	@Override
	public int update(PayVO pv) {
		return payDao.update(pv);
	}

	@Override
	public int deleteById(String payNo) {
		return payDao.deleteById(payNo);
	}

//	@Override
//	public List<ProductVO> findProdByCg(String cgName) {
//		return prodDao.findProdByCg(cgName);
//	}
//
//	@Override
//	public List<ProductVO> findProdByCb(String cbNo) {
//		return prodDao.findProdByCb(cbNo);
//	}

}
