package kr.or.ddit.ques.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.ques.vo.QuestionVO;

public interface IQuestionDao {
	
	public int countList() throws SQLException;
	
	public List<QuestionVO> questionList(Map<String, Object> map);
	
	public QuestionVO questionContent(String content);

	public QuestionVO findContentNo(String contentNo);
	
	public int insertQues(QuestionVO gv);
	
	public int updateQues(QuestionVO qv);
	
	public int deleteQues(Map<String, String> map);
	
//	QuestionVO findPqNo(Map<String, String> map);
	
	
}
