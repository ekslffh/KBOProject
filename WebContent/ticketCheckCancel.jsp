<%@page import="kr.or.ddit.ticket.vo.TicketVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<TicketVO> ticketList = (List<TicketVO>) request.getAttribute("ticketList");
System.out.println("ticketList : " + ticketList);
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
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="#!">Start Bootstrap</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#!">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">About</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#!">All Products</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="#!">Popular Items</a></li>
							<li><a class="dropdown-item" href="#!">New Arrivals</a></li>
						</ul></li>
				</ul>
				<form class="d-flex">
					<button class="btn btn-outline-dark" type="submit">
						<i class="bi-cart-fill me-1"></i> Cart <span
							class="badge bg-dark text-white ms-1 rounded-pill">0</span>
					</button>
				</form>
			</div>
		</div>
	</nav>
	<!-- Product section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5">
				<div class="col-md-7">
					<div class="box py-4 px-5">
						<h2 class="fw-bolder">선택한 예매 정보</h2>
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
									<td name="tNo"><%=ticketList.get(i).gettNo()%></td>
<%-- 									<td><input name="tNo" value="<%=ticketList.get(i).gettNo()%>"></td> --%>
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
					<button type="button" class="btn btn-danger"
						style="font-size: 20px; padding: 12px 24px;"
						onclick="getSelectTicket(); ">예매 취소</button>
				</div>
			</div>
		</div>
		<script>
			function getSelectTicket() {
			  var ticketList = [];
			  var tNoList = document.getElementsByTagName("td");

			  for (var i = 0; i < tNoList.length; i++) {
			    if (tNoList[i].getAttribute("name") === "tNo") {
			      ticketList.push(tNoList[i].innerHTML);
			    }
			  }
			  var params = ticketList.map(function(tNo) {
			    return 'tNo=' + encodeURIComponent(tNo);
			  });

			  var url = 'tiketCheckCancelControllerOk?' + params.join('&');
			  window.location.href = url;

			  console.log(ticketList);
			}
		</script>
	</section>

	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2023</p>
		</div>
	</footer>

</body>