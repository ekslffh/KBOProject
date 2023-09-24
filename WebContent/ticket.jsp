<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Arrays"%>
<%@page import="kr.or.ddit.ticket.dto.SectionMatchDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
	
<%  
	String mNo = request.getParameter("mNo");
	List<SectionMatchDTO> sectionMatchDtos = (List<SectionMatchDTO>) request.getAttribute("sectionMatchDtos");
	Map<String, String> scMap = new HashMap<>();
	Map<String, String> scPriceMap = new HashMap<>();
	
	for (SectionMatchDTO dto : sectionMatchDtos) {
		scMap.put(dto.getScName(), dto.getScNo());
		scPriceMap.put(dto.getScName(), dto.getScPrice());
	}
%>
	
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">
<title>경기예매 페이지</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script
	src="http://mattstow.com/experiment/responsive-image-maps/jquery.rwdImageMaps.min.js"></script>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/jumbotron/">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">

<style>
img {
	max-width: 100%
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
</style>
</head>

<body>
	<main>
		<div class="container py-4">
		
			<header class="pb-3 mb-4 border-bottom">
				<a href="/"
					class="d-flex align-items-center text-dark text-decoration-none">
					<svg xmlns="http://www.w3.org/2000/svg" width="40" height="32"
						class="me-2" viewBox="0 0 118 94" role="img">
						<img style="width: 70px; height: 50px;"
 					src="http://localhost:8888/KBOProject/images/logob.png" alt="..." />
						<title>Bootstrap</title><path fill-rule="evenodd"
							clip-rule="evenodd"
							d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"
							fill="currentColor"></path></svg> <span class="fs-4">Multicket</span>
				</a>
			</header>



			<div class="row align-items-md-stretch">
				<h2 id="title">섹션선택</h2>
				<div id="scNo" style="display: none;"></div>
				<div id="scPrice" style="display: none;"></div>
				<div id="left-view"
					class="p-5 mb-4 bg-light rounded-3 col-lg-7 col-md-12">
					<div id="main" class="container-fluid py-5">
						<img id="stdImg"
							src="http://localhost:8888/KBOProject/images/경기장_전체.png"
							usemap="#image-map">
						<map name="image-map">
							<area target="" alt="경기장" title="경기장" 
								data-img="http://localhost:8888/KBOProject/images/경기장_전체.png"
								onclick="clickSection(this)"
								coords="74,208,112,164,164,128,199,112,234,103,281,91,318,90,345,94,368,99,397,105,423,116,449,127,474,140,498,160,522,183,539,209,430,336,314,471,299,471"
								shape="poly">
							<area target="" alt="3루 외야지정석" title="3루 외야지정석" data-no=<%= scMap.get("3루 외야지정석") %> data-price=<%= scPriceMap.get("3루 외야지정석") %>
								data-img="http://localhost:8888/KBOProject/images/경기장_01구역.png"
								onclick="clickSection(this)"
								coords="12,151,63,202,82,179,100,158,136,125,161,114,186,101,222,88,241,83,260,79,260,46,254,18,250,1,227,4,187,14,148,26,113,41,74,67,40,100,24,123"
								shape="poly">
							<area target="" alt="1루 외야지정석" title="1루 외야지정석" data-no=<%= scMap.get("1루 외야지정석") %> data-price=<%= scPriceMap.get("1루 외야지정석") %>
								data-img="http://localhost:8888/KBOProject/images/경기장_02구역.png"
								onclick="clickSection(this)"
								coords="349,1,334,80,369,82,380,86,398,90,418,98,438,104,456,113,475,124,497,141,521,163,540,187,551,201,602,149,559,81,469,29"
								shape="poly">
							<area target="" alt="1루 내야응원단석" title="1루 내야응원단석" data-no=<%= scMap.get("1루 내야응원단석") %> data-price=<%= scPriceMap.get("1루 내야응원단석") %>
								data-img="http://localhost:8888/KBOProject/images/경기장_03구역.png"
								onclick="clickSection(this)"
								coords="552,218,442,343,504,398,612,272" shape="poly">
							<area target="" alt="1루 내야지정석" title="1루 내야지정석" data-no=<%= scMap.get("1루 내야지정석") %> data-price=<%= scPriceMap.get("1루 내야지정석") %>
								data-img="http://localhost:8888/KBOProject/images/경기장_04구역.png"
								onclick="clickSection(this)"
								coords="435,354,319,487,382,538,494,406" shape="poly">
							<area target="" alt="3루 내야지정석" title="3루 내야지정석" data-no=<%= scMap.get("3루 내야지정석") %> data-price=<%= scPriceMap.get("3루 내야지정석") %>
								data-img="http://localhost:8888/KBOProject/images/경기장_05구역.png"
								onclick="clickSection(this)"
								coords="119,408,234,541,293,488,178,353" shape="poly">
							<area target="" alt="3루 내야응원단석" title="3루 내야응원단석" data-no=<%= scMap.get("3루 내야응원단석") %> data-price=<%= scPriceMap.get("3루 내야응원단석") %>
								data-img="http://localhost:8888/KBOProject/images/경기장_06구역.png"
								onclick="clickSection(this)"
								coords="3,274,111,397,170,345,66,222" shape="poly">
						</map>
					</div>
				</div>
				<div id="right-view" class="col-lg-5 col-md-12">
					<div class="h-100 p-5 text-bg-dark rounded-3 d-flex flex-column justify-content-center align-items-center">
						<br>
						<table class="table table-dark table-striped-columns">
							<thead>
								<tr>
									<th scope="col">섹션번호</th>
									<th scope="col">섹션이름</th>
									<th scope="col">예매현황</th>
								</tr>
							</thead>
							<tbody>
							<% for (int i = 0; i < sectionMatchDtos.size(); i++) { %>
								<tr>
									<td><%= sectionMatchDtos.get(i).getScNo() %></td>
									<td><%= sectionMatchDtos.get(i).getScName() %></td>
									<td><%= sectionMatchDtos.get(i).getScCapacity() - sectionMatchDtos.get(i).getrNum() %> / <%= sectionMatchDtos.get(i).getScCapacity() %></td>
								</tr>
								<%
							}
								%>
							</tbody>
						</table>
						<br>
						<button id= "select" class="btn btn-outline-light" type="button"
							onclick="clickButton(this)">좌석 선택하기</button>
					</div>
				</div>
			</div>

			<footer class="pt-3 mt-4 text-muted border-top"> &copy; 2022
			</footer>
		</div>
	</main>

	<script>

		function clickSection(e) {
			console.log(e);
			$('#stdImg').attr('src', $(e).data('img'));
			$('#title').text(e.title);
			console.log("scNo: ", $(e).data('no'));
			$('#scNo').text($(e).data('no'));
			$('#scPrice').text($(e).data('price'));
		}

		function clickButton(e) {
			console.log("경기번호: ", <%= mNo%>);
			console.log("섹션번호: ", $('#scNo').text());
			location.href = "reservation?mNo=<%= mNo%>&scNo=" + $('#scNo').text() + "&scPrice=" + $('#scPrice').text();
		}
		
	</script>
</body>
</html>
