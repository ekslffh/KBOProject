<%@page import="java.util.Random"%>
<%@page import="kr.or.ddit.util.MessageTemplate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%

	String tel = request.getParameter("tel"); // 전화번호
	String telChk = request.getParameter("telChk");
	MessageTemplate mt = new MessageTemplate();
	mt.setPhoneNumber(tel);
	
	// 인증번호 생성 (랜덤숫자리4자리)
	
	Random rand = new Random();
	
	String rndNum = "";
	
	for (int i=0; i<6; i++){
		String ran = Integer.toString(rand.nextInt(10));
		rndNum += ran;
	} // 랜덤번호 생성
	
	String content = "[인증번호] " + rndNum;
	mt.sendOne(content);
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@112.220.114.130:1521:xe";
	Connection conn = DriverManager.getConnection(url, "team5_202302M", "java");
	Statement stmt = conn.createStatement();
	
	String sql = "select mem_id from member where mem_id = '" + tel + "'";
	ResultSet rs = stmt.executeQuery(sql);

	if(rs.next()){
		//값 존재시 사용불가 코드 생성 - json데이터 
%>
		{
			"code" : "fail",
			"msg"  : "유효하지 않은 전화번호입니다."
			
		}
<%	
	}else{
		
		//사용가능 코드 생성
%>
		{
			"code" : "ok",
			"msg"  : "인증번호가 발송되었습니다.",
			"rndNum" : <%=rndNum %>
		}
		
<%
	}
%>