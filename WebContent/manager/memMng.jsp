<%@page import="kr.or.ddit.club.vo.ClubVO"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ClubVO club = (ClubVO) session.getAttribute("club");

	IMemberService memberService = MemberServiceImpl.getInstance();
	List<MemberVO> memList = memberService.findAll();
	
	// 회원
	String loginCd = (String) session.getAttribute("loginCode");
%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>구단 관리자 -회원관리</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.jsp">Multicket</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
<!--                         <li><a class="dropdown-item" href="#!">Settings</a></li> -->
<!--                         <li><a class="dropdown-item" href="#!">Activity Log</a></li> -->
<!--                         <li><hr class="dropdown-divider" /></li> -->
                        <li><a class="dropdown-item" href="../Logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">MANAGE</div>
                            <a class="nav-link" href="index.jsp?cbNo=<%=club.getCbName()%>">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                	주문 관리
                            </a>
                            <a class="nav-link" href="../SelectProdController?memId=<%=loginCd %>&cbNo=<%=club.getCbNo()%>">
                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                	상품 관리
                            </a>
                            <a class="nav-link" href="memMng.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                	회원 관리
                            </a>
                            <a class="nav-link" onclick="location.href='../NoticeMngController'">
                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                	공지사항 관리
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
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">KBO SITE DASHBOARD</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">회원관리</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                	회원 리스트
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>생년월일</th>
                                            <th>성별</th>
                                            <th>이메일</th>
                                            <th>전화번호</th>
                                            <th>주소</th>
                                            <th>등급명</th>
                                            <th>구단번호</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>생년월일</th>
                                            <th>성별</th>
                                            <th>이메일</th>
                                            <th>전화번호</th>
                                            <th>주소</th>
                                            <th>등급명</th>
                                            <th>구단번호</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <% for (MemberVO mv : memList) { %>
                                        <tr>
                                            <td><%= mv.getMemId() %></td>
                                            <td><%= mv.getMemName() %></td>
                                            <td><%= mv.getMemBirth() %></td>
                                            <td><%= mv.getMemGender() %></td>
                                            <td><%= mv.getMemEmail() %></td>
                                            <td><%= mv.getMemTel() %></td>
                                            <td><%= mv.getMemAdd() %></td>
                                            <td><%= mv.getMsName() %></td>
                                            <td><%= mv.getCbNo() %></td>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
