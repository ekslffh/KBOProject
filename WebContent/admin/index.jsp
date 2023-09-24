<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.ticket.dto.MonthlyAmountDTO"%>
<%@page import="kr.or.ddit.ticket.service.TicketServiceImpl"%>
<%@page import="kr.or.ddit.ticket.service.ITicketService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.ticket.vo.TicketVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
ITicketService ticketService = TicketServiceImpl.getInstance();

List<TicketVO> ticketList = ticketService.findAll();
List<MonthlyAmountDTO> monthlyAmtList = ticketService.getMonthlyAmt();
if (ticketList == null)
	ticketList = new ArrayList<>();
if (monthlyAmtList == null)
	monthlyAmtList = new ArrayList<>();

Map<String, String> amtMap = new HashMap<>();

int maxVal = 0;
for (MonthlyAmountDTO dto : monthlyAmtList) {
	amtMap.put(dto.getMonth(), dto.getAmount());
	if (maxVal < Integer.parseInt(dto.getAmount())) {
		maxVal = Integer.parseInt(dto.getAmount());
	}
}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>예매관리</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="index.jsp">KBO SITE</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
<!-- 					<li><a class="dropdown-item" href="#!">Settings</a></li> -->
<!-- 					<li><a class="dropdown-item" href="#!">Activity Log</a></li> -->
<!-- 					<li><hr class="dropdown-divider" /></li> -->
					<li><a class="dropdown-item" href="../Logout">Logout</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Core</div>
						<a class="nav-link" href="index.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 예매관리
						</a> <a class="nav-link" href="memMng.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 회원관리
						</a> <a class="nav-link" href="matchMng.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 경기관리
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">KBO SITE DASHBOARD</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">예매관리</li>
					</ol>
					<div class="row">
						<div class="col-xl-6">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-area me-1"></i> 
									월별 매출현황
								</div>
								<div class="card-body">
									<canvas id="myAreaChart" width="100%" height="40"></canvas>
								</div>
							</div>
						</div>
					<div class="col-xl-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-bar me-1"></i> 
								구단별 예매현황
							</div>
							<div class="card-body">
								<canvas id="myBarChart" width="100%" height="40"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 예매내역
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>티켓번호</th>
									<th>예매고객</th>
									<th>경기번호</th>
									<th>구역번호</th>
									<th>좌석번호</th>
									<th>예매일자</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>티켓번호</th>
									<th>예매고객</th>
									<th>경기번호</th>
									<th>구역번호</th>
									<th>좌석번호</th>
									<th>예매일자</th>
								</tr>
							</tfoot>
							<tbody>
								<%
								for (TicketVO tv : ticketList) {
								%>
								<tr>
									<th><%=tv.gettNo()%></th>
									<th><%=tv.getMemId()%></th>
									<th><%=tv.getmNo()%></th>
									<th><%=tv.getScNo()%></th>
									<th><%=tv.getSeNo()%> date</th>
									<th><%=tv.gettDate()%></th>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
		</div>
		</main>
		<footer class="py-4 bg-light mt-auto">
			<div class="container-fluid px-4">
				<div class="d-flex align-items-center justify-content-between small">
					<div class="text-muted">Copyright &copy; Your Website 2023</div>
					<div>
						<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
							&amp; Conditions</a>
					</div>
				</div>
			</div>
		</footer>
	</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>

	<script>
		// Set new default font family and font color to mimic Bootstrap's default styling
		Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		Chart.defaults.global.defaultFontColor = '#292b2c';

		// Area Chart Example
		var ctx = document.getElementById("myAreaChart");
		var myLineChart = new Chart(ctx, {
			type : 'line',
			data : {
				labels : [ "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월" ],
				datasets : [ {
					label : "Sessions",
					lineTension : 0.3,
					backgroundColor : "rgba(2,117,216,0.2)",
					borderColor : "rgba(2,117,216,1)",
					pointRadius : 5,
					pointBackgroundColor : "rgba(2,117,216,1)",
					pointBorderColor : "rgba(255,255,255,0.8)",
					pointHoverRadius : 5,
					pointHoverBackgroundColor : "rgba(2,117,216,1)",
					pointHitRadius : 50,
					pointBorderWidth : 2,
					data : [
	<%=amtMap.get("3")%>
		,
	<%=amtMap.get("4")%>
		,
	<%=amtMap.get("5")%>
		,
	<%=amtMap.get("6")%>
		,
	<%=amtMap.get("7")%>
		,
	<%=amtMap.get("8")%>
		,
	<%=amtMap.get("9")%>
		,
	<%=amtMap.get("10")%>
		, ],
				} ],
			},
			options : {
				scales : {
					xAxes : [ {
						time : {
							unit : 'date'
						},
						gridLines : {
							display : false
						},
						ticks : {
							maxTicksLimit : 7
						}
					} ],
					yAxes : [ {
						ticks : {
							min : 0,
							max :
	<%=maxVal%>
		,
							maxTicksLimit : 5
						},
						gridLines : {
							color : "rgba(0, 0, 0, .125)",
						}
					} ],
				},
				legend : {
					display : false
				}
			}
		});
	</script>
</body>
</html>
