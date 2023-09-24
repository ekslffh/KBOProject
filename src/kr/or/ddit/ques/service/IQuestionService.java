package kr.or.ddit.ques.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.ques.vo.QuestionVO;

public interface IQuestionService {
	
	//전체 글 갯수 조회
	public int countList();
	
	// 범위 별 게시글 조회
	public List<QuestionVO> questionList(Map<String, Object> map);
	
	public QuestionVO questionContent(String content); // t상세네용
	
	public QuestionVO findContentNo(String contentNo);
	
//	QuestionVO findPqNo(Map<String, String> map);
	
	public int insertQues(QuestionVO qv);

	public int updateQues(QuestionVO qv);
	
	public int deleteQues(Map<String, String> map);

	
}
