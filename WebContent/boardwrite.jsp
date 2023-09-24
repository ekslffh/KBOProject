<%@page import="kr.or.ddit.product.vo.ProductVO"%>
<%@page import="kr.or.ddit.ques.vo.QuestionVO"%>
<%@page import="kr.or.ddit.notice.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
	List<QuestionVO> list = (List<QuestionVO>) request.getAttribute("list");
	ProductVO pv = (ProductVO) request.getAttribute("pv");
%>
<style>
/* body { */
/*    padding-top: 70px; */
/*    padding-bottom: 30px; */
/* } */
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
<meta charset="UTF-8">
<title>문의글 작성하기</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<link href="css/styles.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">

</head>
<body>

	<%
		// 회원
	String loginCd = (String) session.getAttribute("loginCode");
	String memId = (String) session.getAttribute("memId");
	%>

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



	<div class="container" role="main">
		<h2>문의사항 작성</h2>
		<br><br>
		<div>
			<form action="InsertQues" method="post">

				<div class="mb-3 col-sm-4">
					<label><b>상품코드 : </b></label> <span id="prodNoElement"></span>
				</div>
				<br>
				<div class="mb-3 col-sm-4">
					<label><b>아이디 : </b></label> <span id="memId"><%=memId%></span>
				</div>

				<div class="mb-3 col-sm-4">
					<label><b>작성일시 : </b></label> <span id="sysdate"></span>
				</div>

				<div class="mb-3 col-sm-6">
					<label for="title">제목*</label> 
					<input type="text"
						class="form-control" name="pqTitle" id="title"
						placeholder="제목을 입력해 주세요" required>
				</div>
				<br><br>
				<div class="mb-3 col-sm-12">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="pqContent"
						id="summernote" placeholder="내용을 입력해 주세요"></textarea>
				</div>

			</form>
			<br><br>
			<div class="col-sm-12 text-center">
				<button type="submit" class="btn btn-sm btn-success" id="btnSave"
					onclick="sendData()">작성</button>
				<button type="button" class="btn btn-sm btn-success" id="btnList">목록</button>
			</div>

		</div>
	</div>

	<div>
	<br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br>
	</div>

	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Multicket</p>
		</div>
	</footer>

	<script>
	function sendData() {
		  var prodNo = document.getElementById("prodNoElement").textContent;
		  var memId = document.getElementById("memId").textContent;
		  var sysdate = document.getElementById("sysdate").textContent;
		  var qTitle = document.getElementById("title").value; // 제목을 가져옵니다.
		  var qContent = document.getElementById("summernote").value; // 글 내용을 가져옵니다.

		  // 각 input 요소의 값을 동적으로 생성된 hidden input 요소에 할당합니다.
		  var hiddenProdNo = document.createElement("input");
		  hiddenProdNo.setAttribute("type", "hidden");
		  hiddenProdNo.setAttribute("name", "prodNo");
		  hiddenProdNo.setAttribute("value", prodNo);

		  var hiddenMemId = document.createElement("input");
		  hiddenMemId.setAttribute("type", "hidden");
		  hiddenMemId.setAttribute("name", "memId");
		  hiddenMemId.setAttribute("value", memId);

		  var hiddenSysdate = document.createElement("input");
		  hiddenSysdate.setAttribute("type", "hidden");
		  hiddenSysdate.setAttribute("name", "sysdate");
		  hiddenSysdate.setAttribute("value", sysdate);

		  var hiddenQTitle = document.createElement("input");
		  hiddenQTitle.setAttribute("type", "hidden");
		  hiddenQTitle.setAttribute("name", "qTitle");
		  hiddenQTitle.setAttribute("value", qTitle);

		  var hiddenQContent = document.createElement("input");
		  hiddenQContent.setAttribute("type", "hidden");
		  hiddenQContent.setAttribute("name", "qContent");
		  hiddenQContent.setAttribute("value", qContent);

		  // 폼에 동적으로 생성된 hidden input 요소들을 추가합니다.
		  var form = document.querySelector("form");
		  form.appendChild(hiddenProdNo);
		  form.appendChild(hiddenMemId);
		  form.appendChild(hiddenSysdate);
		  form.appendChild(hiddenQTitle);
		  form.appendChild(hiddenQContent);

		  // 폼을 제출합니다.
		  form.submit();
		}
	

	// 목록 이동
	$(document).on('click', '#btnList', function() {
		window.location.href = "/KBOProject/Question";
	});
	
	window.onload = function() {
	    const urlParams = new URLSearchParams(window.location.search);
	    const prodNo = urlParams.get('prodNo');
	    // prodNo를 사용하여 원하는 작업 수행
	    // 예시: 상품 코드를 화면에 출력
	    document.getElementById('prodNoElement').innerText = prodNo;
	    console.log("상품코드는 " + prodNo);
	    
	    const memId = '<%=memId%>';
			const currentDate = new Date();
			const sysdateElement = document.getElementById('sysdate');
			sysdateElement.innerText = currentDate.toLocaleString();
		};
	</script>
</body>
</html>

<!-- jQuery -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->

<!-- Bootstrap CSS -->
<!-- <link rel="stylesheet" -->
<!--    href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"> -->

