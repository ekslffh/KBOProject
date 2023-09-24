package kr.or.ddit.notice.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.notice.dao.NoticeDaoImpl;
import kr.or.ddit.notice.dao.INoticeDao;
import kr.or.ddit.notice.vo.NoticeVO;

public class NoticeServiceImpl implements INoticeService {

	private INoticeDao dao;
	private static INoticeService service;
	
	//1.
	private NoticeServiceImpl() {
		dao = NoticeDaoImpl.getInstance();
	}
	
	//2.
	public static INoticeService getInstance() {
		if(service == null) service = new NoticeServiceImpl();
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
	public List<NoticeVO> noticeList(Map<String, Object> map) {
		List<NoticeVO> noticeList = null;
		noticeList = dao.noticeList(map);
		// 삭제할
		System.out.println(noticeList);
		return noticeList;
	}
	
	
	@Override
	public List<NoticeVO> findNoticeByCg(String memid) {
		List<NoticeVO> findNoticeByCg = dao.findNoticeByCg(memid);
		
		return findNoticeByCg;
	}
	
	public List<NoticeVO> findContentNo(String contentNo) {
		List<NoticeVO> findContentNo = dao.findContentNo(contentNo);
		
		return findContentNo;
	}
	
	public List<NoticeVO> noticeContent(String content){
		List<NoticeVO> noticeContent = dao.noticeContent(content);
		
		return noticeContent;
	}

	@Override
	public int insert(NoticeVO nv) {
		int cnt = dao.insert(nv);
		return cnt;
	}
	

}
