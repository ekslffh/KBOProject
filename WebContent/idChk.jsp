<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	String userId = request.getParameter("id");

	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@112.220.114.130:1521:xe";
	Connection conn = DriverManager.getConnection(url, "team5_202302M", "java");
	Statement stmt = conn.createStatement();
	
	String sql = "select mem_id from member where mem_id = '" + userId + "'";
	ResultSet rs = stmt.executeQuery(sql);

	if(rs.next()){
		//값 존재시 사용불가 코드 생성 - json데이터 
%>
		{
			"code" : "fail",
			"msg"  : "사용불가"
		}
<%	
	}else{
		
		//사용가능 코드 생성
%>
		{
			"code" : "ok",
			"msg"  : "사용가능"
		}
<%
	}
%>