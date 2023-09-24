<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">
<title>Carousel Template · Bootstrap v5.2</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/carousel/">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>


<link href="https://fonts.googleapis.com/css2?family=Indie+Flower&display=swap" rel="stylesheet">


<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.nav-item a {
  text-decoration: none;
  color: inherit;
  font-family: 'Arial', sans-serif;
  font-weight: bold;
}

.navbar {
  overflow: hidden;
  width: 100%;
}

.nav-list {
  display: flex;
  list-style: none;
  padding: 0;
  margin: 0;
  width: 100%; /* 네비게이션 바의 전체 너비를 사용 */
}

.nav-item {
  flex: 1;
  text-align: center;
  padding: 10px;
  cursor: pointer;
  transition: all 0.3s ease;
  width: 10%; /* 각 아이템의 너비를 조정 */
}

.nav-item.active {
  background-color: #333;
  color: #fff;
}

.nav-item:hover {
  background-color: #ddd;
}

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

.col-lg-2 {
	width: 20%;
}

.row {
	text-align: center;
}

.carousel-item {
	height: 600px;
	margin-bottom: 30px;
}

.carousel-item img {
	height: 100%;
}
.navbar-brand {
    font-family: 'Indie Flower', cursive;
    /* 다른 스타일 속성도 추가로 적용할 수 있습니다. */
    
  }
 .custom-border {
  border: 1px solid gray;
  opacity: 0.4;
}
</style>


<!-- Custom styles for this template -->
<link href="carousel.css" rel="stylesheet">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<script
	src="http://mattstow.com/experiment/responsive-image-maps/jquery.rwdImageMaps.min.js"></script>
</head>
<body>

<%
String loginCd = (String) session.getAttribute("loginCode");
if (loginCd != null) {
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
            <li class="nav-item"><a class="nav-link active" aria-current="page" href="Notice">NOTICE</a></li>
<!-- onclick="location.href='Notice'" -->
            <div class="text-end" style="margin: 10px 30px">
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
<%
		} else { // 비회원
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
<%} %>
<div>
	공백
		<br><br>
	</div>
	<main>

		<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<!--       <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button> -->
			</div>
			<!--위에 이미지 전환  ------------------------------------------------------------------------------------------------------------------------->
			<div class="carousel-inner">
				<!--       <div class="carousel-item active"> -->
				<!--         <img src="assets/img/clubImages/banner4.PNG" width="100%" height="100%" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" alt="배너 1" style ="margin-bottom: 50px"><rect width="100%" height="100%" fill="#777"/> -->
				<!--       </div> -->

				<div class="carousel-item active">
					<!-- Image Map Generated by http://www.image-map.net/ -->
					<img src="assets/img/clubImages/banner2.jpg" usemap="#image-map"
						width="100%" height="100%" aria-hidden="true" alt="배너 2"
						style="margin-bottom: 50px">
					<rect width="100%" height="100%" fill="#777" />
				</div>
				<div class="carousel-item">
					<img src="assets/img/clubImages/banner3.jpg" usemap="#image-map"
						width="100%" height="100%" aria-hidden="true" alt="배너 3"
						style="margin-bottom: 50px">
					<rect width="100%" height="100%" fill="#777" />
				</div>
			</div>
			<map name="image-map">
				<area target="" alt="banner2" title="banner2"
					onclick="clickBanner(this)" coords="480,564,201,328" shape="rect">
				<area target="" alt="banner3" title="banner3"
					onclick="clickBanner(this)" coords="1333,393,1787,655" shape="rect">
			</map>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#myCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#myCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>

		<!-- Marketing messaging and featurettes
  ================================================== -->
		<!-- Wrap the rest of the page in another container to center all the content. -->

		<div class="container marketing">
			<br> <br>

			<!-- Three columns of text below the carousel -->
			&nbsp;&nbsp;<div class="row">
				&nbsp;&nbsp;<img src="assets/img/clubImages/HANWHA.png"
					style="width: 110px; height: 55px;">&nbsp;&nbsp;&nbsp;&nbsp;<img
					src="assets/img/clubImages/SSG.png"
					style="width: 105px; height: 60px;">&nbsp;&nbsp;&nbsp;&nbsp; <img
					src="assets/img/clubImages/KIWOOM.png"
					style="width: 110px; height: 60px;">&nbsp;&nbsp;&nbsp;&nbsp; <img
					src="assets/img/clubImages/LG.jpg"
					style="width: 110px; height: 60px;"> &nbsp;&nbsp;&nbsp;&nbsp;<img
					src="assets/img/clubImages/KT.png"
					style="width: 110px; height: 60px;"> &nbsp;&nbsp;&nbsp;<img
					src="assets/img/clubImages/KIA.png"
					style="width: 120px; height: 60px;">&nbsp;&nbsp;&nbsp;&nbsp; <img
					src="assets/img/clubImages/NC.png"
					style="width: 110px; height: 60px;">&nbsp;&nbsp;&nbsp;&nbsp; <img
					src="assets/img/clubImages/SAMSUNG.png"
					style="width: 110px; height: 70px;">&nbsp;&nbsp;&nbsp;<img
					src="assets/img/clubImages/LOTTE.png"
					style="width: 110px; height: 60px;">&nbsp;&nbsp;&nbsp; <img
					src="assets/img/clubImages/DOOSAN.png"
					style="width: 110px; height: 70px;">

				<div class="custom-border"></div>
				
				<div class="navbar">
					<ul class="nav-list">
						<li class="nav-item active"><a type="text" href="detailMatch?name=CB001" target="iframe1" style="text-decoration: none; color: inherit;">한화</a></li>
						<li class="nav-item"><a type="text" href="detailMatchs.jsp?name=CB002" target="iframe1" style="text-decoration: none; color: inherit;">SSG</a></li>
						<li class="nav-item"><a type="text" href="detailMatchs.jsp?name=CB003" target="iframe1" style="text-decoration: none; color: inherit;">키움</a></li>
						<li class="nav-item"><a type="text" href="detailMatchs.jsp?name=CB004" target="iframe1" style="text-decoration: none; color: inherit;">LG</a></li>
						<li class="nav-item"><a type="text" href="detailMatchs.jsp?name=CB005" target="iframe1" style="text-decoration: none; color: inherit;">KT</a></li>
						<li class="nav-item"><a type="text" href="detailMatchs.jsp?name=CB006" target="iframe1" style="text-decoration: none; color: inherit;">기아</a></li>
						<li class="nav-item"><a type="text" href="detailMatchs.jsp?name=CB007" target="iframe1" style="text-decoration: none; color: inherit;">NC</a></li>
						<li class="nav-item"><a type="text" href="detailMatchs.jsp?name=CB008" target="iframe1" style="text-decoration: none; color: inherit;">삼성</a></li>
						<li class="nav-item"><a type="text" href="detailMatchs.jsp?name=CB009" target="iframe1" style="text-decoration: none; color: inherit;">LOTTE</a></li>
						<li class="nav-item"><a type="text" href="detailMatchs.jsp?name=CB010" target="iframe1" style="text-decoration: none; color: inherit;">두산</a></li>
					</ul>
				</div>


<!-- 								<div class="col-lg-2"> -->
<!-- 									<div style="width: 90px; height: 90px; margin: 0 40px;"> -->
<!-- 										<img src="assets/img/clubImages/HANWHA.png" alt="한화 로고" -->
<!-- 											style="width: 160%; height: 100%; object-fit: cover;"> -->
<!-- 									</div> -->
<!-- 									<h2 class="fw-normal">한화</h2> -->
<!-- 									<p> -->
<!-- 										<a class="btn btn-secondary" href="detailMatch?name=CB001" -->
<!-- 											target="iframe1">경기일정</a> -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 								/.col-lg-4 -->

<!-- 								<div class="col-lg-2"> -->
<!-- 									<div style="width: 90px; height: 90px; margin: 0 73px;"> -->
<!-- 										<img src="assets/img/clubImages/SSG.png" alt="SSG 로고" -->
<!-- 											style="width: 100%; height: 100%; object-fit: cover;"> -->
<!-- 									</div> -->
<!-- 									<h2 class="fw-normal">SSG</h2> -->
<!-- 									<p> -->
<!-- 										<a class="btn btn-secondary" href="detailMatchs.jsp?name=CB002" -->
<!-- 											target="iframe1">경기일정</a> -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 								/.col-lg-4 -->

<!-- 								<div class="col-lg-2"> -->
<!-- 									<div style="width: 90px; height: 90px; margin: 0 55px;"> -->
<!-- 										<img src="assets/img/clubImages/KIWOOM.png" alt="키움 로고" -->
<!-- 											style="width: 140%; height: 100%;"> -->
<!-- 									</div> -->
<!-- 									<h2 class="fw-normal">키움</h2> -->
<!-- 									<p> -->
<!-- 										<a class="btn btn-secondary" href="detailMatchs.jsp?name=CB003" -->
<!-- 											target="iframe1">경기일정</a> -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 								/.col-lg-4 -->

<!-- 								<div class="col-lg-2"> -->
<!-- 									<div style="width: 90px; height: 90px; margin: 0 70px;"> -->
<!-- 										<img src="assets/img/clubImages/LG.jpg" alt="LG 로고" -->
<!-- 											style="width: 100%; height: 100%; object-fit: cover;"> -->
<!-- 									</div> -->
<!-- 									<h2 class="fw-normal">LG</h2> -->
<!-- 									<p> -->
<!-- 										<a class="btn btn-secondary" href="detailMatchs.jsp?name=CB004" -->
<!-- 											target="iframe1">경기일정</a> -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 								/.col-lg-4 -->

<!-- 								<div class="col-lg-2"> -->
<!-- 									<div style="width: 90px; height: 90px; margin: 0 70px;"> -->
<!-- 										<img src="assets/img/clubImages/KT.png" alt="KT 로고" -->
<!-- 											style="width: 90%; height: 90%; object-fit: cover;"> -->
<!-- 									</div> -->
<!-- 									<h2 class="fw-normal">KT</h2> -->
<!-- 									<p> -->
<!-- 										<a class="btn btn-secondary" href="detailMatchs.jsp?name=CB005" -->
<!-- 											target="iframe1">경기일정</a> -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 								/.col-lg-4 -->

<!-- 								<div class="col-lg-2"> -->
<!-- 									<div style="width: 90px; height: 90px; margin: 0 55px;"> -->
<!-- 										<img src="assets/img/clubImages/KIA.png" alt="KIA 로고" -->
<!-- 											style="width: 140%; height: 100%;"> -->
<!-- 									</div> -->
<!-- 									<h2 class="fw-normal">KIA</h2> -->
<!-- 									<p> -->
<!-- 										<a class="btn btn-secondary" href="detailMatchs.jsp?name=CB006" -->
<!-- 											target="iframe1">경기일정</a> -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 								/.col-lg-4 -->

<!-- 								<div class="col-lg-2"> -->
<!-- 									<div style="width: 90px; height: 90px; margin: 0 50px;"> -->
<!-- 										<img src="assets/img/clubImages/NC.png" alt="NC로고" -->
<!-- 											style="width: 160%; height: 100%;"> -->
<!-- 									</div> -->
<!-- 									<h2 class="fw-normal">NC</h2> -->
<!-- 									<p> -->
<!-- 										<a class="btn btn-secondary" href="detailMatchs.jsp?name=CB007" -->
<!-- 											target="iframe1">경기일정</a> -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 								/.col-lg-4 -->

<!-- 								<div class="col-lg-2"> -->
<!-- 									<div style="width: 90px; height: 90px; margin: 0 60px;"> -->
<!-- 										<img src="assets/img/clubImages/SAMSUNG.png" alt="삼성 로고" -->
<!-- 											style="width: 130%; height: 110%; object-fit: cover;"> -->
<!-- 									</div> -->
<!-- 									<h2 class="fw-normal">삼성</h2> -->
<!-- 									<p> -->
<!-- 										<a class="btn btn-secondary" href="detailMatchs.jsp?name=CB008" -->
<!-- 											target="iframe1">경기일정</a> -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 								/.col-lg-4 -->

<!-- 								<div class="col-lg-2"> -->
<!-- 									<div style="width: 90px; height: 90px; margin: 0 57px;"> -->
<!-- 										<img src="assets/img/clubImages/LOTTE.png" alt="롯데 로고" -->
<!-- 											style="width: 135%; height: 100%;"> -->
<!-- 									</div> -->
<!-- 									<h2 class="fw-normal">롯데</h2> -->
<!-- 									<p> -->
<!-- 										<a class="btn btn-secondary" href="detailMatchs.jsp?name=CB009" -->
<!-- 											target="iframe1">경기일정</a> -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 								/.col-lg-4 -->

<!-- 								<div class="col-lg-2"> -->
<!-- 									<div style="width: 90px; height: 90px; margin: 0 67px;"> -->
<!-- 										<img src="assets/img/clubImages/DOOSAN.png" alt="두산 로고" -->
<!-- 											style="width: 110%; height: 100%; object-fit: cover;"> -->
<!-- 									</div> -->
<!-- 									<h2 class="fw-normal">두산</h2> -->
<!-- 									<p> -->
<!-- 										<a class="btn btn-secondary" href="detailMatchs.jsp?name=CB010" -->
<!-- 											target="iframe1">경기일정</a> -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 				/.col-lg-4 -->

			</div>
			<!-- /.row -->


			<!-- START THE FEATURETTES -->
			<br><br>
			<hr class="featurette-divider">
			
			<div class="row featurette">
				<div class="col-md-12">
					<section id="Match">
						<iframe src="allMatchs.jsp" name="iframe1" frameborder="0"
							width=100% height="600"></iframe>
					</section>
				</div>
			</div>
			<hr class="featurette-divider">

			<!-- /END THE FEATURETTES -->

		</div>
		<!-- /.container -->

		<br><br>
		<!-- FOOTER -->
		<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Multicket</p>
		</div>
	</footer>
	</main>


	<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		function clickBanner(e) {
			console.log(e);
			window.location.href = 'http://localhost:8888/KBOProject/ProductListController';
		}
		
		const navItems = document.querySelectorAll('.nav-item');

		navItems.forEach(item => {
		  item.addEventListener('click', function() {
		    navItems.forEach(navItem => navItem.classList.remove('active'));
		    this.classList.add('active');
		  });
		});
	</script>

</body>
</html>
