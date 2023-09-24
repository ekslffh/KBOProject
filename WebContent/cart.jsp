<%@page import="kr.or.ddit.cartProd.dto.cartProdDto"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.product.vo.ProductVO"%>
<%@page import="kr.or.ddit.cart.vo.CartVO"%>
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

<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
</head>
<style>
div #bor {
	border: 1px solid #ccc;
}
</style>
<body>
<%
      // 회원
   String loginCd = (String) session.getAttribute("loginCode");
//    String memId = (String) session.getAttribute("memId");
   %>
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
				onclick="location.href='WishProdController?memId=<%=memId%>';"><i class="bi bi-heart-fill me-1"></i>Wish</button>
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
	<div>
	공백
		<br><br><br><br>
	</div>
	<div class="container">

		<h2>
			<br>장바구니
		</h2>
		<br>
		<table class="table">
			<thead>
				<tr>
					<th>상품명</th>
					<th>가격</th>
					<th>수량</th>
					<th>선택</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<%
					List<cartProdDto> cartProdList = (List<cartProdDto>) request.getAttribute("cartProdList");
				for (cartProdDto cartProd : cartProdList) {
				%>
				<tr>
					<td><a
						href="ProdDetailController?prodNo=<%=cartProd.getProdNo()%>"
						style="color: black;"><%=cartProd.getProdName()%></a></td>
					<td><%=cartProd.getProdPrice()%>원</td>
					<td><input id="num_<%=cartProd.getProdNo()%>" type="number" name="ctQty"
						value="<%=cartProd.getCtQty()%>" min="1" max="5"></td>
					<td><input id="chk_<%=cartProd.getProdNo()%>" type="checkbox" name="selectedItems"  style="width: 20px; height: 20px;"
						value="<%=cartProd.getProdNo()%>"></td>
					<td><button type="button" class="btn-close" aria-label="Close"
							style="width: 10px; height: 10px;"
							onclick="location.href='CartDeleteController?prodNo=<%=cartProd.getProdNo()%>&memId=<%=memId%>'"></button></td>					
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
				onclick="getSelectedItems(); ">주문하기</button>
		</div>
		<br> <br> <br>
		<div>
		<br><br><br><br><br>
		<br><br><br><br><br>
	</div>
	</div>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Multicket</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
        
      
        
          var url = 'CartUpdateController?memId=<%=loginCd %>&' + params.join('&');
          
          console.log('url:', url);
          
          window.location.href = url;

     }
	</script>
</body>
</html>