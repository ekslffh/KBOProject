<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
   content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">
<title>Signin Template · Bootstrap v5.2</title>

<link rel="canonical"
   href="https://getbootstrap.com/docs/5.2/examples/sign-in/">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
   crossorigin="anonymous">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
   crossorigin="anonymous"></script>

<style>
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


<!-- Custom styles for this template -->
<link href="css/login.css" rel="stylesheet">
</head>

<body class="text-center">
   
   <main class="form-signin w-100 m-auto">
      <form method="post" action="Login">
         <!-- <img class="mb-4" src="../assets/brand/bootstrap-logo.svg" alt=""
            width="72" height="57"> -->
         <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

         <div class="form-floating">
            <input class="form-control" id="memId" name="memId" placeholder="ID"> <label for="memId">ID</label>
         </div>
         <div class="form-floating">
            <input type="password" class="form-control" id="memPw" name="memPw" placeholder="Password"> <label for="memPw">Password</label>
         </div>
         <div id="login-fail" style="color: red; font-weight: bold; display: <%= request.getAttribute("loginFail") != null ? "block" : "none" %>;">
			<%= request.getAttribute("loginFail") %>
		 </div>

         <div class="checkbox mb-3">
            <!-- <label> <input type="checkbox" value="remember-me">
               Remember me
            </label> -->
            <div>
            </div>
         </div>
         <button class="w-100 btn btn-lg btn-primary" type="submit">Sign
            in</button>
         <div class="btn-group d-flex justify-content-end" role="group" aria-label="Basic outlined example" style="size: 30px">
           <button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='find-id.jsp'">아이디찾기</button>
           <button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='find-pw.jsp'">비밀번호찾기</button>
         </div>
         <p class="mt-5 mb-3 text-muted">&copy; 2023-2300</p>
      </form>
   </main>
</body>
</html>