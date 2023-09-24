package kr.or.ddit.match.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value = "/detailMatch")
public class MatchDetailController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cbNo = req.getParameter("name");
		
		/*
		 * IMatchService matchService = MatchServiceImpl.getInstance();
		 * 
		 * List<MatchVO> matchDetailList = matchService.findDetail(cbNo);
		 */
		
		req.setAttribute("name", cbNo);
		req.getRequestDispatcher("detailMatchs.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
