<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>KBO SITE</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />
<img src="assets/img/clubImages/banner1.jpg">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />


<style>
.box-container {
	display: flex;
	justify-content: space-between;
}

.box {
	background-color: #fff;
	border: 1px solid black;
	padding: 20px;
	border-radius: 10px;
	margin-bottom: 20px;
}

.content {
	font-size: 20px;
	font-family: Arial, sans-serif;
	font-weight: bold;
	margin-bottom: 10px;
}

.box img {
	width: 80px;
	height: 80px;
	margin-right: 10px;
}

.box div:nth-child(2) {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

.box div:nth-child(3) {
	font-size: 18px;
}

.box div:nth-child(4) {
	margin-top: 10px;
}

.btn {
	border-radius: 20px;
	font-family: Arial, sans-serif;
	font-weight: bold;
}

table#news {
	width: 100%;
	border-collapse: collapse;
}

thead th {
	background-color: #f8f9fa;
	border-bottom: 2px solid #dee2e6;
	padding: 8px;
	text-align: center;
}

tbody td {
	border-bottom: 1px solid #dee2e6;
	padding: 8px;
}

tbody tr:hover {
	background-color: #f1f1f1;
}

a {
	text-decoration: none;
	color: #333;
}

a:hover {
	text-decoration: underline;
}

#contact {
	background-image: none;
	background-color: transparent;
}

.animated {
	animation-duration: 1s;
	animation-fill-mode: both;
}

.animate__pulse {
	animation-name: pulse;
	animation-duration: 2s;
	animation-iteration-count: infinite;
	animation-timing-function: ease-in-out;
	transform-origin: center;
	animation-delay: 0.5s;
}

@
keyframes pulse { 0% {
	transform: scale(1);
	box-shadow: 0 0 0 rgba(255, 0, 0, 0.5);
}

.animated {
        animation-duration: 1s;
        animation-fill-mode: both;
    }

    .animate__pulse {
        animation-name: pulse;
        animation-duration: 2s;
        animation-iteration-count: infinite;
        animation-timing-function: ease-in-out;
        transform-origin: center;
        animation-delay: 0.5s;
    }

    @keyframes pulse {
        0% {
            transform: scale(1);
            box-shadow: 0 0 0 rgba(255, 0, 0, 0.5);
        }
        50% {
            transform: scale(1.3);
            box-shadow: 0 0 20px rgba(255, 0, 0, 0.7);
        }
        100% {
            transform: scale(1);
            box-shadow: 0 0 0 rgba(255, 0, 0, 0.5);
        }
    }

div#bor {
	border: 1px solid gray;
}
</style>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		var element = document.querySelector(".animated");
		element.classList.add("animate__animated", "animate__pulse",
				"animate__infinite");
	});
</script>

</head>
<body id="page-top">
	<!-- Navigation-->
	<%
		// 회원
	String loginCd = (String) session.getAttribute("loginCode");
	if (loginCd != null) {
	%>
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top"><img
				style="width: 50px; height: 50px;"
				src="http://localhost:8888/KBOProject/images/logo.png" alt="..." /></a>
				<a class="navbar-brand" href="/KBOProject/" style="font-size:30px; padding-top: 10px;">Multicket</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars ms-1"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
					<li class="nav-item"><a class="nav-link" href="#services">TICKET</a></li>
					<li class="nav-item"><a class="nav-link" href="#portfolio">GOODS</a></li>
<!-- 					<li class="nav-item"><a class="nav-link" href="#about">NOTICE</a></li> -->
					<li class="nav-item"><a class="nav-link" href="#team">RANK</a></li>
					<li class="nav-item"><a class="nav-link" href="#contact">NEWS</a></li>
				</ul>
			</div>
		</div>
		<div class="text-end" style="margin: 0px 30px">
			<button type="button" class="btn btn-outline-light me-2"
				onclick="location.href='Logout'">Logout</button>
			<button type="button" class="btn btn-warning"
				onclick="location.href='myPage'">Mypage</button>
		</div>
	</nav>
	<%
		} else { // 비회원
	%>
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top"><img
				style="width: 50px; height: 50px;"
				src="http://localhost:8888/KBOProject/images/logo.png" alt="..." /></a>
				<a class="navbar-brand" href="/KBOProject/" style="font-size:35px; padding-top: 15px;">Multicket</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars ms-1"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
					<li class="nav-item"><a class="nav-link" href="#services">TICKET</a></li>
					<li class="nav-item"><a class="nav-link" href="#portfolio">GOODS</a></li>
<!-- 					<li class="nav-item"><a class="nav-link" href="#about">NOTICE</a></li> -->
					<li class="nav-item"><a class="nav-link" href="#team">RANK</a></li>
					<li class="nav-item"><a class="nav-link" href="#contact">NEWS</a></li>
				</ul>
			</div>
		</div>
		<div class="text-end" style="margin: 0px 30px">
			<button type="button" class="btn btn-outline-light me-2"
				onclick="location.href='Login'">Login</button>
			<button type="button" class="btn btn-warning"
				onclick="location.href='join.jsp'">Sign-up</button>
		</div>
	</nav>
	<%
		}
	%>
	<section class="page-section" id="services">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">
					TICKET
					<button type="button" class="btn btn-warning btn-sm"
						onclick="location.href='Match'">예매 바로가기</button>
				</h2>

			</div>
			<div class="row text-center">
				<div class="col-md-12">
					<br>
					<h3 class="my-3 fw-bold">Today</h3>
					<h4 class="my-3 fw-bold"><&nbsp;&nbsp;&nbsp;&nbsp;2023.05.19&nbsp;&nbsp;&nbsp;&nbsp;></h4>
					<br>
					<div class="box-container">
						<div class="box">
							<div class="content">
								잠실
								<button type="button"
									class="btn btn-success btn-primary btn-sm disabled">경기
									예정</button>
							</div>
							<div>
								<img src="http://localhost:8888/KBOProject/images/kt.png"
									width="80" height="80"> vs <img
									src="http://localhost:8888/KBOProject/images/lg.png" width="80"
									height="80">
							</div>
							<div style="font-size: 20px">
								<i class="fas fa-cloud"></i> | 18:30
							</div>
							<br>
							<div>
								<button type="button" class="btn btn-danger"
									onclick="location.href='Match'">예매하기</button>
							</div>
						</div>
						<div class="box">
							<div class="content">
								대구
								<button type="button"
									class="btn btn-success btn-primary btn-sm disabled">경기
									예정</button>
							</div>
							<div>
								<img src="http://localhost:8888/KBOProject/images/kia.png"
									width="80" height="80"> vs <img
									src="http://localhost:8888/KBOProject/images/ss.png" width="80"
									height="80">
							</div>
							<div style="font-size: 20px">
								<i class="fas fa-sun"></i> | 18:30
							</div>
							<br>
							<div>
								<button type="button" class="btn btn-danger"
									onclick="location.href='Match'">예매하기</button>
							</div>
						</div>
						<div class="box">
							<div class="content">
								창원
								<button type="button"
									class="btn btn-success btn-primary btn-sm disabled">경기
									예정</button>
							</div>
							<div>
								<img src="http://localhost:8888/KBOProject/images/ssg.png"
									width="70" height="70"> vs <img
									src="http://localhost:8888/KBOProject/images/nc.png" width="85"
									height="85">
							</div>
							<div style="font-size: 20px">
								<i class="fas fa-sun"></i> | 18:30
							</div>
							<br>
							<div>
								<button type="button" class="btn btn-danger"
									onclick="location.href='Match'">예매하기</button>
							</div>
						</div>
						<div class="box">
							<div class="content">
								고척
								<button type="button"
									class="btn btn-success btn-primary btn-sm disabled">경기
									예정</button>
							</div>
							<div>
								<img src="http://localhost:8888/KBOProject/images/ds.png"
									width="75" height="70"> vs <img
									src="http://localhost:8888/KBOProject/images/ki.png" width="80"
									height="80">
							</div>
							<div style="font-size: 20px">
								<i class="fas fa-cloud"></i> | 18:30
							</div>
							<br>
							<div>
								<button type="button" class="btn btn-danger"
									onclick="location.href='Match'">예매하기</button>
							</div>
						</div>
						<div class="box">
							<div class="content">
								대전
								<button type="button"
									class="btn btn-success btn-primary btn-sm disabled">경기
									예정</button>
							</div>
							<div>
								<img src="http://localhost:8888/KBOProject/images/lot.png"
									width="80" height="80"> vs <img
									src="http://localhost:8888/KBOProject/images/han.png"
									width="80" height="80">
							</div style="font-size: 20px">
							<div>
								<i class="fas fa-cloud"></i> | 18:30
							</div>
							<br>
							<div>
								<button type="button" class="btn btn-danger"
									onclick="location.href='Match'">예매하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Portfolio Grid-->
	<section class="page-section bg-light" id="portfolio">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">
					GOODS
					<button type="button" class="btn btn-warning btn-sm"
						onclick="location.href='ProductListController'">상품 더보기</button>
				</h2>
				<br>
				<h3 class="section-heading text-uppercase">
					<span class="badge bg-danger animated infinite pulse">NEW</span>
				</h3>
				<br>
			</div>
			<div class="row">
				<div class="col-lg-4 col-sm-6 mb-4">
					<!-- Portfolio item 1-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal1">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid"
							src="http://localhost:8888/KBOProject/images/H0008.jpg" alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">[NEW] [한화이글스]</div>
							<div class="portfolio-caption-heading">수리 키링</div>
							<div class="portfolio-caption-subheading text-muted">8,900원</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<!-- Portfolio item 2-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal2">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid"
							src="http://localhost:8888/KBOProject/images/H0010.jpg" alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">[NEW] [한화이글스]</div>
							<div class="portfolio-caption-heading">수리 오렌지 머리띠</div>
							<div class="portfolio-caption-subheading text-muted">18,000원</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<!-- Portfolio item 3-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal3">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid"
							src="http://localhost:8888/KBOProject/images/KT0008.jpg"
							alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">[NEW] [KT위즈]</div>
							<div class="portfolio-caption-heading">리본 볼캡</div>
							<div class="portfolio-caption-subheading text-muted">22,400원</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
					<!-- Portfolio item 4-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal4">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid"
							src="http://localhost:8888/KBOProject/images/SAM0005.jpg"
							alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">[NEW] [삼성라이온즈]</div>
							<div class="portfolio-caption-heading">젤펜 (BLUE)</div>
							<div class="portfolio-caption-subheading text-muted">4,000원</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
					<!-- Portfolio item 5-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal5">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid"
							src="http://localhost:8888/KBOProject/images/KT0015.jpg"
							alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">[NEW] [KT위즈]</div>
							<div class="portfolio-caption-heading">유니폼 뱃지</div>
							<div class="portfolio-caption-subheading text-muted">10,500원</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<!-- Portfolio item 6-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal6">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid"
							src="http://localhost:8888/KBOProject/images/LG0046.jpg"
							alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">[NEW] [LG트윈스]</div>
							<div class="portfolio-caption-heading">응원배트</div>
							<div class="portfolio-caption-subheading text-muted">10,000원</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
<!-- 	<!-- About--> -->
<!-- 	<section class="page-section" id="about"> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="text-center"> -->
<!-- 				<h2 class="section-heading text-uppercase"> -->
<!-- 					NOTICE -->
<!-- 					<button type="button" class="btn btn-warning btn-sm" -->
<!-- 						onclick="location.href='Notice'">더보기</button> -->
<!-- 				</h2> -->
<!-- 				<h3 class="section-subheading text-muted">Lorem ipsum dolor sit -->
<!-- 					amet consectetur.</h3> -->
<!-- 			</div> -->

<!-- 			<img src="http://localhost:8888/KBOProject/images/logo.png" -->
<!-- 				width="450" height="450"> <span class="speech-bubble" -->
<!-- 				style="font-size: 40px;">&nbsp;&nbsp;새로운 공지사항을 확인하세요.</span> -->

<!-- 		</div> -->
<!-- 	</section> -->
	<!-- Team-->
	<section class="page-section bg-light" id="team">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">
					RANK
					<button type="button" class="btn btn-warning btn-sm"
						onclick="location.href='rank.jsp'">더보기</button>
				</h2>
				<h3 class="section-subheading text-muted">전체 구단에서의 타자 순위와 투수 순위를 확인할 수 있습니다.</h3>
				<h2>TOP 3</h2>
				<br>
			</div>
			<div class="row">
				<div class="col-lg-4">
					<div class="team-member">
						<img class="mx-auto rounded-circle"
							src="http://localhost:8888/KBOProject/images/han.png" alt="..." />
						<h4>한화이글스</h4>
						<!--                             <p class="text-muted">한화이글스 / 타자</p> -->
					</div>
				</div>
				<div class="col-lg-4">
					<div class="team-member">
						<img class="mx-auto rounded-circle"
							src="http://localhost:8888/KBOProject/images/lot.png" alt="..." />
						<h4>롯데 자이언츠</h4>


					</div>
				</div>
				<div class="col-lg-4">
					<div class="team-member">
						<img class="mx-auto rounded-circle"
							src="http://localhost:8888/KBOProject/images/ki.png" alt="..." />
						<h4>키움 히어로즈</h4>

					</div>
				</div>
			</div>
		</div>
		<div style="display: flex; justify-content: center;">
			<img src="http://localhost:8888/KBOProject/images/gudan.png"
				alt="...">
		</div>
	</section>
	<div>
		<br> <br> <br> <br>
	</div>
	<section class="page-section" id="contact">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">
					NEWS
<!-- 					<button type="button" class="btn btn-warning btn-sm" -->
<!-- 						onclick="location.href='news.jsp'">더보기</button> -->
				</h2>

				<br>
				<form id="contactForm" data-sb-form-api-token="API_TOKEN">
					<div class="container">
						<div class="row">
							<div class="col-md-4">
								<div class="text-center">
									<h2>오늘의 뉴스</h2>
									<div id="bor"></div>
									<table id="news">
										<thead>
											<tr>
												<th style="font-size: 13px;">글번호</th>
												<th>글제목</th>
												<th>등록일</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>123</td>
												<td>
													<a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal">한화이글스, 10연승... 대기록...</a>
													 <!-- Modal -->
												    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
												        <div class="modal-dialog">
												            <div class="modal-content">
												                <div class="modal-header">
												                    <h1 class="modal-title fs-5" id="exampleModalLabel">한화이글스, 10연승... 대기록...</h1>
												                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												                </div>
												                <div class="modal-body">
<!-- 												                     <h1 style="color: #003087; font-size: 24px;">한화 이글스, 10연승으로 대기록 달성</h1> -->
																  <p>서울, 19일 (뉴스사) - 한국 프로야구팀 한화 이글스가 놀라운 기록을 세우며 야구 팬들의 눈길을 사로잡고 있다. 이들은 최근에 10연승을 차지하여 팀의 대기록을 경신했다.</p>
																  <p>한화 이글스는 최근 경기에서 한 팀을 상대로 화려한 경기력을 선보이며 10연승을 기록했다. 팀은 각 경기에서 격렬한 경쟁을 펼치며 탁월한 팀워크와 뛰어난 개인 능력을 발휘했다.</p>
																  <p>이러한 10연승은 한화 이글스의 역사에서 이루어진 가장 큰 성과로 평가받고 있다. 이는 팀의 강인한 의지와 열정, 그리고 강력한 팀 구성원들의 결집력에 기인한 것으로 여겨진다.</p>
																  <p style="font-style: italic;">기사: 최고기자</p>
												                </div>
												                <div class="modal-footer">
												                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
<!-- 												                    <button type="button" class="btn btn-primary">Save changes</button> -->
												                </div>
												            </div>
												        </div>
												    </div>
												</td>
												<td>2023.05.17</td>
											</tr>
											<tr>
												<td>122</td>
												<td><a href="#">"짧아도 임팩트 있게, 야망을 보여..</a></td>
												<td>2023.05.17</td>
											</tr>
											<tr>
												<td>121</td>
												<td><a href="#">야구 천재의 부활 조짐..."머리때..</a></td>
												<td>2023.05.16</td>
											</tr>
											<tr>
												<td>120</td>
												<td><a href="#">"부담 대신 야망을 가져라" 감독..</a></td>
												<td>2023.05.16</td>
											</tr>
											<tr>
												<td>119</td>
												<td><a href="#">경기 중 병원후송 두 선수, "상태..</a></td>
												<td>2023.05.15</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="col-md-4">
								<div class="text-center">
									<h2>인기 뉴스</h2>
									<div id="bor"></div>
									<table id="news">
										<thead>
											<tr>
												<th style="font-size: 13px;">글번호</th>
												<th>글제목</th>
												<th>조회수</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>51</td>
												<td><a href="#">"롯데 기둥이 될 선수" 고작 19...</a></td>
												<td>90,555</td>
											</tr>
											<tr>
												<td>67</td>
												<td><a href="#">"함께 잘해서 같이 가고 싶다" 미래...</a></td>
												<td>90,225</td>
											</tr>
											<tr>
												<td>100</td>
												<td><a href="#">수베로 "경질 여러 번 당해봤는데 이...</a></td>
												<td>89,600</td>
											</tr>
											<tr>
												<td>32</td>
												<td><a href="#">'코치가 투수 멱살을...' 때 아닌...</a></td>
												<td>70,782</td>
											</tr>
											<tr>
												<td>101</td>
												<td><a href="#">꺾이지 않는 롯데 기세, DTD 없다...</a></td>
												<td>68,800</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="col-md-4">
								<div class="text-center">
									<h2>하이라이트 영상</h2>
									<div id="bor"></div>
									<table id="news">
										<thead>
											<tr>
												<th style="font-size: 13px;">글번호</th>
												<th>글제목</th>
												<th>조회수</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>54</td>
												<td><a href="#">문동주 선수의 경기 전 인터뷰</a></td>
												<td>2023.05.17</td>
											</tr>
											<tr>
												<td>53</td>
												<td><a href="#">경기 전 라이온즈 파크에서 열린...</a></td>
												<td>2023.05.17</td>
											</tr>
											<tr>
												<td>52</td>
												<td><a href="#">'롯데의 봄은 11월까지다' 다시...</a></td>
												<td>2023.05.16</td>
											</tr>
											<tr>
												<td>51</td>
												<td><a href="#">한화, 롯데 꺾고 1위 탈환하다...</a></td>
												<td>2023.05.16</td>
											</tr>
											<tr>
												<td>50</td>
												<td><a href="#">'7회 빅이닝'KIA, 삼성에 대...</a></td>
												<td>2023.05.15</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>

					</div>
			</div>


		</div>
		</div>
		</form>
		</div>
		<br> <br> <br> <br>
		<!-- Footer-->
		<footer class="footer py-4">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-4 text-lg-start">Copyright &copy; Your
						Website 2023</div>
					<div class="col-lg-4 my-3 my-lg-0">
						<a class="btn btn-dark btn-social mx-2" href="#!"
							aria-label="Twitter"><i class="fab fa-twitter"></i></a> <a
							class="btn btn-dark btn-social mx-2" href="#!"
							aria-label="Facebook"><i class="fab fa-facebook-f"></i></a> <a
							class="btn btn-dark btn-social mx-2" href="#!"
							aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
					</div>
					<div class="col-lg-4 text-lg-end">
						<a class="link-dark text-decoration-none me-3" href="#!">Privacy
							Policy</a> <a class="link-dark text-decoration-none" href="#!">Terms
							of Use</a>
					</div>
				</div>
			</div>
		</footer>
		<!-- Portfolio Modals-->
		<!-- Portfolio item 1 modal popup-->
		<div class="portfolio-modal modal fade" id="portfolioModal1"
			tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="close-modal" data-bs-dismiss="modal">
						<img src="assets/img/close-icon.svg" alt="Close modal" />
					</div>
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<div class="modal-body">
									<!-- Project details-->
									<h2 class="text-uppercase">수리 키링</h2>
									<p class="item-intro text-muted">한화이글스</p>
									<img class="img-fluid d-block mx-auto"
										src="http://localhost:8888/KBOProject/images/suri.png"
										alt="..." /> <br>
									<p>
										<strong>WASHING 
									</p>
									<p>
										세탁시 주의사항</strong>
									</p>
									<p>
										1. 사이즈 측정은 상품을 바닥에 내려놓은 상태에서 끝선과 끝선을 기준합니다. <br>2. 사이즈
										단위는 cm이며, 재는 위치와 사람에 따라 약간의 오차가 발생할 수 있습니다. <br>3. 모니터
										기종이나 해상도에 따라 색상 차이가 있을 수 있습니다. <br>4. 보존 시 적당한 온도와 습도에서
										보관 바랍니다. <br>5. 부드러운 천으로 가볍게 닦아주시고, 알코올이나 물티슈로 닦을 시 제품에
										손상이 갑니다.
									</p>
									<ul class="list-inline">
										<li><strong>Client:</strong> Threads</li>
										<li><strong>Category:</strong> Illustration</li>
									</ul>
									<button class="btn btn-primary btn-xl text-uppercase"
										data-bs-dismiss="modal" type="button">
										<i class="fas fa-xmark me-1"></i> Close Project
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Portfolio item 2 modal popup-->
		<div class="portfolio-modal modal fade" id="portfolioModal2"
			tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="close-modal" data-bs-dismiss="modal">
						<img src="assets/img/close-icon.svg" alt="Close modal" />
					</div>
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<div class="modal-body">
									<!-- Project details-->
									<h2 class="text-uppercase">수리 오렌지 머리띠</h2>
									<p class="item-intro text-muted">한화이글스</p>
									<img class="img-fluid d-block mx-auto"
										src="http://localhost:8888/KBOProject/images/suri1.png"
										alt="..." /> <br>
									<p>
										<strong>WASHING 
									</p>
									<p>
										세탁시 주의사항</strong>
									</p>
									<p>
										1. 사이즈 측정은 상품을 바닥에 내려놓은 상태에서 끝선과 끝선을 기준합니다. <br>2. 사이즈
										단위는 cm이며, 재는 위치와 사람에 따라 약간의 오차가 발생할 수 있습니다. <br>3. 모니터
										기종이나 해상도에 따라 색상 차이가 있을 수 있습니다. <br>4. 보존 시 적당한 온도와 습도에서
										보관 바랍니다. <br>5. 부드러운 천으로 가볍게 닦아주시고, 알코올이나 물티슈로 닦을 시 제품에
										손상이 갑니다.
									</p>
									<ul class="list-inline">
										<li><strong>Client:</strong> Explore</li>
										<li><strong>Category:</strong> Graphic Design</li>
									</ul>
									<button class="btn btn-primary btn-xl text-uppercase"
										data-bs-dismiss="modal" type="button">
										<i class="fas fa-xmark me-1"></i> Close Project
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Portfolio item 3 modal popup-->
		<div class="portfolio-modal modal fade" id="portfolioModal3"
			tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="close-modal" data-bs-dismiss="modal">
						<img src="assets/img/close-icon.svg" alt="Close modal" />
					</div>
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<div class="modal-body">
									<!-- Project details-->
									<h2 class="text-uppercase">리본 볼캡</h2>
									<p class="item-intro text-muted">KT위즈</p>
									<img class="img-fluid d-block mx-auto"
										src="http://localhost:8888/KBOProject/images/KT0008.jpg"
										alt="..." /> <br>
									<p>
										<strong>WASHING 
									</p>
									<p>
										세탁시 주의사항</strong>
									</p>
									<p>
										1. 사이즈 측정은 상품을 바닥에 내려놓은 상태에서 끝선과 끝선을 기준합니다. <br>2. 사이즈
										단위는 cm이며, 재는 위치와 사람에 따라 약간의 오차가 발생할 수 있습니다. <br>3. 모니터
										기종이나 해상도에 따라 색상 차이가 있을 수 있습니다. <br>4. 보존 시 적당한 온도와 습도에서
										보관 바랍니다. <br>5. 부드러운 천으로 가볍게 닦아주시고, 알코올이나 물티슈로 닦을 시 제품에
										손상이 갑니다.
									</p>
									<ul class="list-inline">
										<li><strong>Client:</strong> Finish</li>
										<li><strong>Category:</strong> Identity</li>
									</ul>
									<button class="btn btn-primary btn-xl text-uppercase"
										data-bs-dismiss="modal" type="button">
										<i class="fas fa-xmark me-1"></i> Close Project
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Portfolio item 4 modal popup-->
		<div class="portfolio-modal modal fade" id="portfolioModal4"
			tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="close-modal" data-bs-dismiss="modal">
						<img src="assets/img/close-icon.svg" alt="Close modal" />
					</div>
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<div class="modal-body">
									<!-- Project details-->
									<h2 class="text-uppercase">젤펜</h2>
									<p class="item-intro text-muted">삼성라이온즈</p>
									<img class="img-fluid d-block mx-auto"
										src="http://localhost:8888/KBOProject/images/SAM0005.jpg"
										alt="..." /> <br>
									<p>
										<strong>WASHING 
									</p>
									<p>
										세탁시 주의사항</strong>
									</p>
									<p>
										1. 사이즈 측정은 상품을 바닥에 내려놓은 상태에서 끝선과 끝선을 기준합니다. <br>2. 사이즈
										단위는 cm이며, 재는 위치와 사람에 따라 약간의 오차가 발생할 수 있습니다. <br>3. 모니터
										기종이나 해상도에 따라 색상 차이가 있을 수 있습니다. <br>4. 보존 시 적당한 온도와 습도에서
										보관 바랍니다. <br>5. 부드러운 천으로 가볍게 닦아주시고, 알코올이나 물티슈로 닦을 시 제품에
										손상이 갑니다.
									</p>
									<ul class="list-inline">
										<li><strong>Client:</strong> Lines</li>
										<li><strong>Category:</strong> Branding</li>
									</ul>
									<button class="btn btn-primary btn-xl text-uppercase"
										data-bs-dismiss="modal" type="button">
										<i class="fas fa-xmark me-1"></i> Close Project
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Portfolio item 5 modal popup-->
		<div class="portfolio-modal modal fade" id="portfolioModal5"
			tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="close-modal" data-bs-dismiss="modal">
						<img src="assets/img/close-icon.svg" alt="Close modal" />
					</div>
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<div class="modal-body">
									<!-- Project details-->
									<h2 class="text-uppercase">유니폼 뱃지</h2>
									<p class="item-intro text-muted">KT위즈</p>
									<img class="img-fluid d-block mx-auto"
										src="http://localhost:8888/KBOProject/images/KT0015.jpg"
										alt="..." /> <br>
									<p>
										<strong>WASHING 
									</p>
									<p>
										세탁시 주의사항</strong>
									</p>
									<p>
										1. 사이즈 측정은 상품을 바닥에 내려놓은 상태에서 끝선과 끝선을 기준합니다. <br>2. 사이즈
										단위는 cm이며, 재는 위치와 사람에 따라 약간의 오차가 발생할 수 있습니다. <br>3. 모니터
										기종이나 해상도에 따라 색상 차이가 있을 수 있습니다. <br>4. 보존 시 적당한 온도와 습도에서
										보관 바랍니다. <br>5. 부드러운 천으로 가볍게 닦아주시고, 알코올이나 물티슈로 닦을 시 제품에
										손상이 갑니다.
									</p>
									<ul class="list-inline">
										<li><strong>Client:</strong> Southwest</li>
										<li><strong>Category:</strong> Website Design</li>
									</ul>
									<button class="btn btn-primary btn-xl text-uppercase"
										data-bs-dismiss="modal" type="button">
										<i class="fas fa-xmark me-1"></i> Close Project
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Portfolio item 6 modal popup-->
		<div class="portfolio-modal modal fade" id="portfolioModal6"
			tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="close-modal" data-bs-dismiss="modal">
						<img src="assets/img/close-icon.svg" alt="Close modal" />
					</div>
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<div class="modal-body">
									<!-- Project details-->
									<h2 class="text-uppercase">응원 배트</h2>
									<p class="item-intro text-muted">LG트윈스</p>
									<img class="img-fluid d-block mx-auto"
										src="http://localhost:8888/KBOProject/images/LG0046.jpg"
										alt="..." /> <br>
									<p>
										<strong>WASHING 
									</p>
									<p>
										세탁시 주의사항</strong>
									</p>
									<p>
										1. 사이즈 측정은 상품을 바닥에 내려놓은 상태에서 끝선과 끝선을 기준합니다. <br>2. 사이즈
										단위는 cm이며, 재는 위치와 사람에 따라 약간의 오차가 발생할 수 있습니다. <br>3. 모니터
										기종이나 해상도에 따라 색상 차이가 있을 수 있습니다. <br>4. 보존 시 적당한 온도와 습도에서
										보관 바랍니다. <br>5. 부드러운 천으로 가볍게 닦아주시고, 알코올이나 물티슈로 닦을 시 제품에
										손상이 갑니다.
									</p>
									<ul class="list-inline">
										<li><strong>Client:</strong> Window</li>
										<li><strong>Category:</strong> Photography</li>
									</ul>
									<button class="btn btn-primary btn-xl text-uppercase"
										data-bs-dismiss="modal" type="button">
										<i class="fas fa-xmark me-1"></i> Close Project
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Bootstrap core JS-->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="js/scripts.js"></script>
		<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
