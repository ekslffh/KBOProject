package kr.or.ddit.review.service;

import kr.or.ddit.ques.dao.IQuestionDao;
import kr.or.ddit.ques.dao.QuestionDaoImpl;
import kr.or.ddit.ques.service.IQuestionService;
import kr.or.ddit.ques.service.QuestionServiceImpl;
import kr.or.ddit.review.dao.IReviewDao;
import kr.or.ddit.review.dao.ReviewDaoImpl;
import kr.or.ddit.review.vo.ReviewVO;

public class ReviewServiceImpl implements IReviewService{

	private IReviewDao revdao;
	private static IReviewService revService;
	
	private ReviewServiceImpl() {
		revdao = ReviewDaoImpl.getInstance();
	}
	
	public static IReviewService getInstance() {
		if (revService == null) revService = new ReviewServiceImpl();
		return revService;
	}

	@Override
	public int insert(ReviewVO rv) {
		int cnt = revdao.insert(rv);
		return cnt;
	}
}
