<%@page import="kr.or.ddit.product.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String prodNo = request.getParameter("prodNo");

ProductVO findById = (ProductVO) request.getAttribute("findById");

%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Register - SB Admin</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <style>
        body {
            background-color: #f8f9fc; /* 회색 계열의 배경색 */
        }

        .bg-primary {
            background-color: #f8f9fc !important; /* 회색 계열의 배경색 */
        }

        .btn-primary {
            background-color: #6c757d; /* 회색 계열의 버튼 색상 */
            border-color: #6c757d; /* 회색 계열의 버튼 테두리 색상 */
        }
        
        .btn-primary:hover {
            background-color: #c0c0c0; /* 회색 계열의 버튼 호버 색상 */
            border-color: #c0c0c0; /* 회색 계열의 버튼 호버 테두리 색상 */
        }
        
        .form-control.editable {
            background-color: #f8f9fc; /* 회색 계열의 배경색 */
            border-color: #f8f9fc; /* 회색 계열의 테두리 색상 */
        }
        
        .form-control.editable:focus {
            background-color: #fff; /* 흰색 배경색 */
            border-color: #6c757d; /* 회색 계열의 테두리 색상 */
            box-shadow: none; /* 포커스 효과 제거 */
        }
        #inputDetail{
        min-height: 300px; /* 원하는 세로 길이로 조정해주세요 */
        }
    </style>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">GOODS INFO UPDATE</h3></div>
                                    <div class="card-body">
                                        <form method="post" action="/KBOProject/UpdateProdController?prodNo=<%=findById.getProdNo() %>&atch=<%=findById.getAtchFileId() %>" accept-charset="UTF-8" enctype="multipart/form-data">
                                    		<input type="hidden" name="atchFileId" value="<%= findById.getAtchFileId()%>" />
									    <div class="row mb-3">
									        <div class="col-md-12 mb-3">
									            <div class="form-floating mb-3 mb-md-0">
									                <input class="form-control editable" name="atch" id="inputFirstName" type="file" placeholder="Enter your first name" />
<!-- 									                <label for="inputFirstName">제품 번호</label> -->
									            </div>
									        </div>
									        <div class="col-md-6">
									            <div class="form-floating mb-3 mb-md-0">
									                <input class="form-control editable" name="prodNo" id="inputFirstName" type="text" placeholder="Enter your first name" value="<%=findById.getProdNo() %>" disabled  />
									                <label for="inputFirstName">제품 번호</label>
									            </div>
									        </div>
									        <div class="col-md-6">
									            <div class="form-floating">
									                <input class="form-control editable" name="cgName" id="inputLastName" type="text" placeholder="Enter your last name" value="<%=findById.getCgName() %>"  />
									                <label for="inputLastName">카테고리</label>
									            </div>
									        </div>
									    </div>
									    <div class="form-floating mb-3">
									        <input class="form-control editable" name="prodName" id="inputEmail" type="text" placeholder="name@example.com" value="<%=findById.getProdName() %>" />
									        <label for="inputEmail">상품명</label>
									    </div>
									    <div class="form-floating mb-3">
										    <textarea class="form-control editable" name="prodDetail" id="inputDetail" placeholder="Enter product details" rows="5"><%=findById.getProdDetail() %></textarea>
										    <label for="inputDetail">상세정보</label>
										</div>
									    <div class="row mb-3">
									        <div class="col-md-6">
									            <div class="form-floating mb-3 mb-md-0">
									                <input class="form-control editable" name="prodPrice" id="inputPassword" type="text" placeholder="Create a password" value="<%=findById.getProdPrice() %>" />
									                <label for="inputPassword">가격</label>
									            </div>
									        </div>
									        <div class="col-md-6">
									            <div class="form-floating mb-3 mb-md-0">
									                <input name="prodStock" class="form-control editable" id="inputPasswordConfirm" type="text" placeholder="Confirm password" value="<%=findById.getProdStock() %>" />
									                <label for="inputPasswordConfirm">재고</label>
									            </div>
									        </div>
									    </div>
									    <div class="mt-4 mb-0">
									        <div class="d-grid">
									            <button class="btn btn-primary btn-block" type="submit">수정</button>
									        </div>
									    </div>
									</form>

                                    </div>
<!--                                     <div class="card-footer text-center py-3"> -->
<!--                                         <div class="small"><a href="login.html">Have an account? Go to login</a></div> -->
<!--                                     </div> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
