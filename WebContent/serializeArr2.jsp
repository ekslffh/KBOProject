<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="jdk.nashorn.internal.parser.JSONParser"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	BufferedReader rd = request.getReader();
	String jsonData = rd.readLine();
	//jQuery ajax로 데이터 전송시 object형태로 데이터를 구성해도 urlencoded형태로 넘어옴 mem_id=test11
	//  => 내장객체의 stringify()사용해 문자열처리 후 json으로 전달받음 {"name":"mem_id","value":"test11"}
	
	System.out.print(jsonData); //객체 배열 데이터 [{},{},...] 

			
	Map<String, Object> map = new HashMap<>();
	MemberVO vo = new MemberVO();
			
	//역직렬화 - gson사용
	JsonParser parser = new JsonParser();
	JsonArray jsonArr = (JsonArray)parser.parse(jsonData); //배열로 파싱
	for(int i=0; i<jsonArr.size(); i++){
		JsonObject jsonObj = (JsonObject)jsonArr.get(i);
		String key = jsonObj.get("name").getAsString();
		String value = jsonObj.get("value").getAsString();
		map.put(key, value);
	}

// 	BeanUtils.populate(vo, map);
	vo.setMemId((String) map.get("mem_id"));
	vo.setMemPw((String) map.get("mem_pw"));
	
	//드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//매니저로 객체 생성
	String url = "jdbc:oracle:thin:@112.220.114.130:1521:xe";
	Connection conn = DriverManager.getConnection(url, "team5_202302M", "java");
	//커넥션 객체로부터 preparedStatement객체 생성 후 sql쿼리 수행
	
	String sql = "update member "
				+ " set mem_pw = ? "
				+ " where mem_id = ? ";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, vo.getMemPw());
	pstmt.setString(2, vo.getMemId());
	
	
	int rst = pstmt.executeUpdate();
	
	if (rst > 0) {
		System.out.println("커밋 성공");
		conn.commit();
	} else {
		conn.rollback();
	}
%>

<%=rst %>