<%@page import="kr.or.ddit.answer.vo.AnswerVO"%>
<%@page import="kr.or.ddit.answer.service.AnswerService"%>
<%@page import="kr.or.ddit.ques.vo.QuestionVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 	List<QuestionVO> list = (List<QuestionVO>)request.getAttribute("list");
	QuestionVO content = (QuestionVO)request.getAttribute("content");
	
	String pqNo = (String) request.getAttribute("pqNo");
	
	AnswerService answerService = new AnswerService();
	AnswerVO answerVO = answerService.findByPqNo(pqNo);
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
<title>문의 게시판</title>
<link href="css/styles.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>

	<%
		// 회원
	String loginCd = (String) session.getAttribute("loginCode");
	String memId = (String) session.getAttribute("memId");
	if (loginCd != null) {
	%>
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
          <li class="nav-item"><a class="nav-link active" href="MyPage">MYPAGE</a></li>
          <li class="nav-item"><a class="nav-link active" href="Logout">LOGOUT</a></li>
        </ul>
      </div>
    </div>
  </nav>
</header>
   <%
  
  }%>


	<div class="row" style="margin-bottom: 20px; margin-left: 1px;">
		<div class="col-lg-12">
			<h1 class="page-header">상세 페이지</h1>
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
										<td><%=content.getMemId()%></td>
									</tr>
									<tr>
										<th class="active">제목</th>
										<td><%=content.getPqTitle()%></td>
									</tr>
									<tr>
										<th class="active">내용</th>
										<td><%=content.getPqContent()%></td>
									</tr>
								</tbody>
							</table>
							
							<% if (answerVO != null) {%>
							<table id="datatable-scroller"
								class="table table-bordered tbl_Form">
								<caption></caption>
								<colgroup>
									<col width="250px" />
									<col />
								</colgroup>
								<tbody>
									<tr>
										<th class="active">답글</th>
										<td><%= answerVO.getPaContent()%></td>
									</tr>
									<tr>
										<th class="active">답변일시</th>
										<td><%= answerVO.getPaDate()%></td>
									</tr>
								</tbody>
							</table>
							<%
							}
							%>

						</div>
						<div style="margin-left: 1px;">
							<a href="Question" class="btn btn-secondary">목록</a> <a
								href="DeleteQues?pqNo=<%=content.getPqNo() %>&memId=<%=content.getMemId() %>"
								class="btn btn-secondary">삭제 </a> <a
								href="UpdateQues?pqNo=<%=content.getPqNo() %>"
								class="btn btn-secondary">수정</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%
								}
							
							%>
							
	<br><br><br><br><br>
	<br><br><br><br><br>
	<br><br>
	<footer class="py-5 bg-dark">
		<div class="container">

			<p class="m-0 text-center text-white">Copyright &copy; Multicket</p>

		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="js/scripts.js"></script>
	<script>
	</script>
</body>