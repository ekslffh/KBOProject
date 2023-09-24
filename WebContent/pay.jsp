<%@page import="kr.or.ddit.ordetail.vo.OrDetailVO"%>
<%@page import="kr.or.ddit.product.vo.ProductVO"%>
<%@page import="kr.or.ddit.orders.vo.OrdersVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.pay.vo.PayVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<% 


	OrdersVO orders = (OrdersVO) request.getAttribute("orders");
	ProductVO pv = (ProductVO) request.getAttribute("pv");
	OrDetailVO orDetail = (OrDetailVO) request.getAttribute("orDetail");
	PayVO pay = (PayVO) request.getAttribute("pay");

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
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
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
.btn-margin {
      margin-top: 10px; /* Adjust the value as desired */
   }
</style>
<script>
		var IMP = window.IMP;
		IMP.init("imp61367226");

		function requestPay() {
			  console.log("requestePAY");
			  IMP.request_pay({
			    pg: 'kakaopay.TC0ONETIME',
			    pay_method: 'card',
			    merchant_uid: '<%= pay.getPayNo()%>',
			    name: '상품 구매',
			    amount: '<%= pay.getPayAmount()%>',
			    buyer_email: 'admin@kbo.com',
			    buyer_name: 'KBO관리자',
			    buyer_tel: '010-1234-5678',
			    buyer_addr: '서울특별시 강남구 삼성동',
			    buyer_postcode: '123-456'
			  }, function(rsp) { // callback
			    console.log(rsp);

			    if (rsp.success) {
			      // 결제 완료 시
			      const payData = {
			        tpNo: '<%= pay.getPayNo()%>',
			        tpPrice: '<%= pay.getPayPrice()%>',
			        tpDc: '<%= pay.getPayDc()%>',
			        tpAmount: '<%= pay.getPayAmount()%>'
			      }

			      console.log(payData);

			      // 객체 배열 데이터를 JSON 형식으로 변환
			      var jsonData = JSON.stringify(payData);

			      console.log("jsonData:", jsonData);

			      // 티켓결제 데이터 post하기
			      $.ajax({
			        url: "insert.do",
			        method: "POST",
			        data: { data: jsonData },
			        success: function(response) {
			          console.log("성공", response);
			          if (response == 'success') {
			            // 예매완료 페이지로 이동하기
			            location.href = "/KBOProject/ticketPayResult.jsp";
			          }
			        },
			        error: function(xhr, status, error) {
			          console.error("에러", xhr);
			        }
			      });
			      
			      alert("결제가 완료되었습니다."); // 결제 완료 alert 추가
			    } else {
			      // 결제 취소 시
			      if (rsp.cancelled) {
			        alert("결제가 취소되었습니다.");
			      } else {
			        alert("결제가 취소되었습니다.");
			      }
			    }
			  });
			}
		
		function goToHome() {
		      window.location.href = 'index.jsp';
		   }

</script>
</head>
<body>
   <%
      String loginCd = (String) session.getAttribute("loginCode");
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
   <!-- Product section-->
   <section class="py-5">
      <div class="container px-4 px-lg-5 my-5">
         <div class="row gx-4 gx-lg-5">
            <div class="col-md-8">
               <div class="box py-4 px-5">
                  <h2 class="fw-bolder">주문 정보</h2>
                  <table class="table">
                     <thead>
                        <tr>
                           <th scope="col">상품명</th>
                           <th scope="col">수량</th>
                           <th scope="col">가격</th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
			                <td><%=pv.getProdName() %></td>
			                <td><%=orDetail.getOdQty() %></td>
			                <td><%=orDetail.getDoAmount() %></td>
			              </tr>

                     </tbody>
                  </table>
               </div>
            </div>
            <div class="col-md-4">
               <div class="box py-4 px-5">
                  <h2 class="fw-bolder">결제 금액(영수증)</h2>
                  <table class="table">
                     <tbody>
                        <tr>
                           <td>상품금액</td>
                           <td><%=pay.getPayPrice()%></td>
                        </tr>
                        <tr>
                           <td>할인금액</td>
                           <td><%=pay.getPayDc() %></td>
                        </tr>
                        <tr class="table-dark">
                           <td>결제금액</td>
                           <td><%=pay.getPayAmount() %></td>
                        </tr>
                     </tbody>
                  </table>
                  <button type="button" class="btn btn-secondary btn-lg" onclick="requestPay()">결제하기</button>
                  <button type="button" class="btn btn-secondary btn-lg btn-margin" onclick="goToHome()">홈으로</button>
               </div>
            </div>
         </div>
      </div>
   </section>

   <!-- Footer-->
   <footer class="py-5 bg-dark" style="margin-top: 250px;">
      <div class="container">
         <p class="m-0 text-center text-white">Copyright &copy; Multicket 2023</p>
      </div>
   </footer>
   <!-- Bootstrap core JS-->
   <script>
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
   <!-- Core theme JS-->
