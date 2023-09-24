<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="kr.or.ddit.notice.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<NoticeVO> findBoardByCg = (List<NoticeVO>)request.getAttribute("findNoticeByCg");
%>
<!DOCTYPE html>
<html lang="en">
<style>
.pager {
	float: left;
	list-style-type: none;
}

#pageArea {
	display: flex;
	justify-content: center;
}

#writeArea {
	display: flex;
	justify-content: flex-end;
}

nav ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

nav li {
	display: inline-block;
	position: relative;
	padding: 10px;
}

nav li ul {
	position: absolute;
	top: 100%;
	left: 0;
	background-color: #fff;
	border: 1px solid #ccc;
	padding: 0;
	margin: 0;
	z-index: 999;
	display: none;
}

nav li:hover ul {
	display: block;
}

nav li ul li {
	display: block;
	width: 100%;
	text-align: center;
	padding: 10px;
	border-bottom: 1px solid #ccc;
}

nav li ul li:last-child {
	border-bottom: none;
}
</style>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title></title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>


<body>
	<!-- Navigation-->
		<%
		// 회원
	String loginCd = (String) session.getAttribute("loginCode");
	String memId = (String) session.getAttribute("memId");
	if (loginCd != null) {
	%>
	<!-- Navigation-->
	
	<header>
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark" style="height: 92px;">
    <div class="container-fluid">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a class="navbar-brand" href="#page-top"><img
				style="width: 40px; height: 40px;"
				src="http://localhost:8888/KBOProject/images/logo.png" alt="..." /></a>
      
      <a class="navbar-brand" href="/KBOProject/" style="font-size:35px; padding-top: 15px;">Multicket</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
        aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item"><a class="nav-link active" href='Match'>TICKET</a></li>
          <li class="nav-item"><a class="nav-link active" href="ProductListController">GOODS</a></li>
          <li class="nav-item"><a class="nav-link active" href="Notice">NOTICE</a></li>
          <li class="nav-item"><a class="nav-link active" href="myPage">MYPAGE</a></li>
          <li class="nav-item"><a class="nav-link active" href="Logout">LOGOUT</a></li>
        </ul>
      </div>
    </div>
  </nav>
</header>

	<%
		} else { // 비회원
	%>
	<!-- Navigation-->
	<header>
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark" style="height: 92px;">
    <div class="container-fluid">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a class="navbar-brand" href="#page-top"><img
				style="width: 40px; height: 40px;"
				src="http://localhost:8888/KBOProject/images/logo.png" alt="..." /></a>
      
      <a class="navbar-brand" href="/KBOProject/" style="font-size:35px; padding-top: 15px;">Multicket</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
        aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item"><a class="nav-link active" href='Match'>TICKET</a></li>
          <li class="nav-item"><a class="nav-link active" href="ProductListController">GOODS</a></li>
          <li class="nav-item"><a class="nav-link active" href="Notice">NOTICE</a></li>
          <li class="nav-item"><a class="nav-link active" href="myPage">LOGIN</a></li>

        </ul>
      </div>
    </div>
  </nav>
</header>
	<%
		}
	%>
	<!-- Header-->
			<br><br>
			<div class="text-center text-black">
				<h1 class="display-4 fw-bolder">
				<%
				String club = (String)request.getAttribute("memId");
				String customClub = "";

				if (club.equals("admin")) {
					customClub = "관리자";
				} else if (club.equals("hh01")){
					customClub = "한화 이글스";
				} else if (club.equals("ssg01")){
					customClub = "SSG 랜더스";
			    } else if (club.equals("kw01")){
			    	customClub = "키움 히어로즈";
			    } else if (club.equals("lg01")){
			    	customClub = "LG TWINS";
			    } else if (club.equals("kt01")){
			    	customClub = "KT WIZ";
			    } else if (club.equals("nc01")){
			    	customClub = "엔씨 다이노스";
			    } else if (club.equals("ss01")){
			    	customClub = "삼성 라이온즈";
			    } else if (club.equals("lt01")){
			    	customClub = "롯데 자이언츠";
			    } else if (club.equals("ds01")){
			    	customClub = "두산 베어스";
			    } else if (club.equals("kia01")){
			    	customClub = "기아 타이거즈";
			    } ;
			      
			    out.print(customClub + " " + "공지 게시판");
				
				%>
				</h1>
	
			</div>

	<br><br><br>
	<div id="writeArea">
	<button type="button" class="btn btn-success" id="brdWrite" onclick="location.href='/KBOProject/Notice'" style="margin-right:30px;">목록</button>

	</div>

	<div class="listArea">
		<table class="table table-striped">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">번호</th>
					<th style="background-color: #eeeeee; text-align: center;">제목</th>
					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center;">작성일</th>
				</tr>
			</thead>
			<tbody>
<%
	for(int i = findBoardByCg.size()-1; i>=0; i--){
%>
	<tr>
		<td style="text-align: center;">
<%-- 		<%=findBoardByCg.get(i).getNbNo()%> --%>
<%
			out.print(i+1);
%>
		</td>
		<td style="text-align: center;"><a
			href="/KBOProject/NoticeContent?contentNo=<%=findBoardByCg.get(i).getNbNo()%>">
			<%=findBoardByCg.get(i).getNbTitle()%></a></td>


		<td style="text-align: center;">
<%
			memId = findBoardByCg.get(i).getMemId();
			String customString = ""; 
			
			if (memId.equals("admin")) {
				customString = "관리자";
			} else if (memId.equals("hh01")){
				customString = "한화 이글스";
			} else if (memId.equals("ssg01")){
		    	  customString = "SSG 랜더스";
		    } else if (memId.equals("kw01")){
		   	  customString = "키움 히어로즈";
		    } else if (memId.equals("lg01")){
		   	  customString = "LG TWINS";
		    } else if (memId.equals("kt01")){
		   	  customString = "KT WIZ";
		    } else if (memId.equals("nc01")){
		   	  customString = "엔씨 다이노스";
		    } else if (memId.equals("ss01")){
		   	  customString = "삼성 라이온즈";
		    } else if (memId.equals("lt01")){
		   	  customString = "롯데 자이언츠";
		    } else if (memId.equals("ds01")){
		   	  customString = "두산 베어스";
		    } else if (memId.equals("kia01")){
		   	  customString = "기아 타이거즈";
		    } ;
		      
		    out.print(customString); // 저장된 문자열 출력
%>
		</td>
		
		<td style="text-align: center;"><%=findBoardByCg.get(i).getNbCreatedDt()%></td>
				</tr>
				<%
		} // for end
%>
			</tbody>
		</table>
	</div>

<!-- 페이징  -->
	<div id = "pageArea">
		<ul class="pager">
			<li id="prev"><a href="#">Prev</a></li>
		</ul>

		<ul class="pagination pager">

<% 
	 int sPage = (int) request.getAttribute("sPage");
	 int ePage = (int) request.getAttribute("ePage");
	 int cPage = (int) request.getAttribute("cPage");
	 
	 for (int i=sPage; i<=ePage; i++) {
		 
		 if (cPage == i){
%>
		<li class="active"><a href="#"><%=i %></a></li>
<%
		 } else {
%>
			<li><a href="#"><%=i %></a></li>
<%
		 }
	 }
%>
		</ul>
		
		<ul class="pager">
			<li class="next"><a href="#">Next</a></li>
		</ul>
		
	</div>
	<br><br><br><br>

<!-- Footer-->
<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; Multicket</p>
	</div>
</footer>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/scripts.js"></script>


<script>
$(document).ready(function(value){
	$("#myclub").change(function(){
		console.log("선택한 게시글 : " + $(this).val());
		$("myclubid").val($(this).val());
		
		let memId = $(this).val();
		location.href="/KBOProject/NoticeCgList?memId="+memId;
	});
});
	

// 페이지 번호 클릭 이벤트
$('.pagination li').on('click', function(){
	// Main 서블릿으로 페이지 정보 전달
	console.log($(this).text());
	location.href="/KBOProject/NoticeCgList?page=" + $(this).text().trim();
});


$('#prev').on('click', function(){
// 	alert($('.pagination').children().first().text());
	console.log($('.pagination').children().first().text());
	
	let currentPage = parseInt($('.pagination').children().first().text()) - 1;
	
	// 계산된 currentPage 값이 startPage의 값보다 작을 경우 서블릿으로 페이지 정보 넘기지 않음.
	if (currentPage <= 0) return;
	location.href="/KBOProject/Notice?page=" + currentPage;
});

$('#next').on('click', function(){
// 	alert($('.pagination').children().last().text());
	console.log($('.pagination').children().last().text());

	let currentPage = parseInt($('.pagination').children().last().text()) + 1;
	
	// 계산된 currentPage 값이 totalPage의 값보다 클 경우 서블릿으로 페이지 정보 넘기지 않음
	if(currentPage > <%=request.getAttribute("tPage")%>){
		alert("더 이상 게시물이 없습니다.");
		return;
	}
	location.href="/KBOProject/Notice?page=" + currentPage;
});



</script>
</body>
</html>
