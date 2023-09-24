<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="kr.or.ddit.notice.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<NoticeVO> list = (List<NoticeVO>)request.getAttribute("list");
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

<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<!-- Bootstrap icons-->


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
<!-- 	<header class="bg-dark py-5"> -->
<!-- 		<div class="container px-4 px-lg-5 my-5"> -->
<!-- 			<div class="text-center text-white"> -->
<!-- 				<h1 class="display-4 fw-bolder">NOTICE</h1> -->
<!-- 				<p class="lead fw-normal text-white-50 mb-0">With this shop -->
<!-- 					hompeage template</p> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</header> -->
	<br><br>
	<div class="form-group">
		<div class="col-sm-2 dropdown">
			<a class="nav-link dropdown-toggle px-lg-3 py-3 py-lg-4" 
                   href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" 
                     aria-expanded="false"> 전체 </a> 
 			 <ul class="dropdown-menu" aria-labelledby="navbarDropdown"> 
 		   <li> 
			<select id="myclub" class="form-control">
				<option value="none">구단을 선택하세요</option>
				<option value="hh01">한화 이글스</option>
				<option value="ssg01">SSG 랜더스</option>
				<option value="kw01">키움 히어로즈</option>
				<option value="lg01">LG 트윈스</option>
				<option value="kt01">KT 위즈</option>
				<option value="kia01">KIA 타이거즈</option>
				<option value="nc01">NC 다이노스</option>
				<option value="ss01">삼성 라이온즈</option>
				<option value="lt01">롯데 자이언츠</option>
				<option value="ds01">두산 베어스</option>
			</select>
			</li>
            </ul>
		</div>
	</div>

	<div id="listArea">
		<table class="table table-hover">
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
		for(int i=0; i<list.size(); i++){     
%>
		<tr>
			<td style="text-align: center;"><%=list.get(i).getNbNo()%></td>
			<td style="text-align: center;">
			<a href="/KBOProject/NoticeContent?contentNo=<%=list.get(i).getNbNo()%>">
			<%=list.get(i).getNbTitle()%></a></td>
			<td style="text-align: center;">
<% 
      memId = list.get(i).getMemId();
      String customString = ""; // 원하는 문자열을 저장할 변수 선언
      
      if (memId.equals("admin")) { // memId가 "admin"인 경우에는 원하는 문자열을 지정
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
					
					<td style="text-align: center;"><%=list.get(i).getNbCreatedDt()%></td>
				</tr>
<%
		 		} //for end
%>
			</tbody>
		</table>
	</div>

	<!-- 페이징 영역 -->
	<div id="pageArea">
		<ul class="pager">
			<li id="prev"><a href="#">Prev</a></li>
		</ul>

		<ul class="pagination pager">

			<!-- 			<ul class="pagination justify-content-center"> -->
<%
	int sPage = (int)request.getAttribute("sPage");
	int ePage = (int)request.getAttribute("ePage");
	int cPage = (int)request.getAttribute("cPage");
	
	for(int i=sPage; i<=ePage; i++){
		
		// 현재 페이지에만 활성화(active) 적용하기 - 
		if(cPage == i){
%>
			<li class="active"><a href="#"><%=i %></a></li>
			<%
		} else {
%>
			<li><a href="#"><%=i %></a></li>
			<%
		} // if else end
	} // for end
%>
		</ul>

		<ul class="pager">
			<li id="next"><a href="#">Next</a></li>
		</ul>

	</div>

<!-- Footer-->
<div>
		<br><br><br><br><br>
		<br><br><br>


	</div>
<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; Multicket</p>
	</div>
</footer>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/scripts.js"></script>
<script>

$(document).ready(function(value){
	$("#myclub").change(function(){
		console.log("선택한 구단 : " + $(this).val());
		$("myclubid").val($(this).val());
		
		let memId = $(this).val();
		location.href="/KBOProject/NoticeCgList?memId="+memId;
		
	});
});
	

// 페이지 번호 클릭 이벤트
$('.pagination li').on('click', function(){
	// Main 서블릿으로 페이지 정보 전달
	console.log($(this).text());
	location.href="/KBOProject/Notice?page=" + $(this).text();
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
