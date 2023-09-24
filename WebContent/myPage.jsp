<%@page import="kr.or.ddit.ticket.service.TicketServiceImpl"%>
<%@page import="kr.or.ddit.ticket.service.ITicketService"%>
<%@page import="kr.or.ddit.ticket.vo.TicketVO"%>
<%@page import="kr.or.ddit.wishProd.service.IWishProdService"%>
<%@page import="kr.or.ddit.wishProd.service.WishProdServiceImpl"%>
<%@page import="kr.or.ddit.wishProd.dto.wishProdDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="kr.or.ddit.cartProd.dto.cartProdDto"%>
<%@page import="kr.or.ddit.cartProd.service.CartProdServiceImpl"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.cartProd.service.ICartProdService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
	String memId = (String) request.getAttribute("memId");
String sessionMemId = (String) request.getSession().getAttribute("memId");

ICartProdService cartProdService = CartProdServiceImpl.getInstance();
IWishProdService wishProdService = WishProdServiceImpl.getInstance();
ITicketService tiketService = TicketServiceImpl.getInstance();

List<cartProdDto> cartProdList = cartProdService.getCartProdList(sessionMemId);
List<wishProdDto> wishProdList = wishProdService.getWishProdList(sessionMemId);
List<TicketVO> ticketList = tiketService.findByMemId(sessionMemId);

MemberVO mv = (MemberVO) session.getAttribute("mv");

/* request.setAttribute("cartProdList", cartProdList); */

/* request.getRequestDispatcher("/cart.jsp").forward(request, response); */
%>
<head>
<style>
/* 회원정보 페이지 시작 */
.section-MyPage {
	padding-top: 100px;
	padding-bottom: 50px;
}

.section-MyPage>form>.section-MyPage-body {
	text-align: left;
	font-size: 1rem;
	font-weight: bold;
	border-radius: 20px 20px 20px 20px;
	box-shadow: 5px 10px 10px 10px gray;
	padding: 50px;
	margin-top: -100px;
}

.section-MyPage-body>div:first-child {
	font-size: 2rem;
	padding-right: 30px;
	text-shadow: 3px 3px 5px gray;
}

.section-MyPage-body__cell {
	padding: 10px 50px;
	/*    width: 280px; */
}

.section-MyPage-body__cell:nth-child(2) {
	padding-right: 0px;
}

.section-MyPage-body__cell:last-child {
	border-left: 4px solid gray;
}

.MyPage_cell__title {
	margin-bottom: 10px;
	font-size: 1.1rem;
}

.MyPage_cell__title>span {
	padding-bottom: 3px;
	border-bottom: 3px solid gray;
}

.MyPage_cell__body {
	font-size: 0.9rem;
	font-weight: normal;
	background-color: white;
	height: 50px;
	padding-top: 10px;
	display: flex;
	align-items: center;
}

.MyPage_cell__body>input {
	font-size: 0.9rem;
	height: 30px;
	padding-top: 10px;
	font-weight: normal;
	border: none;
	border-bottom: 1.5px solid #333;
	display: flex;
	align-items: center;
}

.MyPage_cell__body>.btn {
	margin-left: 5px;
	font-size: 0.7rem;
	width: 90px;
}

.section-MyPage-body__option button {
	margin-left: 10px;
}

.section-MyPage-body__image {
	display: flex;
	justify-content: flex-end;
	width: 100%;
}

.mypage_wrap {
	margin-top: -490px
}

.section-MyPage-body__image {
	justify-content: center;
	align-items: center;
	margin-top: 120p;
	height: 500px;
	margin-left: 110px;
}

/* 회원정보 페이지 끝 */
</style>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous">
   
</script>

<title>iPortfolio Bootstrap Template - Index</title>
<meta content="" name="description">
<meta content="" name="keywords">
<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">


<!-- Vendor CSS Files -->
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="css/Mypage.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: iPortfolio
  * Updated: Mar 10 2023 with Bootstrap v5.2.3
  * Template URL: https://bootstrapmade.com/iportfolio-bootstrap-portfolio-websites-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->

</head>

<body>

	<p style="float: right; margin-top: 20px; margin-right: 10px;">

		</button>
		<button type="button" class="btn btn-outline-warning me-2"
			onclick="location.href='Match'">Ticket</button>
		<button type="button" class="btn btn-outline-warning me-2"
			onclick="location.href='ProductListController'">Goods</button>
		<button type="button" class="btn btn-outline-warning me-2"
			onclick="location.href='Logout'">Logout</button>
	</p>
	<div>
	<br><br>
	</div>


	<!-- ======= Mobile nav toggle button ======= -->
	<i class="bi bi-list mobile-nav-toggle d-xl-none"></i>

	<!-- ======= Header ======= -->
	<header id="header">
		<div class="d-flex flex-column">
			<%--          
                style="margin-top: -80px" 이거 header에 넣기
                <div class="profile">
            <%
               if (mv.getCbNo().toString().equals("CB001")) {
            %>
            <img src="assets/img/clubImages/HANWHA.png" alt="">
            <%
               } else if (mv.getCbNo().toString().equals("CB002")) {
            %>
            <img src="assets/img/clubImages/SSG랜더.png" alt="">
            <%
               } else if (mv.getCbNo().toString().equals("CB003")) {
            %>
            <img src="assets/img/clubImages/키움히어로즈.png" alt="">
            <%
               } else if (mv.getCbNo().toString().equals("CB004")) {
            %>
            <img src="assets/img/clubImages/LG트윈스.png" alt="">
            <%
               } else if (mv.getCbNo().toString().equals("CB005")) {
            %>
            <img src="assets/img/clubImages/kt wiz.png" alt="">
            <%
               } else if (mv.getCbNo().toString().equals("CB006")) {
            %>
            <img src="assets/img/clubImages/kia타이거즈.png" alt="">
            <%
               } else if (mv.getCbNo().toString().equals("CB007")) {
            %>
            <img src="assets/img/clubImages/nc다이노스.png" alt="">
            <%
               } else if (mv.getCbNo().toString().equals("CB008")) {
            %>
            <img src="assets/img/clubImages/samsung lions.png" alt="">
            <%
               } else if (mv.getCbNo().toString().equals("CB009")) {
            %>
            <img src="assets/img/clubImages/롯데자이언츠.png" alt="">
            <%
               } else if (mv.getCbNo().toString().equals("CB010")) {
            %>
            <img src="assets/img/clubImages/doosanbears.png" alt="">
            <%
               }
            %>
         </div> --%>

         <div class="profile" style="margin-top: -80px;">
            <img src="assets/img/clubImages/MyPageIcon.png" onclick="goToKBOProject()">
         </div>
         <h1 class="text-light Mem_name">
            <a href="#"><%=mv.getMemName()%></a>
         </h1>
         <!-- 왼쪽 내비바 ---------------------------------------------------------------------------------------------->
         <nav id="navbar" class="nav-menu navbar">
            <ul>
               <li><a href="#about" class="nav-link scrollto"><i
                     class="bx bx-user"></i> <span>회원 정보</span></a></li>
               <li><a href="#updateAbout" class="nav-link scrollto"><i
                     class="bx bx-home"></i> <span>회원 정보 수정</span></a></li>
               <li><a href="#resume" class="nav-link scrollto"><i
                     class="bx bx-file-blank"></i> <span>예매 내역</span></a></li>
               <li><a href="#cart" class="nav-link scrollto"><i
                     class="bx bx-book-content"></i> <span>장바구니</span></a></li>
               <li><a href="#services" class="nav-link scrollto"><i
                     class="bx bx-user"></i> <span>관심상품</span></a></li>
               <li><a href="#contact" class="nav-link scrollto"><i
                     class="bx bx-envelope"></i> <span>문의 내역</span></a></li>
            </ul>
         </nav>
         <!-- .nav-menu -->
      </div>
   </header>
   <script>
function goToKBOProject() {
  window.location.href = "/KBOProject/";
}
</script>
   <!-- End Header -->
>>>>>>> .r327146

	<main id="main">

		<!-- ======= 회원정보 Section ======= -->
		<section id="about" class="about">
			<div class="container">
				<div
					class="section-MyPage min-height-50vh flex flex-jc-c flex-ai-c " style="margin-left:50px;">
					<form name="form" onsubmit="check(this); return false;"
						action="doModifyInfo" method="POST">
						<div class="section-MyPage-body flex flex-jc-c flex-ai-c">
							<div>회원 정보</div>
							<div class="section-MyPage-body__cell">
								<div class="section-MyPage-body__image">
									<div class="profile">
										<%
											if (mv.getCbNo().toString().equals("CB001")) {
										%>
										<img src="assets/img/clubImages/HANWHA.png"
											style="width: 400px;">
										<%
											} else if (mv.getCbNo().toString().equals("CB002")) {
										%>
										<img src="assets/img/clubImages/SSG랜더.png"
											style="width: 400px;">
										<%
											} else if (mv.getCbNo().toString().equals("CB003")) {
										%>
										<img src="assets/img/clubImages/키움히어로즈.png"
											style="width: 400px;">
										<%
											} else if (mv.getCbNo().toString().equals("CB004")) {
										%>
										<img src="assets/img/clubImages/LG트윈스.png"
											style="width: 400px;">
										<%
											} else if (mv.getCbNo().toString().equals("CB005")) {
										%>
										<img src="assets/img/clubImages/kt wiz.png"
											style="width: 400px;">
										<%
											} else if (mv.getCbNo().toString().equals("CB006")) {
										%>
										<img src="assets/img/clubImages/kia타이거즈.png"
											style="width: 400px;">
										<%
											} else if (mv.getCbNo().toString().equals("CB007")) {
										%>
										<img src="assets/img/clubImages/nc다이노스.png"
											style="width: 400px;">
										<%
											} else if (mv.getCbNo().toString().equals("CB008")) {
										%>
										<img src="assets/img/clubImages/samsung lions.png"
											style="width: 400px;">
										<%
											} else if (mv.getCbNo().toString().equals("CB009")) {
										%>
										<img src="assets/img/clubImages/롯데자이언츠.png"
											style="width: 400px;">
										<%
											} else if (mv.getCbNo().toString().equals("CB010")) {
										%>
										<img src="assets/img/clubImages/doosanbears.png"
											style="width: 400px;">
										<%
											}
										%>
									</div>
								</div>


								<div class="mypage_wrap">

									<div class="MyPage_cell__title"></div>

									<div class="MyPage_cell__title">
										<span>I D</span>
										<div class="MyPage_cell__body">
											<span><%=mv.getMemId()%></span>
										</div>
									</div>
									<div class="MyPage_cell__title">
										<span>Name</span>
										<div class="MyPage_cell__body">
											<span><%=mv.getMemName()%></span>
										</div>
									</div>
									<div class="MyPage_cell__title">
										<span>Gender</span>
										<div class="MyPage_cell__body">
											<span><%=mv.getMemGender()%></span>
										</div>
									</div>
									<div class=MyPage_cell__title>
										<span>E-mail</span>
										<div class=MyPage_cell__body>
											<span><%=mv.getMemEmail()%></span>
										</div>
									</div>
									<div class=MyPage_cell__title>
										<span>Tell</span>
										<div class=MyPage_cell__body>
											<span><%=mv.getMemTel()%></span>
										</div>
									</div>
									<div class="MyPage_cell__title">
										<span>Address</span>
										<div class="MyPage_cell__body">
											<span><%=mv.getMemAdd()%></span>
										</div>
									</div>
									<div class="MyPage_cell__title">
										<span>My Team</span>
										<div class="MyPage_cell__body">
											<span> <%
 	if (mv.getCbNo().toString().equals("CB001")) {
 %> 한화 이글스 <%
 	} else if (mv.getCbNo().toString().equals("CB002")) {
 %> SSG 랜더스 <%
 	} else if (mv.getCbNo().toString().equals("CB003")) {
 %> 키움 히어로스 <%
 	} else if (mv.getCbNo().toString().equals("CB004")) {
 %> LG 트윈스 <%
 	} else if (mv.getCbNo().toString().equals("CB005")) {
 %> KT 위즈 <%
 	} else if (mv.getCbNo().toString().equals("CB006")) {
 %> KIA 타이거즈 <%
 	} else if (mv.getCbNo().toString().equals("CB007")) {
 %> NC 다이노스 <%
 	} else if (mv.getCbNo().toString().equals("CB008")) {
 %> 삼성 라이온즈 <%
 	} else if (mv.getCbNo().toString().equals("CB009")) {
 %> 롯데 자이언츠 <%
 	} else if (mv.getCbNo().toString().equals("CB010")) {
 %> 두산 베어스 <%
 	}
 %>
											</span>
										</div>
									</div>


								</div>


							</div>
						</div>
					</form>
				</div>
			</div>
		</section>

		<!-- 회원정보 Section -->
		<!-- 회원정보 수정 Section --------------------------------------------------------------------------------------------------->
		<section id="updateAbout" class="portfolio section-bg">
			<div class="container">
				<div>
					<div class="col-md-12">
						<div class="section-title">
							<h2>회원 정보 수정</h2>
						</div>
						<form method="post" onsubmit="return valid()">
							<div class="row g-3">
								<div class="form-group">
									<label for="id" class="form-label">아이디</label> <input
										type="text" class="form-control" id="id" name="memId"
										value="<%=mv.getMemId()%>" readOnly>
								</div>

								<div class="form-group">
									<label for="pass" class="form-label">비밀번호 <span
										class="rq"> *</span></label>
									<div class="col-sm-6"></div>
									<input type="password" class="form-control" id="pass"
										name="memPw"
										pattern="(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+|]).{8,12}"
										required> <span class="point">영문, 숫자, 특수문자 포함
										최소 8자부터 입력해주세요.</span> <br>
								</div>
								<br>
								<div class="form-group">
									<label for="pass" class="from-label"> 비밀번호 재확인 <span
										class="rq"> *</span></label>
									<div class="col-sm-6">
										<input type="password" class="form-control" id="pwChk"
											placeholder="입력하신 비밀번호를 다시 입력해주세요."
											pattern="(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+|]).{8,12}"
											required>
									</div>
									<div class="col-sm-6" style="text-align: left">
										<button type="button" class="btn btn-success btn-sm"
											id="pwChkBtn">확인</button>
										<span id="disp2"></span>
									</div>
									<br>
								</div>

								<div class="form-group">
									<label for="name" class="form-label">이름 <span
										class="rq"> *</span></label> <span class="sp"></span>
									<div class="col-sm-12">
										<input type="text" class="form-control" id="name"
											name="memName">
									</div>
									<br>
								</div>

								<div class="form-group">
									<label for="id" class="form-label">생년월일</label> <input
										type="text" class="form-control" id="birth" name="memBrith"
										value="<%=mv.getMemBirth()%>" readOnly>
								</div>

								<div class="form-group">
									<label for="mail" class="control-label col-sm-2">이메일<span
										class="rq"> *</span></label>
									<div class="col-sm-6">
										<input type="email" class="form-control" id="mail"
											name="memEmail"
											pattern="[0-9a-zA-Z]+@[0-9a-zA-Z]+(\.[a-z]+){1,2}">
									</div>
									<br>
								</div>

								<div class="form-group">
									<label for="tel" class="control-label col-sm-2">연락처 <span
										class="rq"> *</span></label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="tel" name="memTel"
											placeholder="- 없이 입력해주세요"
											pattern="[0-9]{2,3}[0-9]{3,4}[0-9]{4}" required>
									</div>
									<div class="col-sm-6" style="text-align: left;">
										<button type="button" id="telBtn"
											class="btn btn-success btn-sm">인증 번호 보내기</button>
										<span id="disp3"></span>
									</div>
									<br>
								</div>

								<div class="form-group">
									<label for="telChk" class="control-label col-sm-2">인증번호
										<span class="rq"> *</span>
									</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="chkRndNum"
											placeholder="인증번호를 입력해주세요.">
									</div>
									<div class="col-sm-6" style="text-align: left;">
										<button type="button" id="telChkBtn"
											class="btn btn-success btn-sm">본인 인증하기</button>
										<span id="disp4"></span>
									</div>
									<br>
								</div>

								<!-- 우편번호 -->
								<div class="form-group">
									<label for="add" class="control-label col-sm-2">우편번호 <span
										class="rq"> *</span></label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="add" name="memAdd"
											required>
									</div>
									<div class="col-sm-2">
										<button type="button" id="addrBtn"
											class="btn btn-success btn-sm">주소검색</button>
									</div>
									<br>
								</div>

								<div class="form-group">
									<label for="add1" class="control-label col-sm-2">주소 <span
										class="rq"> *</span></label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="add1"
											name="memAdd1" required>
									</div>
									<br>
								</div>

								<div class="form-group">
									<label for="add2" class="control-label col-sm-2">상세주소 <span
										class="rq"> *</span></label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="add2"
											name="memAdd2" required>
									</div>
									<br>

								</div>



								<!-- 마이팀 -->
								<div class="form-group">
									<label for="myclub" class="control-label col-sm-2">마이팀</label>
									<div class="col-sm-6">
										<select id="myclub" name="cbNo">
											<option id="myclub" value="none">== 구단선택 ==</option>
											<option id="myclub" value="CB001">한화 이글스</option>
											<option id="myclub" value="CB002">SSG 랜더스</option>
											<option id="myclub" value="CB003">키움 히어로즈</option>
											<option id="myclub" value="CB004">LG 트윈스</option>
											<option id="myclub" value="CB005">KT 위즈</option>
											<option id="myclub" value="CB006">KIA 타이거즈</option>
											<option id="myclub" value="CB007">NC 다이노스</option>
											<option id="myclub" value="CB008">삼성 라이온즈</option>
											<option id="myclub" value="CB009">롯데 자이언츠</option>
											<option id="myclub" value="CB010">두산 베어스</option>
										</select>
									</div>
								</div>

								<hr class="my-4">

								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-6">
										<button class="w-75 btn btn-primary btn-md" type="submit">
											수정하기</button>
										<span id="joinspan"></span>
									</div>
								</div>
						</form>
					</div>
				</div>
	</main>

	<script src="js/join.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
      $('#pwChkBtn').on('click', function() {
         $('#disp2').text();

         let pass = $('#pass').val();
         let pwChk = $('#pwChk').val();


         if (pass == pwChk) {
            $('#disp2').text("비밀번호가 일치합니다.").css('color', 'green');
         } else {
            $('#disp2').text("입력한 비밀번호가 다릅니다.").css('color', 'red');
         }
      });

      $('#addrBtn')
            .on(
                  'click',
                  function() {
                     new daum.Postcode(
                           {
                              oncomplete : function(data) {
                                 var roadAddr = data.roadAddress;
                                 var extraRoadAddr = '';

                                 if (data.bname !== ''
                                       && /[동|로|가]$/g
                                             .test(data.bname)) {
                                    extraRoadAddr += data.bname;
                                 }
                                 if (data.buildingName !== ''
                                       && data.apartment === 'Y') {
                                    extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                          + data.buildingName
                                          : data.buildingName);
                                 }
                                 if (extraRoadAddr !== '') {
                                    extraRoadAddr = ' ('
                                          + extraRoadAddr + ')';
                                 }

                                 document.getElementById('add').value = data.zonecode;
                                 document.getElementById("add1").value = roadAddr;

                              }
                           }).open();
                  });

      $('#telBtn').on('click', function() {
         $('#disp3').text();

         let telVal = $('#tel').val();

         alert(telVal);

         if (telVal.trim().length == 0)
            return;

         $.ajax({
            url : 'telChk.jsp',
            type : 'post',
            data : {
               'tel' : telVal
            },
            success : function(data) {
               console.log(data);
               if (data.code == "ok") {
                  $('#disp3').text(data.msg).css('color', 'green');
                  randNum = data.rndNum;
               } else {
                  $('#disp3').text(data.msg).css('color', 'red');
               }
            },
            error : function(xhr) {
               alert("상태 >> " + xhr.status);
            },
            dataType : 'json'
         });
      });

      var randNum = 0;

      $('#telChkBtn').on('click', function() {

         $('#disp4').text("");

         var chkRndNum = $('#chkRndNum').val();

         if (chkRndNum == randNum) {
            $('#disp4').text("인증성공!").css('color', 'green');
         } else {
            $('#disp4').text("인증실패!").css('color', 'red');
         }
      });

      function valid() {
         // submit 이벤트가 실행되면서 화면전환되는 현상을 막기
         event.preventDefault();
         console.log("데이터 직렬 화 >> ", $('form').serialize());

         let data = $('form').serializeArray();

         $.ajax({
            type : 'post',
            url : 'update.jsp',
            data : JSON.stringify(data),
            success : function(result) {
               console.log("성공", result);
               if (result == 1) {
                  location.href = "myPage"
                  // 출력 위치 가입 상태를 표시
                  $('#joinspan').text("변경 성공!").css('color', 'green');
               } else {
                  $('#joinspan').text("변경 실패...").css('color', 'gray');
               }
            },
            error : function(xhr) {
               console.log("상태 : " + xhr.status);
            }
         });

      }
   </script>
	</div>
	</section>
	<!-- 회원정보 수정 Section------------------------------------------------------------------------------------------------------->
	<!------- ======= 예매 Section ======= --------------------------------------------------------------------------------------->
	<section id="resume" class="resume" style="margin-left: 270px">
		<div class="container" height: 800px>
			<div class="section-title">
				<h2>예매 내역</h2>
			</div>
			<div class="col-md-7">
				<div class="box py-4 px-5"
					style="margin-top: -50px; margin-left: -50px; text-align: center; width: 1400px">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">예매번호</th>
								<th scope="col">구역번호</th>
								<th scope="col">좌석번호</th>
								<th scope="col">예매고객</th>
								<th scope="col">선택</th>
								<th scope="col">예매취소</th>
							</tr>
						</thead>
						<tbody>
							<%
								System.out.println("ticketListSize : " + ticketList.size());
							for (int i = 0; i < ticketList.size(); i++) {
							%>
							<tr>
								<th scope="row"><%=(i + 1)%></th>
								<td><%=ticketList.get(i).gettNo()%></td>
								<td><%=ticketList.get(i).getScNo()%></td>
								<td><%=ticketList.get(i).getSeNo()%></td>
								<td><%=ticketList.get(i).getMemId()%></td>
								<td><input id=<%=ticketList.get(i).gettNo()%>
									"
                           type="checkbox"
									name="selectTickets" style="width: 20px; height: 20px;"
									value="<%=ticketList.get(i).gettNo()%>"></td>
								<td><button type="button" class="btn btn-outline-primary"
										onclick="location.href='ticketCancleController?tNo=<%=ticketList.get(i).gettNo()%>'">예매취소</button></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
			<div style="text-align: center;">
				<button type="button" class="btn btn-danger"
					style="font-size: 20px; padding: 12px 24px;"
					onclick="getSelectTicket(); ">선택한 예매 취소</button>
			</div>
			<script>
            function getSelectTicket() {
                var selectedTicket = [];
                var checkBox = document.getElementsByName('selectTickets');
                
                for (var i = 0; i < checkBox.length; i++) {
                    if (checkBox[i].checked) {
                        selectedTicket.push(checkBox[i].value);
                    }
                }
                
                var params = selectedTicket.map(function(tNo) {
                    return 'tNo=' + encodeURIComponent(tNo);
                });
                
                var url = 'ticketCheckCancelController?' + params.join('&');
                window.location.href = url;
            }
         </script>
	</section>
	<!-- 예매 Section --------------------------------------------------------------------------------------------------------------->
	<!-- ======= 장바구니 Section ======= ---------------------------------------------------------------------------------------------------->
	<section id="cart" class="portfolio section-bg">
		<div class="container" style="margin-right: 150px; height: 800px">

			<div class="section-title">
				<h2>장바구니</h2>
			</div>
			<br>
			<table class="table">
				<thead>
					<tr>
						<th>상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>소계</th>
						<th>선택</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (cartProdDto cartProd : cartProdList) {
					%>
					<tr>
						<td><a
							href="ProdDetailController?prodNo=<%=cartProd.getProdNo()%>"
							style="color: black;"><%=cartProd.getProdName()%></a></td>
						<td><%=cartProd.getProdPrice()%>원</td>
						<td><input id="num_<%=cartProd.getProdNo()%>" type="number"
							name="ctQty" value="<%=cartProd.getCtQty()%>" min="1" max="5"></td>
						<td><input id="chk_<%=cartProd.getProdNo()%>" type="checkbox"
							name="selectedItems" style="width: 20px; height: 20px;"
							value="<%=cartProd.getProdNo()%>"></td>
						<td><button type="button" class="btn-close"
								aria-label="Close" style="width: 10px; height: 10px;"
								onclick="location.href='MyPageCartDeleteController?prodNo=<%=cartProd.getProdNo()%>&memId=<%=mv.getMemId()%>'"></button></td>
					</tr>

					<%
						}
					%>
				</tbody>
			</table>
			<br> <br>
			<div id="bor"></div>
			<br>

			<div style="text-align: center;">
				<button type="button" class="btn btn-danger"
					style="font-size: 20px; padding: 12px 24px;"
					onclick="getSelectedItems()">주문하기</button>
			</div>
			<br> <br> <br>
			<script>
   function getSelectedItems() {
        var selectedItems = [];
        var checkboxes = document.getElementsByName("selectedItems");
        for (var i = 0; i < checkboxes.length; i++) {
           if (checkboxes[i].checked) {                        
              selectedItems.push(checkboxes[i].value + ":" + $('#num_' + checkboxes[i].id.split("_")[1]).val());
           }
        }
        console.log('selectedItems : ' , selectedItems);

        var params = selectedItems.map(function(item) {
             var parts = item.split(":"); // 상품번호와 수량 분리
             var prodNo = parts[0];
             var ctQty = parts[1];
             return 'prodNo=' + encodeURIComponent(prodNo) + '&ctQty=' + encodeURIComponent(ctQty);
         });
        
        console.log('params : ', params.join('&'));
        
      
        
          var url = 'CartUpdateController?memId=<%=mv.getMemId()%>
				&'
							+ params.join('&');
					console.log('url:', url);
					window.location.href = url;
				}
			</script>
	</section>
	<!-- 장바구니 Section -->

	<!-- ======= Services Section ======= ------------------------------------------------------------------------------------------->
	<section id="services" class="services"
		style="margin-left: 250px; margin-bottom: 100px; heigt: 800px;">
		<div class="container">
			<div class="section-title">
				<h2>관심상품</h2>
			</div>
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<%
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
									type="button"
									onclick="location.href='MyPageWishListDeleteController?prodNo=<%=wishProd.getProdNo()%>&memId=<%=memId%>'">
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
	<!-- End Services Section ---------------------------------------------------------------------------------------------------->
	<!-- ======= Contact Section ======= -->
	<section id="contact" class="contact">
		<div class="container">

			<div class="section-title">
				<h2>Contact</h2>
				<p>Magnam dolores commodi suscipit. Necessitatibus eius
					consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit.
					Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit
					alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
			</div>

			<div class="row" data-aos="fade-in">

				<div class="col-lg-5 d-flex align-items-stretch">
					<div class="info">
						<div class="address">
							<i class="bi bi-geo-alt"></i>
							<h4>Location:</h4>
							<p>A108 Adam Street, New York, NY 535022</p>
						</div>

						<div class="email">
							<i class="bi bi-envelope"></i>
							<h4>Email:</h4>
							<p>info@example.com</p>
						</div>

						<div class="phone">
							<i class="bi bi-phone"></i>
							<h4>Call:</h4>
							<p>+1 5589 55488 55s</p>
						</div>

						<iframe
							src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621"
							frameborder="0" style="border: 0; width: 100%; height: 290px;"
							allowfullscreen></iframe>
					</div>

				</div>

				<div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch">
					<form action="forms/contact.php" method="post" role="form"
						class="php-email-form">
						<div class="row">
							<div class="form-group col-md-6">
								<label for="name">Your Name</label> <input type="text"
									name="name" class="form-control" id="name" required>
							</div>
							<div class="form-group col-md-6">
								<label for="name">Your Email</label> <input type="email"
									class="form-control" name="email" id="email" required>
							</div>
						</div>
						<div class="form-group">
							<label for="name">Subject</label> <input type="text"
								class="form-control" name="subject" id="subject" required>
						</div>
						<div class="form-group">
							<label for="name">Message</label>
							<textarea class="form-control" name="message" rows="10" required></textarea>
						</div>
						<div class="my-3">
							<div class="loading">Loading</div>
							<div class="error-message"></div>
							<div class="sent-message">Your message has been sent. Thank
								you!</div>
						</div>
						<div class="text-center">
							<button type="submit">Send Message</button>
						</div>
					</form>
				</div>

			</div>

		</div>
	</section>
	<!-- End Contact Section -->

	</main>
	<!-- End #main -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Template Main JS File -->
	<script src="js/main.js"></script>

</body>

</html>