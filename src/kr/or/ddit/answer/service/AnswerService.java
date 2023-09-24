package kr.or.ddit.answer.service;

import kr.or.ddit.answer.dao.AnswerDao;
import kr.or.ddit.answer.vo.AnswerVO;

public class AnswerService {

	private AnswerDao answerDao;
	
	public AnswerService() {
		answerDao = new AnswerDao();
	}
	
	public AnswerVO findByPqNo(String pqNo) {
		return answerDao.findByPqNo(pqNo);
	}
	
	public int insert(AnswerVO answerVO) {
		return answerDao.insert(answerVO);
	}
	
	public AnswerVO deleteByPqNo(String pqNo) {
		return answerDao.deleteByPqNo(pqNo);
	}
	
}
