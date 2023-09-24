package kr.or.ddit.ques.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.ques.dao.IQuestionDao;
import kr.or.ddit.ques.dao.QuestionDaoImpl;
import kr.or.ddit.ques.vo.QuestionVO;

public class QuestionServiceImpl implements IQuestionService {
	
	private IQuestionDao dao;
	private static IQuestionService service;
	
	private QuestionServiceImpl() {
		dao = QuestionDaoImpl.getInstance();
	}
	
	public static IQuestionService getInstance() {
		if (service == null) service = new QuestionServiceImpl();
		return service;
	}
	
	@Override
	public int countList() {
		int countList = 0;
		try {
			countList = dao.countList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return countList;
	}

	@Override
	public List<QuestionVO> questionList(Map<String, Object> map) {
		List<QuestionVO> questionList = null;
		questionList = dao.questionList(map);
		System.out.println(questionList);
 		return questionList;
	}

	@Override
	public QuestionVO questionContent(String content) {
		QuestionVO questionContent = dao.questionContent(content);
		
		return questionContent;
	}

	@Override
	public QuestionVO findContentNo(String contentNo) {
		QuestionVO findContentNo = dao.findContentNo(contentNo);
		
		return findContentNo;
	}

	// 문의글 추가
	@Override
	public int insertQues(QuestionVO qv) {
		int cnt = dao.insertQues(qv);
		return cnt;
	}

	@Override
	public int updateQues(QuestionVO qv) {
		int cnt = dao.updateQues(qv);
		return cnt;
	}

	@Override
	public int deleteQues(Map<String, String> map) {
		int cnt = dao.deleteQues(map);
		return cnt;
	}

//	@Override
//	public QuestionVO findPqNo(Map<String, String> map) {
//		return dao.findPqNo(map);
//	}

}
