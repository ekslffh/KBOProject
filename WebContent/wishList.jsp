<%@page import="kr.or.ddit.cartProd.dto.cartProdDto"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.wishProd.dto.wishProdDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<style>
.heart-icon {
	color: red;
	font-size: 16px;
	margin-right: 3px;
}

.heart-button {
	border: 1px solid red;
	transition: all 0.3s ease;
	position: relative;
}

.close-icon {
	position: absolute;
	top: 0;
	right: 0;
	padding: 5px;
	display: none;
}

.heart-button:hover .close-icon {
	display: block;
}

.close {
	display: inline-block;
	*display: inline;
}

.close:after {
	display: inline-block;
	content: "\00d7";
	font-size: 15pt;
}

footer {
	position: relative;
	bottom: 0;
	width: 100%;
}
</style>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Shop Homepage - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<style>
.heart-button:hover .heart-icon {
	color: black;
}
</style>
</head>
<body>
	<!-- Navigation-->
	<%
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
        </ul>
        <form class="d-flex" role="search">
          <ul class="navbar-nav me-auto mb-2 mb-md-0">
            <li class="nav-item"><a class="nav-link active" aria-current="page" href="Notice" style="margin-top:10px";>NOTICE</a></li>
<!-- onclick="location.href='Notice'" -->
            <div class="text-end" style="margin: 10px 30px">
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
</header>
	<!-- Header-->

	<!-- Section-->
	<div>
	공백
		<br><br><br><br>
	</div>
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<h2  style="margin-top: -55px; margin-left: -30px;">
				관심 상품
			</h2><br>
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<%
					List<wishProdDto> wishProdList = (List<wishProdDto>) request.getAttribute("wishProdList");
				for (wishProdDto wishProd : wishProdList) {
				%>
				<div class="col mb-5">
					<div class="card h-100">
						<br>
						<!-- Product image-->
						<img class="card-img-top"
							src="http://localhost:8888/KBOProject/images/<%=wishProd.getProdNo()%>.jpg"
							alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder"><%=wishProd.getProdName()%></h5>
								<!-- Product price-->
							</div>
						</div>

						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<div style="font-size: 17px;">
									<%=wishProd.getProdPrice()%>원
								</div>
								<br> <a class="btn btn-outline-dark mt-auto"
									href="ProdDetailController?prodNo=<%=wishProd.getProdNo()%>">상세
									정보</a>
								<button class="btn btn-outline-dark flex-shrink-0 heart-button"
									type="button" onclick="location.href='WishListDeleteController?prodNo=<%=wishProd.getProdNo()%>&memId=<%=memId%>'">
									<span class="heart-icon">&#10084;</span>
								</button>



							</div>

						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</section>
	<div>
		<br><br><br>

	</div>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2023</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>


</body>
</html>
