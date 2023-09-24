<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.rating-stars {
	display: inline-block;
	vertical-align: middle;
}

.rating-stars input[type="radio"] {
	display: none;
}

.rating-stars label {
	color: #ddd;
	font-size: 2rem;
	padding: 0;
	cursor: pointer;
}

.rating-stars label:hover, .rating-stars label:hover ~ label,
	.rating-stars input[type="radio"]:checked ~ label {
	color: #FFD700;
}
</style>
</head>
<body>
	<%
		String memId = (String) session.getAttribute("memId");
	%>
	<div class="container">
		<h2>리뷰 작성</h2>

		<form action="InsertReview" method="POST">

			<div class="mb-3 col-sm-4">
				<label>상품코드 : </label> <span id="prodNoElement"></span>
			</div>

			<div class="mb-3 col-sm-4">
				<label>아이디 : </label> <span id="memId"><%=memId%></span>
			</div>

			<div class="mb-3 col-sm-4">
				<label>작성일시 : </label> <span id="sysdate"></span>
			</div>

			<div class="mb-3 col-sm-12">
				<label for="content">내용*</label>
				<textarea class="form-control" name="content" id="revContent"
					placeholder="내용을 입력해 주세요" rows="5" required></textarea>
			</div>

			<div class="form-group">
				<label for="rating">평점:</label>
				<div class="rating-stars">
					<input type="radio" name="rating" id="rating1" value="1" required>
					<label for="rating1">&#9733;</label> 
					<input type="radio" name="rating" id="rating2" value="2" required> <label
						for="rating2">&#9733;</label> 
					<input type="radio" name="rating" id="rating3" value="3" required> <label for="rating3">&#9733;</label>
					<input type="radio" name="rating" id="rating4" value="4" required>
					<label for="rating4">&#9733;</label> 
					<input type="radio" name="rating" id="rating5" value="5" required> <label
						for="rating5">&#9733;</label>
				</div>
			</div>

			<button type="submit" class="btn btn-primary" id="btnSave"
				onclick="sendData()">리뷰 작성</button>
		</form>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script>
		// 별 모양 평점 표시
		 $(document).ready(function() {
    $('.rating-stars input').change(function() {
        var ratingValue = parseInt($(this).val());
        var $ratingStars = $('.rating-stars label');
        $ratingStars.removeClass('text-warning');
        $ratingStars.slice(5, ratingValue).addClass('text-warning');
    });

    $('.rating-stars label').click(function() {
        var ratingValue = parseInt($(this).prevAll('input').val());
        var $ratingStars = $('.rating-stars label');
        $ratingStars.removeClass('text-warning');
        $ratingStars.slice(5, ratingValue).addClass('text-warning');
    });
});

		function sendData() {
			var prodNo = document.getElementById("prodNoElement").textContent;
			var memId = document.getElementById("memId").textContent;
			var sysdate = document.getElementById("sysdate").textContent;
			var revContent = document.getElementById("revContent").value; // 글 내용을 가져옵니다.

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
			  
			  var hiddenRevContent = document.createElement("input");
			  hiddenRevContent.setAttribute("type", "hidden");
			  hiddenRevContent.setAttribute("name", "revContent");
			  hiddenRevContent.setAttribute("value", revContent);
			  
			  var form = document.querySelector("form");
			  form.appendChild(hiddenProdNo);
			  form.appendChild(hiddenMemId);
			  form.appendChild(hiddenSysdate);
			  form.appendChild(hiddenRevContent);
			  
			  form.submit();
		}
		
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