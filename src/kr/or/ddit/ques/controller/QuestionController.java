package kr.or.ddit.ques.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.ques.service.IQuestionService;
import kr.or.ddit.ques.service.QuestionServiceImpl;
import kr.or.ddit.ques.vo.QuestionVO;

@WebServlet("/Question")
public class QuestionController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	public QuestionController() {
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IQuestionService quesService = QuestionServiceImpl.getInstance();
		
		int currentPage =1;
		currentPage = req.getParameter("page") == null ? 1: Integer.parseInt(req.getParameter("page"));
	
		int countList = quesService.countList();
		System.out.println("전체 글  갯수 : " + countList);
		
		int perPage = 2;
		int perList = 10;
		
		int totalPage = (int)Math.ceil((double)countList / (double)perList);
		
		int start = (currentPage-1)*perList+1;
		
		int end = start + perList -1;
		if (end>countList) end = countList;
		
		int startPage = ((currentPage - 1) / perPage * perPage) + 1;
		
		int endPage = startPage + perPage -1;
		if(endPage > totalPage) endPage = totalPage;
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		List<QuestionVO> questionList = quesService.questionList(map);
		
		System.out.println("start :"+start);
		System.out.println("end: "+end);
		
		req.setAttribute("list", questionList);
		System.out.println("list:" + questionList);
		
		req.setAttribute("sPage", startPage);
		req.setAttribute("ePage", endPage);
		req.setAttribute("tPage", totalPage);
		req.setAttribute("cPage", currentPage);
		
		req.getRequestDispatcher("questionList.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}
