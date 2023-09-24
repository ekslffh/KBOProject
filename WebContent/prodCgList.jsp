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
List<ProductVO> findProdByCg = (List<ProductVO>) request.getAttribute("findProdByCg");
if(findProdByCg == null) {
	findProdByCg = new ArrayList<>();
}

List<ProductVO> findAll = (List<ProductVO>) request.getAttribute("findAll");
if(findAll == null) {
	findAll = new ArrayList<>();
}

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
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Goods List</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
    <%
		// 회원
	String loginCd = (String) session.getAttribute("loginCode");
	String memId = (String) session.getAttribute("memId");
	if (loginCd != null) {
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
</header>

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
        
        <!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="#"><b>카테고리별 상품</b></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ms-auto py-4 py-lg-0">
				<li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle px-lg-3 py-3 py-lg-4"
                     href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                      aria-expanded="false">구단</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <%
                    	Set<String> clubSet = new HashSet<String>();
                    	for(ProductVO pv : findAll){
                    		clubSet.add(pv.getCbNo());
                    	}
                    	
                    	for (String club : clubSet) {
                    		
                    		String clubName = "";
                    		if(club.endsWith("1")){
                    		  clubName = "한화 이글스";
                    		} else if(club.endsWith("2")){
                    		  clubName = "SSG 랜더스";
                    		} else if(club.endsWith("3")){
                      		  clubName = "키움 히어로즈";
                      		} else if(club.endsWith("4")){
                      		  clubName = "LG 트윈스";
                      		} else if(club.endsWith("5")){
                      		  clubName = "KT 위즈";
                      		} else if(club.endsWith("6")){
                      		  clubName = "KIA 타이거즈";
                      		} else if(club.endsWith("7")){
                      		  clubName = "NC 다이노스";
                      		} else if(club.endsWith("8")){
                      		  clubName = "삼성 라이온즈";
                      		} else if(club.endsWith("9")){
                      		  clubName = "롯데 자이언츠";
                      		} else {
                    		  clubName = "두산 베어스";
                    		}
                    %>
                        <li><a class="dropdown-item" href="ProdCbListController?cbNo=<%=club%>"><%=clubName%></a></li>
                        <%
                    	}
                        %>
                    </ul>
                </li>
                
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle px-lg-3 py-3 py-lg-4" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <%
                    Set<String> categorySet = new HashSet<String>();
                    	for(ProductVO pv : findAll){
                    		categorySet.add(pv.getCgName());
                    	}
                    	
                    	for (String category : categorySet) {
                    	
                    %>
                        <li><a class="dropdown-item" href="ProdCgListController?cgName=<%=category%>" ><%=category%></a></li>
                        <%
                    	}
                        %>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
        
	           
        <section class="py-5">
                        <div class="container px-4 px-lg-5 mt-5">
                            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                             <% 
					            int size = findProdByCg.size();
					            if (size > 0) {
					                for (ProductVO pv : findProdByCg) {
					                    String cbNo = pv.getCbNo();
					                    char lastChar = cbNo.charAt(cbNo.length() - 1);
					                    int loopCount = 0;
					                    if (lastChar == '1') {
					                    	
					                    } else if (lastChar == '2') {
					                    	
					                    } else {
					                        
					                    }
					                    for (int i = 0; i < 1; i++) {
					            %>
                                
                                <div class="col mb-5">
                                    <div class="card h-100">
                                        <!-- Sale badge-->
                                        <!-- <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div> -->
                                        <!-- Product image-->
                                        <img class="card-img-top" src="http://localhost:8888/KBOProject/images/<%= imageMap.get(pv.getProdNo()).getStreFileNm()%>.<%= imageMap.get(pv.getProdNo()).getFileExtsn()%>" alt="상품" usemap="#image-map">
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder"><%=pv.getProdName()%></h5>
                                                <!-- Product reviews-->
                                                <div class="d-flex justify-content-center small text-warning mb-2">
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                </div>
                                                <!-- Product price-->
                                                <%=pv.getProdPrice() + "원"%>
                                            </div>
                                        </div>
                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="ProdDetailController?prodNo=<%=pv.getProdNo()%>">상세보기</a></div>
                                        </div>
                                    </div>
                                 </div>
            <% 
                    }
                }
            }
            %>
        </div>
    </div>
</section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/js/bootstrap.min.js"></script>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>


</html>
