<%@page import="kr.or.ddit.util.MessageTemplate"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	String memId = request.getParameter("id");
	String memName = request.getParameter("name");
	String memTel = request.getParameter("tel");

	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@112.220.114.130:1521:xe";
	Connection conn = DriverManager.getConnection(url, "team5_202302M", "java");
	Statement stmt = conn.createStatement();
	
// 	String sql = "select mem_id, mem_name, mem_hp from member"
// 			+ "where mem_id = '" + userId + "'"
// 			+ " and mem_name = '" + userName + "'"
// 			+ " and mem_hp = '" + userHp + "'";
// 	ResultSet rs = stmt.executeQuery(sql);

String sql = "select mem_id, mem_name, mem_tel from member"
			+ " where mem_id = ?" // 1. PreparedStatement를 사용하여 SQL Injection 공격에 대한 예방
			+ " and mem_name = ?"
			+ " and mem_tel = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, memId);
	pstmt.setString(2, memName);
	pstmt.setString(3, memTel);
	ResultSet rs = pstmt.executeQuery();
	
	 Random rand = new Random();
	 int rndNum = rand.nextInt(1000000);
	 String formattedNum = String.format("%06d", rndNum);
	   
	MessageTemplate mt = new MessageTemplate();
	mt.setPhoneNumber(memTel);
	String content = "[멀티켓] 인증번호는 [" +rndNum + "] 입니다. (타인 노출 금지)";
	mt.sendOne(content);

	if(rs.next()){
		//값 존재시 사용불가 코드 생성 - json데이터 
%>
		{
			"code" : "ok",
			"msg"  : "인증번호가 전송되었습니다.",
			"rndNum" : <%=rndNum %>
		}
<%	
	}else{
		
		//사용가능 코드 생성
%>
		{
			"code" : "fail",
			"msg"  : "존재하지 않는 정보입니다."
		}
<%
	}
%>