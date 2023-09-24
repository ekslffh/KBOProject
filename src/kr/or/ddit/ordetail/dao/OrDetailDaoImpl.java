package kr.or.ddit.ordetail.dao;

import java.util.List;

import kr.or.ddit.comm.dao.MyBatisDao;
import kr.or.ddit.orders.dao.OrdersDaoImpl;
import kr.or.ddit.ordetail.vo.OrDetailVO;
import kr.or.ddit.pay.vo.PayVO;
import kr.or.ddit.product.vo.ProductVO;

public class OrDetailDaoImpl extends MyBatisDao implements IOrDetailDao {

	private static IOrDetailDao orDetailDao;
	
	private OrDetailDaoImpl() {}
	
	public static IOrDetailDao getInstance() {
		if(orDetailDao == null) {
			orDetailDao = new OrDetailDaoImpl();
		}
		return orDetailDao;
	}
	
	
	@Override
	public List<OrDetailVO> findAll() {
		List<OrDetailVO> orDetailList = selectList("orDetail.findAll");
	     return orDetailList;
	}

	@Override
	public OrDetailVO findById(String orNo) {
		OrDetailVO ov = selectOne("orDetail.findById", orNo);
	      return ov;
	}

	@Override
	public int insert(OrDetailVO ov) {
		int cnt = insert("orDetail.insert", ov);
	      return cnt;
	}

	@Override
	public int update(OrDetailVO ov) {
		int cnt = update("orDetail.update", ov);
	      return cnt;
	}

	@Override
	public int deleteById(String orNo) {
		int cnt = delete("orDetail.deleteById", orNo);
	      return cnt;
	}

	@Override
	public List<OrDetailVO> selectAllByProdNo(String prodNo) {
		List<OrDetailVO> orDetailList = selectList("orDetail.selectAllByProdNo", prodNo);
	    return orDetailList;
	}

}
