package kr.or.ddit.notice.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.ques.service.IQuestionService;
import kr.or.ddit.ques.service.QuestionServiceImpl;
import kr.or.ddit.ques.vo.QuestionVO;

@WebServlet("/InsertNoticeController")
public class InsertNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertNoticeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
	    String memId = (String) session.getAttribute("memId");
	    String uPw = null;

	    if (session.getAttribute("loginCode") != null && session.getAttribute("loginPw") != null) {
	    	memId = (String) session.getAttribute("loginCode");
	        uPw = (String) session.getAttribute("loginPw");
	    }

	    INoticeService noticeService = NoticeServiceImpl.getInstance();

	    
	    String nbTitle = req.getParameter("nbTitle");
	    System.out.println("등록할 글의 제목 : " + nbTitle);

	    String nbContent = req.getParameter("nbContent");
	    System.out.println("글의 내용 : " + nbContent);

//	    String memId = req.getParameter("memId");
	    System.out.println("구단 아이디 : " + memId);

	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nbCreatedDt = sdf.format(new Date());
        
//	    String pqDate = req.getParameter("pqDate");
	    System.out.println("작성 시간 : " + nbCreatedDt);
	    
	    String nbUpdatedDt = sdf.format(new Date());
	    System.out.println("수정 시간 : " + nbUpdatedDt);

	    String atchFileId = req.getParameter("atchFileId");
	    System.out.println("사진 번호(null) : " + atchFileId);

	    NoticeVO notice = new NoticeVO();
	    notice.setNbTitle(nbTitle);
	    notice.setNbContent(nbContent);
	    notice.setMemId(memId);
	    notice.setNbCreatedDt(nbCreatedDt);
	    notice.setNbUpdatedDt(nbUpdatedDt);
	    notice.setAtchFileId(atchFileId);
	    noticeService.insert(notice);
	    
	    resp.sendRedirect("NoticeMngController"); 
	    
//	    int result = noticeService.insert(notice);
//	    if (result > 0) {
//	        resp.sendRedirect("/KBOProject/noticeWrite.jsp"); 
//	    } else {
//	        resp.sendRedirect("/KBOProject/FailurePage");
//	    }
		
	}

}
