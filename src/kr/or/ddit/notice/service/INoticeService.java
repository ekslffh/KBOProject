package kr.or.ddit.notice.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.notice.vo.NoticeVO;

public interface INoticeService {
	
	//접근제한자 반환타입 메소드명(파라미터)
	//전체 글 갯수 조회
	public int countList();

	//범위 별 게시글 조회
	public List<NoticeVO> noticeList(Map<String, Object> map);
	
	public List<NoticeVO> findNoticeByCg(String memid);
	
//	public List<BoardVO> findAll();
	
	public List<NoticeVO> findContentNo(String contentNo);
	
	public List<NoticeVO> noticeContent(String content);
	
	public int insert(NoticeVO nv);
}
