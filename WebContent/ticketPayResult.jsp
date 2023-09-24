<%@page import="kr.or.ddit.membership.vo.MembershipVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.ticketPay.vo.TicketPayVO"%>
<%@page import="kr.or.ddit.ticket.vo.TicketVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<TicketVO> ticketList = (List<TicketVO>) session.getAttribute("ticketList");
	TicketPayVO ticketPayVO = (TicketPayVO) session.getAttribute("ticketPayVO");
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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js">
</script>
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
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<!-- iamport.payment.js -->
<style>
.box {
	border: 1px solid #ccc;
	padding: 20px;
}

.box h2 {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 10px;
}

.box p {
	font-size: 16px;
	margin-bottom: 10px;
}

button {
	width: 100%;
}
</style>
</head>

<body>
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
          <li class="nav-item"><a class="nav-link active" href='/KBOProject/Match'>TICKET</a></li>
          <li class="nav-item"><a class="nav-link active" href="/KBOProject/ProductListController">GOODS</a></li>
        </ul>
        <form class="d-flex" role="search">
          <ul class="navbar-nav me-auto mb-2 mb-md-0">
            <li class="nav-item"><a class="nav-link active" aria-current="page" href="Notice">NOTICE</a></li>
<!-- onclick="location.href='Notice'" -->
            <div class="text-end" style="margin: 10px 30px; display:flex;">
			<button type="button" class="btn btn-outline-light me-2"
				onclick="location.href='/KBOProject/Logout'">Logout</button>
			<button type="button" class="btn btn-warning"
				onclick="location.href='/KBOProject/myPage'">Mypage</button>
		</div>
          </ul>

        </form>
      </div>
    </div>
  </nav>
</header>
	<!-- Product section-->
	<br><br>
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5">
				<div class="col-md-7">
					<div class="box py-4 px-5">
						<h2 class="fw-bolder">예매 정보</h2>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">예매번호</th>
									<th scope="col">구역번호</th>
									<th scope="col">좌석번호</th>
									<th scope="col">예매고객</th>
								</tr>
							</thead>
							<tbody>
								<%
									for (int i = 0; i < ticketList.size(); i++) {
								%>
								<tr>
									<th scope="row"><%=(i + 1)%></th>
									<td><%=ticketList.get(i).gettNo()%></td>
									<td><%=ticketList.get(i).getScNo()%></td>
									<td><%=ticketList.get(i).getSeNo()%></td>
									<td><%=ticketList.get(i).getMemId()%></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-md-5">
					<div class="box py-4 px-5">
						<h2 class="fw-bolder">결제완료</h2>
						<table class="table">
							<tbody>
								<tr>
									<td>결제번호</td>
									<td><%=ticketPayVO.getTpNo()%></td>
								</tr>
								<tr>
									<td>결제금액</td>
									<td><%=ticketPayVO.getTpAmount()%></td>
								</tr>
								<tr>
									<td>결제일시</td>
									<td><%=ticketPayVO.getTpDate()%></td>
								</tr>
							</tbody>
						</table>
					</div>
						<button type="button" class="btn btn-secondary btn-lg" onclick="location.href='/KBOProject'">홈으로</button>
				</div>
			</div>
		</div>
	</section>
	<br><br><br><br><br><br>
	<br><br><br><br>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Multicket</p>
		</div>
	</footer>

</body>