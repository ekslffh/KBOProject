<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BufferedReader rd = request.getReader();
	String jsonData = rd.readLine();
	
	Map<String, Object> map = new HashMap<>();
	MemberVO vo = new MemberVO();

	JsonParser parser = new JsonParser();
	JsonArray jsonArr = (JsonArray)parser.parse(jsonData);
	for (int i=0; i<jsonArr.size(); i++){
		JsonObject jsonObj = (JsonObject)jsonArr.get(i);
		String key = jsonObj.get("name").getAsString();
		String value = jsonObj.get("value").getAsString();
		map.put(key, value);
	}
	BeanUtils.populate(vo, map);
	
	System.out.println("vo: " + vo.toString());
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@112.220.114.130:1521:xe";
	Connection conn = DriverManager.getConnection(url, "team5_202302M", "java");
	
	String sql = " UPDATE MEMBER "
			+ " SET MEM_PW = ?, MEM_NAME = ?, MEM_EMAIL = ?, "
			+ " MEM_TEL = ?, MEM_ADD = ?, CB_NO = ? "
			+ " WHERE MEM_ID = ? " ;
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, vo.getMemPw());
	pstmt.setString(2, vo.getMemName());
	pstmt.setString(3, vo.getMemEmail());
	pstmt.setString(4, vo.getMemTel());
	pstmt.setString(5, vo.getMemAdd()+vo.getMemAdd1()+vo.getMemAdd2());
	pstmt.setString(6, vo.getCbNo());
	pstmt.setString(7, vo.getMemId());
	
	int rst = pstmt.executeUpdate();
%>
<%=rst %>