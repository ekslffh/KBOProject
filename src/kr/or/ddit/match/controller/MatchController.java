package kr.or.ddit.match.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.match.service.IMatchService;
import kr.or.ddit.match.service.MatchServiceImpl;
import kr.or.ddit.match.vo.MatchVO;

@WebServlet(value = "/Match")
public class MatchController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IMatchService matchService = 
				MatchServiceImpl.getInstance();
		
		List<MatchVO> matchList = matchService.findAll();
		
		req.setAttribute("matchList", matchList);
		req.getRequestDispatcher("/reservePage.jsp").forward(req, resp);
	}	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
