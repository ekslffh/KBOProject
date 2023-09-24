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
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

body {
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #f5f5f5;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
	text-align: center;
}

h3 {
	font-size: 24px;
	margin-top: 0;
}

p {
	font-size: 18px;
	margin-top: 20px;
	margin-bottom: 0;
}

button {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
	margin-top: 20px;
}

button:hover {
	background-color: #3e8e41;
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
			<h1 class="h3 mb-3 fw-normal">아이디 찾기</h1>

			<div class="form-floating d-flex justify-content-between align-items-center">
				<input type="text" class="form-control" name = "userName" id="userName"
					placeholder="이름 입력"> <label for="floatingInput" required>이름 입력
				</label>
			</div>
			<div class="form-floating d-flex justify-content-between align-items-center">
				<input type="text" class="form-control" name = "userTel" id="userTel"
					placeholder="전화번호 입력"> <label for="floatingInput">전화번호 입력 (- 없이 입력)
				</label>
			</div>

			<div class="checkbox mb-3">
				<!-- <label> <input type="checkbox" value="remember-me">
					Remember me
				</label> -->
				<div></div>
			</div>
<% 
		String findId = (String)request.getAttribute("findIdCode");
		if(findId == null || findId.trim().length() == 0) {
%>
		<div class="alert alert-danger" id="disp" style="display: none;">
		</div>
<%
	}
%>
			<button class="w-100 btn btn-lg btn-primary" type="button" id="findId">확인</button>
			<p class="mt-5 mb-3 text-muted">&copy; 2017-2022</p>
		</form>
	</main>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>

$('#findId').on('click',function(){

		//영역초기화
		$('#disp').text("");
		
		let nameVal = $('#userName').val();
		let telVal = $('#userTel').val();

		if (nameVal == "" || telVal == ""){
			$('#disp').text("정보를 입력해주세요.");
		}
		
		if(nameVal.trim().length == 0) return;
		if(telVal.trim().length == 0) return;
		
		//jqueryAJAX
		$.ajax({
			url:'FindId',
			type:'post',
			data:{'uName':nameVal, 'uTel':telVal},
			success:function(data){
				console.log(data);
				
 				const rst = JSON.parse(data);
// 				console.log('findIdCode:', rst.findIdCode)

				if(rst.findIdCode != null){
					console.log("데이터 있음");
					location.href ="findIdChk.jsp";
				}else{
					document.getElementById("disp").style.display = "block";
					$('#disp').text("이름과 연락처가 일치하지 않습니다.");
				}
			},
			error:function(xhr){
				alert("상태>>" + xhr.status);
			},
			dataType:'text'
		});
	});

</script>	


</body>
</html>
