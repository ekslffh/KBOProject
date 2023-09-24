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
<title>Signin Template · Bootstrap v5.2</title>

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
		<form method="post">
			<!-- <img class="mb-4" src="../assets/brand/bootstrap-logo.svg" alt=""
				width="72" height="57"> -->
			<h1 class="h3 mb-3 fw-normal">비밀번호 찾기</h1>

			<div
				class="form-floating d-flex justify-content-between align-items-center">
				<input type="text" class="form-control" id="id" name="mem_id"
					placeholder="아이디" required> <label for="floatingInput">아이디
				</label>
			</div>
			<div
				class="form-floating d-flex justify-content-between align-items-center">
				<input type="text" class="form-control" id="name" name="mem_name"
					placeholder="이름" required> <label for="floatingInput">이름
				</label>
			</div>
			<div
				class="form-floating d-flex justify-content-between align-items-center">
				<input type="text" class="form-control" id="tel" name="mem_hp"
					placeholder="연락처" required> <label for="floatingInput">전화번호
					입력 (- 없이 입력) </label>
				<button type="button" class="btn btn-primary" id="findPwChk">인증번호
					전송</button>
			</div>
			<div>
				<span id="disp"></span>
			</div>
			<div class="checkbox mb-3">
				<!-- <label> <input type="checkbox" value="remember-me">
					Remember me
				</label> -->
				<div></div>
			</div>
			<div
				class="form-floating d-flex justify-content-between align-items-center">
				<input type="text" class="form-control" id="num" name="mem_num"
					placeholder="인증번호" required style="display: none"> <label
					for="floatingInput" style="display: none">인증번호 6자리</label>
			</div>
			<div
				class="form-floating d-flex justify-content-between align-items-center">
				<button type="button" class="w-100 btn btn-lg btn-primary"
					id="findPwBtn" style="display: none">확인</button>

			</div>
			<!-- 			<p class="mt-5 mb-3 text-muted">&copy; 2017-2022</p> -->
		</form>
	</main>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		$('#findPwChk').on('click', function() {
			//영역초기화

			$('#disp').text("");

			//id정보 가져오기
			let idVal = $('#id').val();
			let nameVal = $('#name').val();
			let telVal = $('#tel').val();
			var inputNum = $('#num').val();
			//		alert(idVal+" "+nameVal+" "+hpVal);

			//입력된 id정보가 없는 경우(null체크)
			if (idVal.trim().length == 0)
				return;

			//jqueryAJAX
			$.ajax({
				url : 'findPwChk.jsp',
				type : 'post',
				// 		data:'key=value',
				data : {
					'id' : idVal,
					'name' : nameVal,
					'tel' : telVal
				},
				success : function(data) {
					console.log(data);
					if (data.code == "ok") {
						$('#disp').text(data.msg).css('color', 'green');
						$('#num').show(); // 인증번호 입력창 보이기
						$('#findPwBtn').show();
						alert("입력하신 휴대폰번호로 인증번호가 발송 되었습니다.");
						rndNum = data.rndNum;
					} else {
						$('#disp').text(data.msg).css('color', 'red');
					}
				},
				error : function(xhr) {
					alert("상태>>" + xhr.status);
				},
				dataType : 'json'
			});
		});

		var rndNum = 0;
		$('#findPwBtn').click(function() {
			var inputNum = $('#num').val();
			var idVal = $('#id').val();
			if (inputNum == rndNum) { // 사용자가 입력한 인증번호와 서버에서 발송한 인증번호가 일치할 때
				alert("인증이 완료되었습니다.");
				window.location.href = 'pwReset.jsp?id=' + idVal;
			} else {
				alert('인증번호가 일치하지 않습니다.');
			}
		});
	</script>
</body>
</html>
