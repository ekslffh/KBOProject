package kr.or.ddit.review.dao;

import kr.or.ddit.comm.dao.MyBatisDao;
import kr.or.ddit.review.vo.ReviewVO;

public class ReviewDaoImpl extends MyBatisDao implements IReviewDao {

	private static IReviewDao revDao;

	private ReviewDaoImpl(){

	}
	
	public static IReviewDao getInstance() {
		if(revDao==null) revDao = new ReviewDaoImpl();
		return revDao;
	}

	@Override
	public int insert(ReviewVO rv) {
		int cnt = insert("review.insert", rv);
		return cnt;

	}
}
