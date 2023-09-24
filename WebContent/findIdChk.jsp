<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	// FindId 서블릿에서 저장한 세션 값 가져오기
	
	String id ="";
	String findIdCode = (String) session.getAttribute("findIdCode");

	// 첫 3글자만 추출
	id = findIdCode.substring(0, 3);

	// 나머지 부분을 *로 표시
	String stars = "";
	for (int i = 0; i < findIdCode.length() - 3; i++) {
		stars += "*";
	}
	id += stars;
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>아이디 찾기 결과</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			background-color: #f5f5f5;
			margin: 0;
			padding: 0;
		}

		.container {
			max-width: 800px;
			margin: 0 auto;
			padding: 20px;
			background-color: #fff;
			box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
			border-radius: 5px;
			text-align: center;
		}

		h3 {
			font-size: 24px;
			margin-top: 0;
		}

		p {
			font-size: 18px;
			margin-top: 20px;
			margin-bottom: 0;
		}

		button {
			background-color: #4CAF50;
			border: none;
			color: white;
			padding: 10px 20px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			border-radius: 5px;
			cursor: pointer;
			transition: background-color 0.3s;
			margin-top: 20px;
		}

		button:hover {
			background-color: #3e8e41;
		}
	</style>
</head>
<body>
	<div class="container">
		<h3>아이디 찾기 결과</h3>
		<p>입력하신 이름과 연락처로 조회된 아이디는 <strong><%=id%></strong> 입니다.</p>
		<button type="button" onclick="location.href='login.jsp'">로그인</button>
	</div>
</body>
</html>


