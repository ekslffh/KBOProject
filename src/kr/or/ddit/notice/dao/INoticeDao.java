package kr.or.ddit.notice.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.notice.vo.NoticeVO;

public interface INoticeDao {

	//전체 글 갯수 조회
	public int countList() throws SQLException;

	//범위 게시글 조회
	public List<NoticeVO> noticeList(Map<String, Object> map) ;
	
	public List<NoticeVO> findNoticeByCg(String memId);
	
	public List<NoticeVO> findContentNo(String contentNo);
	
	public List<NoticeVO> noticeContent(String content);
	
	public int insert(NoticeVO nv);
	 
}
