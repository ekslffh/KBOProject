<%@page import="kr.or.ddit.product.vo.ProductVO"%>
<%@page import="kr.or.ddit.ques.vo.QuestionVO"%>
<%@page import="kr.or.ddit.notice.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<NoticeVO> list = (List<NoticeVO>) request.getAttribute("list");
	ProductVO pv = (ProductVO) request.getAttribute("pv");
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
	<%
	String loginCd = (String) session.getAttribute("loginCode");
	String memId = (String) session.getAttribute("memId");
	%>
<meta charset="UTF-8">
<title>구단 관리자 -공지사항</title>
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
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>


	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="#!">Multicket</a>
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
				<p class="lead fw-normal text-white-50 mb-0">Multicket Notice</p>
			</div>
		</div>
	</header>



	<div class="container" role="main">
   <h2>공지사항 등록</h2>
   <br>
   <div>
      <form action="../InsertNoticeController" method="post">
         <div class="row">
            <div class="mb-3 col-sm-4">
               <label>아이디:</label>
               <span id="memId"><%=memId%></span>
            </div>
         </div>

         <div class="row">
            <div class="mb-3 col-sm-6">
               <br>
               <label for="title">제목*</label>
               <input type="text" class="form-control" name="nbTitle" id="title" placeholder="제목을 입력해 주세요" required>
            </div>
         </div>

         <div class="row">
            <div class="mb-3 col-sm-12">
               <label for="content">내용</label>
               <textarea class="form-control" rows="5" name="nbContent" id="summernote" placeholder="내용을 입력해 주세요"></textarea>
            </div>
         </div>
      </form>

      <div class="row">
         <div class="col-sm-12 text-center">
            <button type="submit" class="btn btn-sm btn-success" id="btnSave" onclick="sendData()">작성</button>
            <button type="button" class="btn btn-sm btn-success" id="btnList">목록</button>
         </div>
      </div>
   </div>
</div>

	<!-- Footer-->
	<footer class="py-5 bg-dark" style="margin-top: 130px;">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Multicket 2023</p>
		</div>
	</footer>

	<script>
	function sendData() {
// 		  var prodNo = document.getElementById("prodNoElement").textContent;
		  var memId = document.getElementById("memId").textContent;
		  var sysdate = document.getElementById("sysdate").textContent;
		  var nbTitle = document.getElementById("title").value; // 제목을 가져옵니다.
		  var nbContent = document.getElementById("summernote").value; // 글 내용을 가져옵니다.

		  // 각 input 요소의 값을 동적으로 생성된 hidden input 요소에 할당합니다.
// 		  var hiddenProdNo = document.createElement("input");
// 		  hiddenProdNo.setAttribute("type", "hidden");
// 		  hiddenProdNo.setAttribute("name", "prodNo");
// 		  hiddenProdNo.setAttribute("value", prodNo);

		  var hiddenMemId = document.createElement("input");
		  hiddenMemId.setAttribute("type", "hidden");
		  hiddenMemId.setAttribute("name", "memId");
		  hiddenMemId.setAttribute("value", memId);

		  var hiddenSysdate = document.createElement("input");
		  hiddenSysdate.setAttribute("type", "hidden");
		  hiddenSysdate.setAttribute("name", "sysdate");
		  hiddenSysdate.setAttribute("value", sysdate);

		  var hiddenNbTitle = document.createElement("input");
		  hiddenNbTitle.setAttribute("type", "hidden");
		  hiddenNbTitle.setAttribute("name", "nbTitle");
		  hiddenNbTitle.setAttribute("value", nbTitle);

		  var hiddenNbContent = document.createElement("input");
		  hiddenNbContent.setAttribute("type", "hidden");
		  hiddenNbContent.setAttribute("name", "nbContent");
		  hiddenNbContent.setAttribute("value", nbContent);

		  // 폼에 동적으로 생성된 hidden input 요소들을 추가합니다.
		  var form = document.querySelector("form");
		  form.appendChild(hiddenMemId);
		  form.appendChild(hiddenSysdate);
		  form.appendChild(hiddenNbTitle);
		  form.appendChild(hiddenNbContent);

		  // 폼을 제출합니다.
		  form.submit();
		}

	// 목록 이동
	$(document).on('click', '#btnList', function() {
// 		window.location.href = "/KBOProject/Question";
		window.location.href = "../NoticeMngController";
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