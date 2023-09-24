package kr.or.ddit.ques.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.comm.dao.MyBatisDao;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.ques.vo.QuestionVO;

public class QuestionDaoImpl extends MyBatisDao implements IQuestionDao {

	private static IQuestionDao dao;

	private QuestionDaoImpl() {
	}
	
	public static IQuestionDao getInstance() {
		if(dao==null) dao = new QuestionDaoImpl();
		return dao;
	}
	
	@Override
	public int countList() throws SQLException {
		return selectOne("ques.countList");
	}

	@Override
	public List<QuestionVO> questionList(Map<String, Object> map) {
		return selectList("ques.questionList", map);
	}
	
	public QuestionVO questionContent(String content) {
		return selectOne("ques.questionContent", content);
	}

	@Override
	public QuestionVO findContentNo(String contentNo) {
		return selectOne("ques.findContentNo", contentNo);
	}

	@Override
	public int insertQues(QuestionVO qv) {
		int cnt = insert("ques.insertQues", qv);
		return cnt;
	}

	@Override
	public int updateQues(QuestionVO qv) {
		int cnt = update("ques.updateQues", qv);
		return cnt;
	}

	@Override
	public int deleteQues(Map<String, String> map) {
		int cnt = delete("ques.deleteQues", map);
		return cnt;
	}

//	@Override
//	public QuestionVO findPqNo(Map<String, String> map) {
//		try {
//			QuestionVO qv = selectOne("ques.deleteQues", map);
//			return qv;
//		} 
//		catch (Exception ex){
//			ex.printStackTrace();
//			
//			return null;
//		}
//	}

}
