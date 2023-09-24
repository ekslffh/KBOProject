<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="kr.or.ddit.notice.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<NoticeVO> list = (List<NoticeVO>) request.getAttribute("list");
List<NoticeVO> content = (List<NoticeVO>) request.getAttribute("content");
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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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



	<div class="row" style="margin-bottom: 20px; margin-left: 1px;">
		<div class="col-lg-12">
			<h1 class="page-header">Detail Info</h1>
		</div>
	</div>

	<div class="panel" style="margin-left: 1px;">
		<div id="contAreaBox">
			<div class="panel">
				<div class="panel-body">
					<form role="form" action="/board/create_action" method="post">
						<div class="table-responsive" style="text-align: center;">
							<%
								if (content != null) {
								for (NoticeVO notice : content) {
							%>
							<table id="datatable-scroller"
								class="table table-bordered tbl_Form">
								<caption></caption>
								<colgroup>
									<col width="250px" />
									<col />
								</colgroup>
								<tbody>
									<tr>
										<th class="active">작성자</th>
										<td>
											<%
												memId = notice.getMemId();
											String customString = ""; // 원하는 문자열을 저장할 변수 선언

											if (memId.equals("admin")) { // memId가 "admin"인 경우에는 원하는 문자열을 지정
												customString = "관리자";
											} else if (memId.equals("hh01")) {
												customString = "한화 이글스";
											} else if (memId.equals("ssg01")) {
												customString = "SSG 랜더스";
											} else if (memId.equals("kw01")) {
												customString = "키움 히어로즈";
											} else if (memId.equals("lg01")) {
												customString = "LG TWINS";
											} else if (memId.equals("kt01")) {
												customString = "KT WIZ";
											} else if (memId.equals("nc01")) {
												customString = "엔씨 다이노스";
											} else if (memId.equals("ss01")) {
												customString = "삼성 라이온즈";
											} else if (memId.equals("lt01")) {
												customString = "롯데 자이언츠";
											} else if (memId.equals("ds01")) {
												customString = "두산 베어스";
											} else if (memId.equals("kia01")) {
												customString = "기아 타이거즈";
											}
											;

											out.print(customString); // 저장된 문자열 출력
											%>
										</td>
									</tr>
									<tr>
										<th class="active">제목</th>
										<td><%=notice.getNbTitle()%></td>
									</tr>
									<tr>
										<th class="active">내용</th>
										<td><%=notice.getNbContent()%></td>
									</tr>
								</tbody>
							</table>
							<%
								}
							}
							%>
						</div>
						<div style="margin-left: 1px;">
							<a href="/KBOProject/Notice" class="btn btn-secondary">목록</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<br><br><br><br><br><br>
	<br><br><br><br>

	<footer class="py-5 bg-dark"  style="margin-top: 130px;">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Multicket 2023</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="js/scripts.js"></script>
	<script>

</script>
</body>
</html>
