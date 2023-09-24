<%@page import="kr.or.ddit.ques.vo.QuestionVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
	List<QuestionVO> list = (List<QuestionVO>)request.getAttribute("list");


%>
<!DOCTYPE html>
<html lang="en">
<style>
.button-container {
  margin-top: 10px;
  margin-bottom: 10px;
  margin-left: 5px;
}
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
<title>문의 게시판</title>
<link href="css/styles.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>

<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="../">Multicket</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
	</nav>
	<!-- Header-->
	<header class="bg-dark py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">문의 게시판</h1>
				<p class="lead fw-normal text-white-50 mb-0">With this shop
					hompeage template</p>
			</div>
		</div>
	</header>
	
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
			<td style="text-align: center;"><%=list.get(i).getPqNo()%></td>
			<td style="text-align: center;">
			<a href="/KBOProject/clubQuestionContent?pqNo=<%=list.get(i).getPqNo()%>"> 
			<%=list.get(i).getPqTitle()%></a></td> 
			<td style="text-align: center;"><%=list.get(i).getMemId() %></td>
			<td style="text-align: center;"><%=list.get(i).getPqDate()%></td>
		</tr>
<%
		 		} //for end
%>
			</tbody>
		</table>
	</div>	
	
	<!-- 페이징  -->
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
<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; Your
			Website 2023</p>
	</div>
</footer>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/scripts.js"></script>
<script>

// 페이지 번호 클릭 이벤트
$('.pagination li').on('click', function(){
	// Main 서블릿으로 페이지 정보 전달
	console.log($(this).text());
	location.href="/KBOProject/clubQuestion?page=" + $(this).text();
});


$('#prev').on('click', function(){
// 	alert($('.pagination').children().first().text());
	console.log($('.pagination').children().first().text());
	
	let currentPage = parseInt($('.pagination').children().first().text()) - 1;
	
	// 계산된 currentPage 값이 startPage의 값보다 작을 경우 서블릿으로 페이지 정보 넘기지 않음.
	if (currentPage <= 0) return;
	location.href="/KBOProject/clubQuestion?page=" + currentPage;
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
	location.href="/KBOProject/clubQuestion?page=" + currentPage;
});


</script>
</body>
</html>
</body>