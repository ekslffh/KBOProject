<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//넘겨주는 데이터를 일괄로 받아내기 - beanutils 라이브러리 활용
	//원래 각 key정보를 getParameter로 전달받아 사용하지만 라이브러리를 통해 일괄로 받아서 처리 가능
	// => 일괄 처리를 위해 정보를 담아낼 공간(vo)필요 => form 내부 name속성과 동일한 이름으로 필드명 생성하기!
	
	MemberVO vo = new MemberVO();
	BeanUtils.populate(vo, request.getParameterMap());


	//드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//드라이버매니저로 커넥션 객체 생성
	String url = "jdbc:oracle:thin:@112.220.114.130:1521:xe";
	Connection conn = DriverManager.getConnection(url, "team5_202302M", "java");
	//커넥션 객체로 부터 statement객체생성
	Statement stmt = conn.createStatement();
	
	
	
	//insert query 작성
	String sql = "insert into member"
			+ "(mem_id, mem_pw, mem_name,"
			+ "	 mem_birth, mem_gender, mem_email,"
			+ "  mem_tel, mem_add, ms_name, cb_no, )"
			+ "values ("
			+ "'" + vo.getMemId() 
			+ "', '" + vo.getMemPw() 
			+ "', '" + vo.getMemName()
			+ "', '" + vo.getMemBirth()
			+ "', '" + vo.getMemGender()
			+ "', '" + vo.getMemEmail()
			+ "', '" + vo.getMemTel()
			+ "', '" + vo.getMemAdd()+vo.getMemAdd1()+vo.getMemAdd2()
			+ "', '" + vo.getMsName()
			+ "', '" + vo.getCbNo()
			
			+ "')";
	System.out.println("sql => " + sql);
	//sql 실행 후 결과를 int로 받기
	int result = stmt.executeUpdate(sql);
	//결과에 대한 응답 작성하기
%>

<%= result %>