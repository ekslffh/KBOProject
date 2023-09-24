<%@page import="kr.or.ddit.comm.vo.AtchFileVO"%>
<%@page import="kr.or.ddit.cart.vo.CartVO"%>
<%@page import="kr.or.ddit.product.service.ProductServiceImpl"%>
<%@page import="kr.or.ddit.product.service.IProductService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.product.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ProductVO pv = (ProductVO) request.getAttribute("pv");

	AtchFileVO atch = (AtchFileVO) request.getAttribute("atch");
%>
<!DOCTYPE html>
<html lang="en">
<head>


<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Item - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />

<style>
.dropdown-menu-wrapper {
	max-height: 200px; /* 드롭다운 메뉴의 최대 높이 */
	overflow-y: auto; /* 스크롤 가능하도록 설정 */
}

button span {
	display: flex;
	align-items: center;
}

div #bor {
	border-bottom: 1px solid grey;
}

.qty-check {
	color: yellow;
}

select {
	font-size: 15px;
	padding: 10px;
	border: 2px solid #ccc;
	border-radius: 5px;
	background-color: #fff;
	color: #555;
	width: 150px;
	height: 43px;
}

option {
	font-size: 15px;
	background-color: #fff;
	color: #555;
}
</style>
</head>

<body>

	<!-- Navigation-->
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
        </ul>
        <form class="d-flex" role="search">
          <ul class="navbar-nav me-auto mb-2 mb-md-0">
            <li class="nav-item"><a class="nav-link active" aria-current="page" href="Notice" style="margin-top:10px;">NOTICE</a></li>
<!-- onclick="location.href='Notice'" -->
            <div class="text-end" style="margin: 10px 30px">

				<button type="button" class="btn btn-outline-light me-2"
				onclick="location.href='WishProdController?memId=<%=memId%>';"><i class="bi bi-heart-fill me-1"></i>Wish</button>
				<button type="button" class="btn btn-outline-light me-2"
				onclick="location.href='cartProdController?memId=<%=memId%>';"><i class="bi-cart-fill me-1"></i>Cart</button>
				<button type="button" class="btn btn-outline-light me-2"
				onclick="location.href='Logout'">Logout</button>
			<button type="button" class="btn btn-warning"
				onclick="location.href='myPage'">Mypage</button>
		</div>
          </ul>

        </form>
      </div>
    </div>
  </nav>


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
        </ul>
        <form class="d-flex" role="search">
          <ul class="navbar-nav me-auto mb-2 mb-md-0">
            <li class="nav-item"><a class="nav-link active" aria-current="page" href="Notice">NOTICE</a></li>

            <div class="text-end" style="margin: 10px 30px">
			<button type="button" class="btn btn-outline-light me-2"
				onclick="location.href='Login'">Login</button>
		</div>
          </ul>

        </form>
      </div>
    </div>
  </nav>
</header>
	<%
		}
	%>
	
	<div>
	공백
		<br><br><br><br>
	</div>

	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0"
						src="http://localhost:8888/KBOProject/images/<%= atch.getStreFileNm()%>.<%= atch.getFileExtsn()%>"
						alt="상품정보" />
				</div>
				<div class="col-md-6">
					<div class="small mb-1">SKU: BST-498</div>
					<h1 class="display-5 fw-bolder" style="font-size: 47px;"><%=pv.getProdName()%></h1>
					<br>
					<div id="bor"></div>
					<br>
					<div class="fs-5 mb-5"
						style="font-size: 18px; font-family: Arial, sans-serif;">
						<span style="color: #999999; font-size: 16px; font-weight: bold;">판매가
							&nbsp;&nbsp;</span> <span
							style="color: #666666; font-size: 17px; font-weight: bold;"><%=pv.getProdPrice() + "원"%></span>
						<br> <br> <span
							style="color: #999999; font-size: 16px; font-weight: bold;">제조사
							&nbsp;&nbsp;</span> <span
							style="color: #666666; font-size: 17px; font-weight: bold;">multicket</span>
						<br> <br> <span
							style="color: #999999; font-size: 16px; font-weight: bold;">상품코드
							&nbsp;&nbsp;</span> <span
							style="color: #666666; font-size: 17px; font-weight: bold;"><%=pv.getProdNo()%></span>
					</div>


					<p class="lead"
						style="font-size: 14px; font-family: Arial, sans-serif;"><%=pv.getProdDetail()%></p>
					<br> <select name="quantity" id="quantity">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select> &nbsp;&nbsp;

					<button class="btn btn-outline-dark flex-shrink-0" type="button"
						onclick="payOneProduct()">
						<i class="bi bi-bag-fill me-1"></i> 구매하기
					</button>

					<br> <br>
					<div id="bor"></div>
					<br> <br>

					<button class="btn btn-outline-dark flex-shrink-0" type="button"
						onclick="addToCart()">
						<i class="bi-cart-fill me-1"></i> 장바구니
					</button>
					&nbsp;&nbsp;
					<button class="btn btn-outline-dark flex-shrink-0" type="button"
						onclick="addToWishList()">
						<i class="bi bi-heart-fill me-1"></i> 관심 상품
					</button>

					&nbsp;&nbsp;
					<button class="btn btn-outline-dark flex-shrink-0" type="button"
						onclick="goToQuestion()">
						<span> <i class="bi bi-question me-1"></i> 문의하기
						</span>
					</button>

<!-- 					&nbsp;&nbsp; -->
<!-- 					<button class="btn btn-outline-dark flex-shrink-0" type="button" -->
<!-- 						onclick="goToReview()"> -->
<!-- 						<span> <i class="bi bi-question me-1"></i> 리뷰쓰기 -->
<!-- 						</span> -->
<!-- 					</button> -->

					&nbsp;&nbsp;
					<button class="btn btn-outline-dark flex-shrink-0" type="button"
						onclick="goToProductList()">
						<span> <i class="bi-list me-1"></i> <a
							class="list-group-item list-group-item-action">목록으로</a>
						</span>
					</button>

				</div>
			</div>
		</div>
	</section>

	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; MULTICKET - DDIT 2023 </p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

	<script>
   
   function payOneProduct() {
       var quantity = document.getElementById("quantity").value;
       console.log("선택한 수량: " + quantity);
    <%if (loginCd == null) {%>
       alert('로그인이 필요합니다.');
          location.href = 'Login';
    <%} else {%>
//        alert('결제창 이동');
       location.href = 'OneOrderController?memId=<%=loginCd%>&prodNo=<%=pv.getProdNo()%>&quantity=' + quantity;
    <%}%>
       }

   	
      let selectQty = 0;
      function addToCart() {
   <%if (loginCd == null) {%>
      alert('로그인이 필요합니다.');
         location.href = 'Login';
   <%} else {%>
      const select = document.getElementById("quantity");
      selectQty = select.value;

          location.href = 'CartController?prodNo=<%=pv.getProdNo()%>&memId=<%=memId%>&ctQty=' + selectQty; 
   <%}%>
      }

      function addToWishList() {

<%if (loginCd == null) {%>
      alert('로그인이 필요합니다.');
         location.href = 'Login';
<%} else {%>
      location.href = 'WishListController?prodNo=<%=pv.getProdNo()%>&memId=<%=memId%>';
<%}%>
      }

<%String prodNo = pv.getProdNo();
String redirectUrl = "boardwrite.jsp?prodNo=" + prodNo;%>

      function goToQuestion() {
    	<%if (loginCd == null) {%>
    	      alert('로그인이 필요합니다.');
    	         location.href = 'Login';
    	<%} else {%>
    	location.href = '<%=redirectUrl%>';
    	<%}%>
       }
      
      <%
		String redirectUrl1 = "review.jsp?prodNo=" + prodNo;%>

       function goToReview() {
     	<%if (loginCd == null) {%>
     	      alert('로그인이 필요합니다.');
     	         location.href = 'Login';
     	<%} else {%>
     	location.href = '<%=redirectUrl1%>';
	<%}%>
		}

		function goToProductList() {
			location.href = 'ProductListController';
		}
	</script>

</body>