<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.match.service.IMatchService"%>
<%@page import="kr.or.ddit.match.service.MatchServiceImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.match.vo.MatchVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	IMatchService matchService = MatchServiceImpl.getInstance();
	String teamName = request.getParameter("name");
	List<MatchVO> matchDetailList = matchService.findDetail(teamName);

if (matchDetailList == null) {
	matchDetailList = new ArrayList<>();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.table {
	margin-bottom: 20px;
}

.club_img {
	display: inline-block;
	width: 60px;
	height: 60px;
}

.club_img img {
	width: 100%;
}

table tr td:nth-child(1) {
	width: 150px;
} 

table tr td:nth-child(2) {
	width: 300px;
	padding-left: 100px;
}

table tr td:nth-child(3) {
	text-align: center;
}

table tr td:nth-child(4) {
	width: 300px;
} 
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
</head>
<body>
	<table class="table">
		<tbody>
			<tr>
				<td>Date</td>
				<td>HomeTeam</td>
				<td></td>
				<td>AwayTeam</td>
				<td>Stadium</td>
				<td></td>
			</tr>
			<%
				int size = matchDetailList.size();
			if (size == 0) {
			%>
			<tr>
				<td>경기정보가 없어요</td>
			</tr>
			<%
				} else {
			for (MatchVO mv : matchDetailList) {
			%>
			<tr>
				<td><%=mv.getmDate()%></td>
				<td><span class="club_img">
				<%if(mv.getCbHome().toString().equals("한화 이글스")){%>
					<img src="assets/img/clubImages/HANWHA.png" alt="">
				<%}else if(mv.getCbHome().toString().equals("SSG 랜더스")){%>
					<img src="assets/img/clubImages/SSG.png" alt="">
				<%}else if(mv.getCbHome().toString().equals("키움 히어로즈")){%>
				<img src="assets/img/clubImages/KIWOOM.png" alt="">
			    <%}else if(mv.getCbHome().toString().equals("LG 트윈스")){%>
				<img src="assets/img/clubImages/LG.jpg" alt="">
			    <%}else if(mv.getCbHome().toString().equals("KT 위즈")){%>
				<img src="assets/img/clubImages/KT.png" alt="">
			    <%}else if(mv.getCbHome().toString().equals("KIA 타이거즈")){%>
				<img src="assets/img/clubImages/KIA.png" alt="">
			    <%}else if(mv.getCbHome().toString().equals("NC 다이노스")){%>
				<img src="assets/img/clubImages/NC.png" alt="">
			    <%}else if(mv.getCbHome().toString().equals("삼성 라이온즈")){%>
				<img src="assets/img/clubImages/SAMSUNG.png" alt="">
			    <%}else if(mv.getCbHome().toString().equals("롯데 자이언츠")){%>
				<img src="assets/img/clubImages/LOTTE.png" alt="">
			    <%}else if(mv.getCbHome().toString().equals("두산 베어스")){%>
				<img src="assets/img/clubImages/DOOSAN.png" alt="">
			    <%}%></span><%=mv.getCbHome()%></td>
				<td>VS</td>
				<td><span class="club_img">
				<%if(mv.getCbAway().toString().equals("한화 이글스")){%>
					<img src="assets/img/clubImages/HANWHA.png" alt="">
				<%}else if(mv.getCbAway().toString().equals("SSG 랜더스")){%>
					<img src="assets/img/clubImages/SSG.png" alt="">
				<%}else if(mv.getCbAway().toString().equals("키움 히어로즈")){%>
				<img src="assets/img/clubImages/KIWOOM.png" alt="">
			    <%}else if(mv.getCbAway().toString().equals("LG 트윈스")){%>
				<img src="assets/img/clubImages/LG.jpg" alt="">
			    <%}else if(mv.getCbAway().toString().equals("KT 위즈")){%>
				<img src="assets/img/clubImages/KT.png" alt="">
			    <%}else if(mv.getCbAway().toString().equals("KIA 타이거즈")){%>
				<img src="assets/img/clubImages/KIA.png" alt="">
			    <%}else if(mv.getCbAway().toString().equals("NC 다이노스")){%>
				<img src="assets/img/clubImages/NC.png" alt="">
			    <%}else if(mv.getCbAway().toString().equals("삼성 라이온즈")){%>
				<img src="assets/img/clubImages/SAMSUNG.png" alt="">
			    <%}else if(mv.getCbAway().toString().equals("롯데 자이언츠")){%>
				<img src="assets/img/clubImages/LOTTE.png" alt="">
			    <%}else if(mv.getCbAway().toString().equals("두산 베어스")){%>
				<img src="assets/img/clubImages/DOOSAN.png" alt="">
			    <%}%></span><%=mv.getCbAway()%></td>
				<td><%=mv.getStNo()%></td>

				<td><button type="button" class="btn btn-outline-primary" onclick="window.open('ticket/section?mNo=<%=mv.getmNo()%>', '_blank')">예매</button></td>

			</tr>
			<%
				}
			%>

			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>