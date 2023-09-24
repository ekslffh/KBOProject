package kr.or.ddit.notice.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.comm.dao.MyBatisDao;
import kr.or.ddit.notice.vo.NoticeVO;

public class NoticeDaoImpl extends MyBatisDao implements INoticeDao {

	private static INoticeDao dao;
	
	//1. private constructor
	private NoticeDaoImpl() {
	}
	
	//2. static method
	public static INoticeDao getInstance() {
		if(dao == null) dao = new NoticeDaoImpl();
		return dao;
	}
	
	@Override
	public int countList() throws SQLException {
		return selectOne("brd.countList");
	}

	@Override
	public List<NoticeVO> noticeList(Map<String, Object> map) {
		return selectList("brd.noticeList", map);
	}
	
	// 카테고리 분류
	public List<NoticeVO> findNoticeByCg(String memId) {
		return selectList("brd.findNoticeByCg", memId);
	}
	
	// 공지 번호 받아오기
	public List<NoticeVO> findContentNo(String contentNo) {
	    return selectList("brd.findContentNo", contentNo);
	}
	
	
	// 글 내용 받아오기
	public List<NoticeVO> noticeContent(String content) {
		return selectList("brd.noticeContent", content);
	}

	@Override
	public int insert(NoticeVO nv) {
		int cnt = insert("brd.insert", nv);
	    return cnt;
	}

}
