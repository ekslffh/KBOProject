package kr.or.ddit.answer.dao;

import kr.or.ddit.answer.vo.AnswerVO;
import kr.or.ddit.comm.dao.MyBatisDao;

public class AnswerDao extends MyBatisDao {
	
	public AnswerVO findByPqNo(String pqNo) {
		return selectOne("answer.findByPqNo", pqNo);
	}
	
	public int insert(AnswerVO answerVO) {
		return selectOne("answer.insert", answerVO);
	}
	
	public AnswerVO deleteByPqNo(String pqNo) {
		return selectOne("answer.deleteByPqNo", pqNo);
	}
	
}
