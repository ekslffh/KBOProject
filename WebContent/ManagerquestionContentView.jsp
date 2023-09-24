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
<!-- <link href="css/styles.css" rel="stylesheet" /> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="#!">MULTICKET</a>
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
				<h1 class="display-4 fw-bolder">NOTICE</h1>
				<p class="lead fw-normal text-white-50 mb-0">With this shop
					hompeage template</p>
			</div>
		</div>
	</header>

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
							<a href="clubQuestion" class="btn btn-secondary">목록</a> <a
								href="DeleteQues?pqNo=<%=content.getPqNo() %>&memId=<%=content.getMemId() %>"
								class="btn btn-secondary">삭제 </a> 
								<!-- Button trigger modal -->
							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
							  	답변달기
							</button>

							<!-- Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h1 class="modal-title fs-5" id="exampleModalLabel">문의 답변</h1>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							        <div class="mb-3">
									  <label for="exampleFormControlTextarea1" class="form-label">답변을 작성해주세요.</label>
									  <textarea class="form-control" id="answer" rows="3"></textarea>
									</div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							        <button type="button" class="btn btn-primary" onclick="writeAnswer()">작성완료</button>
							      </div>
							    </div>
							  </div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%
								}
							
							%>
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy;
				MULTICKET 
			</p>
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="js/scripts.js"></script>
	<script>
	
		function writeAnswer() {
			var answer = document.getElementById('answer').value;
// 			console.log("content: ", answer);
			
			// AJAX 요청 보내기
			$.ajax({
				url: 'answer/insert.do', // 여기에 서블릿의 URL을 입력하세요
				method: 'POST', // 요청 메소드 (GET 또는 POST)
				data: { answer: answer, pqNo: <%=pqNo %> }, // 서버로 보낼 데이터

				// 요청이 성공했을 때 실행될 콜백 함수
				success: function(response) {
					// 서버로부터의 응답을 처리하는 코드 작성
					console.log('서버 응답:', response);
					alert("작성완료하였습니다.")
					location.href='clubQuestion';
				},

				// 요청이 실패했을 때 실행될 콜백 함수
				error: function(xhr, status, error) {
					console.log('에러 발생:', error);
					alert("작성완료하였습니다.")
					location.href='clubQuestion';
				}
			});
		}
	</script>
</body>