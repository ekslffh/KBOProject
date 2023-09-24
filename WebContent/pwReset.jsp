<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/sign-in/">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}
</style>


<!-- Custom styles for this template -->
<link href="css/login.css" rel="stylesheet">
</head>

<body class="text-center">

	<main class="form-signin w-100 m-auto">
	  <form method="post" onsubmit="valid()">
	<h1 class="h3 mb-3 fw-normal">비밀번호 재설정</h1>
	<p>비밀번호 재설정을 위한 본인 확인이 완료되었습니다.<br>
		새로운 비밀번호를 등록후 사용해 주세요.</p>
	  <hr>
	  <%
    String id = request.getParameter("id");
	%>
	    <div>
	      <label style="display: block; padding: 10px; background-color: #F2F2F2;">
	      아이디      <%=id%><span></span></label>
	        <input type="hidden" id="memId" name="mem_id" value="<%=id%>">
	      <span></span>
	    <div>
	      <div class="form-floating d-flex justify-content-between align-items-center">
	        <input type="text" class="form-control" id="newPass" name="mem_pw" placeholder="새 비밀번호" required>
	      	<label for="floatingInput">새 비밀번호</label>
	      </div>
	    </div>
	    <div class="form-floating d-flex justify-content-between align-items-center">
	        <input type="text" class="form-control" id="confirm" name="confirm_pw" placeholder="새 비밀번호 확인" required>
	      	<label for="floatingInput">새 비밀번호 확인</label>
	      </div>
	      <div class="form-floating d-flex justify-content-between align-items-center">
	        <button type="submit" class="w-100 btn btn-lg btn-primary" id="changePw">변경</button>
	        <span id="changeSpan"></span>
	    </div>
	    </div>
	  </form>
</main>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function valid() {
	//submit이벤트가 실행되면서 화면전환되는 현상을 막기
	event.preventDefault();
	
	//2. serializeArray()를 이용한 직렬화
	console.log("데이터직렬화>>", $('form').serializeArray() );
	//jQuery ajax는 object형태의 데이터를 자동으로  urlendcoded형식으로 변환하여 전송하는 특징이 있음
	let data = $('form').serializeArray(); //Object Array형태의 데이터로 직렬화
	// => urlencoded형태로 데이터 전송시 기존 방식(serialize.jsp에서 활용한 방식)대로 데이터 처리 가능
	
	// ==> json형태로 데이터 전송하기 
	
	//3. serializeJson()를 이용한 직렬화 => 외부 라이브러리 사용
	
	//ajax처리하기 - jquery
	$.ajax({
		type: 'post',
		url: 'serializeArr2.jsp',
		data: JSON.stringify(data), //문자열 처리후 서버로 전송
		success: function(result){
			console.log(result);
		},
		error: function(xhr){
			alert("상태: " + xhr.status);
		}
// 		,dataType: 'text'
	});
	
	  var newPass = document.getElementById("newPass").value;
	  var confirm = document.getElementById("confirm").value;
	  if (newPass != confirm) {
	    alert("비밀번호가 일치하지 않습니다.");
	    return;
	  }else{
		  alert("비밀번호가 변경되었습니다.");
		  window.location.href = "login.jsp";
		  return;
	  }
	}

</script>
</body>
</html>