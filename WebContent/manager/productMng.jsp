<%@page import="kr.or.ddit.club.vo.ClubVO"%>
<%@page import="javax.print.attribute.standard.Fidelity"%>
<%@page import="kr.or.ddit.comm.vo.AtchFileVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.product.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<ProductVO> findProdByCb = (List<ProductVO>) request.getAttribute("findProdByCb");
if (findProdByCb == null) {
	findProdByCb = new ArrayList<>();
}

List<ProductVO> findAll = (List<ProductVO>) request.getAttribute("findAll");
if (findAll == null) {
	findAll = new ArrayList<>();
}

ClubVO club = (ClubVO) session.getAttribute("club");

String cbNo = request.getParameter("cbNo");

String memId = (String) session.getAttribute("memId");

ProductVO update = (ProductVO) request.getAttribute("update");

Map<String, AtchFileVO> imageMap = (Map<String, AtchFileVO>) request.getAttribute("imageInfo");

%>
<!DOCTYPE html>
<html lang="en">
<style>
nav ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

nav li {
	display: inline-block;
	position: relative;
	padding: 10px;
}

nav li ul {
	position: absolute;
	top: 100%;
	left: 0;
	background-color: #fff;
	border: 1px solid #ccc;
	padding: 0;
	margin: 0;
	z-index: 999;
	display: none;
}

nav li:hover ul {
	display: block;
}

nav li ul li {
	display: block;
	width: 100%;
	text-align: center;
	padding: 10px;
	border-bottom: 1px solid #ccc;
}

nav li ul li:last-child {
	border-bottom: none;
}
</style>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>구단 관리자 -상품관리</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="manager/css/styles.css" rel="stylesheet" />
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>구단 관리자 -상품관리</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="../css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<!-- modal창 추가 -->
	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">상품 추가하기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">카테고리</span> <select
							class="form-select" aria-label="Default select example">
							<option selected>카테고리</option>
							<option value="유니폼">유니폼</option>
							<option value="의류">의류</option>
							<option value="응원용품">응원용품</option>
							<option value="야구용품">야구용품</option>
							<option value="잡화">잡화</option>
							<option value="키즈">키즈</option>
						</select>
					</div>
					<div class="input-group mb-3">
						<input id="fileInput" type="file" class="form-control"
							aria-label="atchFileId" aria-describedby="basic-addon1">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">상품이름</span> <input
							type="text" class="form-control" aria-label="prodName"
							aria-describedby="basic-addon1">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">상품가격</span> <input
							type="text" class="form-control" aria-label="prodPrice"
							aria-describedby="basic-addon1">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">상품재고</span> <input
							type="text" class="form-control" aria-label="prodStock"
							aria-describedby="basic-addon1">
					</div>
					<div class="input-group">
						<span class="input-group-text">상세정보</span>
						<textarea class="form-control" aria-label="With textarea"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" onclick="addProd()">추가</button>
				</div>
			</div>
		</div>
	</div>
	<%
		// 회원
	String loginCd = (String) session.getAttribute("loginCode");
	%>

	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<!-- Sidebar Toggle-->
		<a class="navbar-brand ps-3" href="manager/index.jsp">Multicket</a>
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
						<div class="sb-sidenav-menu-heading">MANAGE</div>
						<a class="nav-link" href="manager/index.jsp?cbNo=<%=club.getCbName()%>">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 주문 관리
						</a>
						<a class="nav-link"
							href="../SelectProdController?memId=<%=loginCd%>&cbNo=<%=club.getCbNo()%>">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 상품 관리
						</a> <a class="nav-link" href="manager/memMng.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 회원 관리
						</a> <a class="nav-link"
							onclick="location.href='NoticeMngController'">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 공지사항 관리
						</a>
						 <a class="nav-link" onclick="location.href='../clubQuestion'">
                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                	문의사항 관리
                           </a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Multicket:</div>
					구단 관리자 페이지
				</div>
			</nav>
		</div>
	
	<div id="layoutSidenav_content">
		<div class="container-fluid px-4">
			<!-- Navigation-->

			<nav class="navbar navbar-expand-lg navbar-light bg-light"
				style="margin-bottom: -30px;">
				<div class="container px-4 px-lg-5">
					<a class="navbar-brand" href="#"><b>상품 관리</b></a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
						aria-controls="navbarResponsive" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarResponsive">
						<ul class="navbar-nav ms-auto py-4 py-lg-0">
							<li class="nav-item"><button type="button"
									class="btn btn-primary px-lg-3 py-3 py-lg-4"
									data-bs-toggle="modal" data-bs-target="#exampleModal">상품추가</button></li>
							<li class="nav-item">
							<li class="nav-item"><a
								class="nav-link px-lg-3 py-3 py-lg-4" href="#"><%=club.getCbName()%></a></li>
							</li>
						</ul>
					</div>
				</div>
			</nav>

			<section class="py-5">

				<div class="container px-4 px-lg-5 mt-5">
					<div
						class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
						<%
							int size = findProdByCb.size();
						if (size > 0) {
							for (ProductVO pv : findProdByCb) {
								// 					                    	System.out.println("상품이름: " + pv.getProdName());
								// 					                    	AtchFileVO fildVO = imageMap.get(pv.getProdNo());
								// 					                    	System.out.println("이미지경로: " + "http://localhost:8888/KBOProject/images/" + imageMap.get(pv.getProdNo()).getStreFileNm() + "." + imageMap.get(pv.getProdNo()).getFileExtsn());
						%>

						<div class="col mb-5">
							<div class="card h-100">
								<!-- Sale badge-->
								<!-- <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div> -->
								<!-- Product image-->
								<img class="card-img-top"
									src="http://localhost:8888/KBOProject/images/<%=imageMap.get(pv.getProdNo()).getStreFileNm()%>.<%=imageMap.get(pv.getProdNo()).getFileExtsn()%>"
									alt="상품" usemap="#image-map">
								<!-- Product details-->
								<div class="card-body p-4">
									<div class="text-center">
										<!-- Product name-->
										<h5 class="fw-bolder"><%=pv.getProdName()%></h5>
										<!-- Product reviews-->
										<div
											class="d-flex justify-content-center small text-warning mb-2">
											<!--                                                     <div class="bi-star-fill"></div> -->
											<!--                                                     <div class="bi-star-fill"></div> -->
											<!--                                                     <div class="bi-star-fill"></div> -->
											<!--                                                     <div class="bi-star-fill"></div> -->
										</div>
										<!-- Product price-->
										<%=pv.getProdPrice() + "원"%>
									</div>
								</div>
								<!-- Product actions-->
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="btn btn-outline-dark mt-auto"
											href="GetProdInfoController?prodNo=<%=pv.getProdNo()%>">수정</a>
										<a class="btn btn-outline-danger mt-auto"
											href="prod/delete.do?prodNo=<%=pv.getProdNo()%>">삭제</a>
									</div>
								</div>
							</div>
						</div>
						<%
							}
						}
						%>
					</div>
				</div>
			</section>

		</div>
		</main>
		<!-- modal창 추가 -->
		<!-- Button trigger modal -->
		<!-- 		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"> -->
		<!-- 		  상품추가 -->
		<!-- 		</button> -->

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">상품 추가하기</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="input-group mb-3">
							<span class="input-group-text" id="basic-addon1">카테고리</span> <select
								class="form-select" aria-label="Default select example">
								<option selected>카테고리</option>
								<option value="유니폼">유니폼</option>
								<option value="의류">의류</option>
								<option value="응원용품">응원용품</option>
								<option value="야구용품">야구용품</option>
								<option value="잡화">잡화</option>
								<option value="키즈">키즈</option>
							</select>
						</div>
						<div class="input-group mb-3">
							<input id="fileInput" type="file" class="form-control"
								aria-label="atchFileId" aria-describedby="basic-addon1">
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text" id="basic-addon1">상품이름</span> <input
								type="text" class="form-control" aria-label="prodName"
								aria-describedby="basic-addon1">
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text" id="basic-addon1">상품가격</span> <input
								type="text" class="form-control" aria-label="prodPrice"
								aria-describedby="basic-addon1">
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text" id="basic-addon1">상품재고</span> <input
								type="text" class="form-control" aria-label="prodStock"
								aria-describedby="basic-addon1">
						</div>
						<div class="input-group">
							<span class="input-group-text">상세정보</span>
							<textarea class="form-control" aria-label="With textarea"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" onclick="addProd()">추가</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer-->
		<footer class="py-4 bg-light mt-auto">
			<div class="container-fluid px-4">
				<div class="d-flex align-items-center justify-content-between small">
					<div class="text-muted">Copyright &copy; Multicket 2023</div>
					<div>
						<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
							&amp; Conditions</a>
					</div>
				</div>
			</div>
		</footer>

		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/js/bootstrap.min.js"></script>
		<!-- Bootstrap core JS-->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- Core theme JS-->
		<script src="../js/scripts.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
			crossorigin="anonymous"></script>
		<script src="js/scripts.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
			crossorigin="anonymous"></script>
		<script src="js/datatables-simple-demo.js"></script>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	function addProd() {
	 // 카테고리 값 받아오기
	  var categorySelect = document.querySelector('.form-select');
	  var category = categorySelect.value;

	  // 파일 업로드 필드에서 선택된 파일들 받아오기
	  var fileInput = document.getElementById('fileInput');
	  var files = fileInput.files;

	  // 상품 이름 받아오기
	  var prodNameInput = document.querySelector('input[aria-label="prodName"]');
	  var prodName = prodNameInput.value;

	  // 상품 가격 받아오기
	  var prodPriceInput = document.querySelector('input[aria-label="prodPrice"]');
	  var prodPrice = prodPriceInput.value;

	  // 상품 재고 받아오기
	  var prodStockInput = document.querySelector('input[aria-label="prodStock"]');
	  var prodStock = prodStockInput.value;

	  // 상세 정보 받아오기
	  var prodDetailTextarea = document.querySelector('textarea[aria-label="With textarea"]');
	  var prodDetail = prodDetailTextarea.value;

	  // FormData 객체 생성
	  var formData = new FormData();

	  // 데이터 추가
	  formData.append('category', category);
	  formData.append('prodName', prodName);
	  formData.append('prodPrice', prodPrice);
	  formData.append('prodStock', prodStock);
	  formData.append('prodDetail', prodDetail);

	  // 가져온 데이터를 사용하여 원하는 작업을 수행
	  // 예시: 가져온 데이터를 콘솔에 출력
	  console.log("카테고리: " + category);
	  console.log("상품 이름: " + prodName);
	  console.log("상품 가격: " + prodPrice);
	  console.log("상품 재고: " + prodStock);
	  console.log("상세 정보: " + prodDetail);
	  
	  // 파일 업로드 필드에서 선택된 파일들 추가
	  var fileInput = document.getElementById('fileInput');
	  var files = fileInput.files;
	  for (var i = 0; i < files.length; i++) {
	    var file = files[i];
	    formData.append('photos', file);
	  }
	  
	  console.log("FormData:", formData);
	  
	  // Ajax 요청 보내기
	  $.ajax({
	    url: 'prod/insert.do',
	    type: 'POST',
	    data: formData,
	    processData: false, // FormData를 사용할 때는 데이터 처리를 jQuery에 맡기고 싶으므로 false로 설정합니다.
	    contentType: false, // 데이터 유형을 설정하지 않도록 false로 설정합니다.
	    success: function(response) {
	      // 요청이 성공했을 때 수행할 작업
	      console.log('데이터 전송 성공');
	      console.log(response); // 서버로부터의 응답 데이터
	      // 다시 구단별로 전체 상품가져오도록 location.href 
	      if (response.msg == "성공") {
	    	  location.href = "SelectProdController?memId=<%=memId%>&cbNo=<%=cbNo%>";
						}

					},
					error : function(xhr, status, error) {
						// 요청이 실패했을 때 수행할 작업
						console.log('데이터 전송 실패');
						console.log(xhr.responseText); // 서버로부터의 응답 데이터
					}
				});
	}
</script>

</html>
