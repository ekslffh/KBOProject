<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
   content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">
<title>Checkout example · Bootstrap v5.2</title>

<link rel="canonical"
   href="https://getbootstrap.com/docs/5.2/examples/checkout/">

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
<link href="css/join.css" rel="stylesheet">
</head>
<body class="bg-light">

   <div class="container">

      <main>
         <div class="py-5 text-center">
            <!-- <img class="d-block mx-auto mb-4"
               src="../assets/brand/bootstrap-logo.svg" alt="" width="72"
               height="57"> -->
            <h2>JOIN US</h2>
            <p class="lead">공식 야구 예매 사이트 멀티켓에 오신 걸 환영합니다~!</p>
         </div>

         <div>
            <div class="col-md-12">
               <h4 class="mb-3">회원 가입</h4>
               <form class="form-horizontal" action="" method="post"
                  onsubmit="return valid()">
                  <div class="row g-3">

                     <div class="form-group">
                        <label for="id" class="form-label">아이디 <span class="rq">
                              *</span></label> <input type="text" class="form-control" id="id" name="memId"
                           placeholder="Enter Id" pattern="[a-zA-Z][a-zA-Z0-9]{5,16}"
                           required> <span class="point">첫 자리 영문, 나머지는
                           영문+숫자, 5-15글자 내로 입력하여 주십시오.</span>
                        <div style="text-align: left">
                           <button type="button" class="btn btn-success btn-sm" id="idChk">중복검사</button>
                           <span id="disp"></span>
                        </div>
                     </div>


                     <div class="form-group">
                        <label for="pass" class="form-label">비밀번호 <span
                           class="rq"> *</span></label>
                        <div class="col-sm-6"></div>
                        <input type="password" class="form-control" id="pass"
                           name="memPw"
                           pattern="(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+|]).{8,12}"
                           required> <span class="point">영문, 숫자, 특수문자 포함 최소
                           8자부터 입력해주세요.</span> <br>
                     </div>
                     <br>
                     <div class="form-group">
                        <label for="pass" class="from-label"> 비밀번호 재확인 <span
                           class="rq"> *</span></label>
                        <div class="col-sm-6">
                           <input type="password" class="form-control" id="pwChk"
                              placeholder="입력하신 비밀번호를 다시 입력해주세요."
                              pattern="(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+|]).{8,12}"
                              required>
                        </div>
                        <div class="col-sm-6" style="text-align: left">
                           <button type="button" class="btn btn-success btn-sm"
                              id="pwChkBtn">확인</button>
                           <span id="disp2"></span>
                        </div>
                        <br>
                     </div>




                     <div class="form-group">
                        <label for="name" class="form-label">이름 <span class="rq">
                              *</span></label> <span class="sp"></span>
                        <div class="col-sm-12">
                           <input type="text" class="form-control" id="name"
                              name="memName" pattern="[가-힣]{2,5}" required>
                        </div>
                        <br>
                     </div>




                     <div class="form-group">
                        <label for="birth" lass="control-label col-sm-2">생년월일</label>
                        <div class="col-sm-6">
                           <input type="date" class="form-control" id="birth"
                              name="memBirth">
                        </div>
                        <br>
                     </div>




                     <!--                      <div class="col-12"> -->
                     <!--                         <label for="address2" class="form-label">Address 2 <span -->
                     <!--                            class="text-muted">(Optional)</span></label> <input type="text" -->
                     <!--                            class="form-control" id="address2" -->
                     <!--                            placeholder="Apartment or suite"> -->
                     <!--                      </div> -->

                     <div class="form-group">
                        <label for="gender" class="control-label col-sm-2">성별</label>
                        <div class="col-sm-6">
                           <input type="radio" id="gender" name="memGender" value="여">
                           여 <input type="radio" id="gender" name="memGender" value="남">
                           남
                        </div>
                        <br>
                     </div>

                     <!--                   <div class="col-md-5"> -->
                     <!--                      <label for="country" class="form-label">Country</label> <select -->
                     <!--                         class="form-select" id="country" required> -->
                     <!--                         <option value="">Choose...</option> -->
                     <!--                         <option>United States</option> -->
                     <!--                      </select> -->
                     <!--                      <div class="invalid-feedback">Please select a valid -->
                     <!--                         country.</div> -->
                     <!--                   </div> -->

                     <!-- 메일 -->
                     <div class="form-group">
                        <label for="mail" class="control-label col-sm-2">이메일<span
                           class="rq"> *</span></label>
                        <div class="col-sm-6">
                           <input type="email" class="form-control" id="mail"
                              name="memEmail"
                              pattern="[0-9a-zA-Z]+@[0-9a-zA-Z]+(\.[a-z]+){1,2}">
                        </div>
                        <br>
                        <!--       영문숫자 조합이 최소 1회 이상 반복 @발생 문자 최소 1회 반복 dot(.)으로 시작하는 영문자 1~2회 발생 -->
                     </div>

                     <!--                   <div class="col-md-4"> -->
                     <!--                      <label for="state" class="form-label">State</label> <select -->
                     <!--                         class="form-select" id="state" required> -->
                     <!--                         <option value="">Choose...</option> -->
                     <!--                         <option>California</option> -->
                     <!--                      </select> -->
                     <!--                      <div class="invalid-feedback">Please provide a valid state.</div> -->
                     <!--                   </div> -->

                     <!-- 전화번호 -->
                     <div class="form-group">
                        <label for="tel" class="control-label col-sm-2">연락처 <span
                           class="rq"> *</span></label>
                        <div class="col-sm-6">
                           <input type="text" class="form-control" id="tel" name="memTel"
                              placeholder="- 없이 입력해주세요"
                              pattern="[0-9]{2,3}[0-9]{3,4}[0-9]{4}" required>
                        </div>
                        <div class="col-sm-6" style="text-align: left;">
                           <button type="button" id="telBtn"
                              class="btn btn-success btn-sm">인증 번호 보내기</button>
                           <span id="disp3"></span>
                        </div>
                        <br>
                     </div>

                     <!--                   <div class="col-md-3"> -->
                     <!--                      <label for="zip" class="form-label">Zip</label> <input -->
                     <!--                         type="text" class="form-control" id="zip" placeholder="" -->
                     <!--                         required> -->
                     <!--                      <div class="invalid-feedback">Zip code required.</div> -->
                     <!--                   </div> -->

                     <div class="form-group">
                        <label for="telChk" class="control-label col-sm-2">인증번호
                           <span class="rq"> *</span>
                        </label>
                        <div class="col-sm-6">
                           <input type="text" class="form-control" id="chkRndNum"
                              placeholder="인증번호를 입력해주세요.">
                        </div>
                        <div class="col-sm-6" style="text-align: left;">
                           <button type="button" id="telChkBtn"
                              class="btn btn-success btn-sm">본인 인증하기</button>
                           <span id="disp4"></span>
                        </div>
                        <br>
                     </div>

                     <!-- 우편번호 -->
                     <div class="form-group">
                        <label for="add" class="control-label col-sm-2">우편번호 <span
                           class="rq"> *</span></label>
                        <div class="col-sm-6">
                           <input type="text" class="form-control" id="add" name="memAdd"
                              required>
                        </div>
                        <div class="col-sm-2">
                           <button type="button" id="addrBtn"
                              class="btn btn-success btn-sm">주소검색</button>
                        </div>
                        <br>
                     </div>

                     <div class="form-group">
                        <label for="add1" class="control-label col-sm-2">주소 <span
                           class="rq"> *</span></label>
                        <div class="col-sm-6">
                           <input type="text" class="form-control" id="add1"
                              name="memAdd1" required>
                        </div>
                        <br>
                     </div>

                     <div class="form-group">
                        <label for="add2" class="control-label col-sm-2">상세주소 <span
                           class="rq"> *</span></label>
                        <div class="col-sm-6">
                           <input type="text" class="form-control" id="add2"
                              name="memAdd2" required>
                        </div>
                        <br>

                     </div>



                     <!-- 마이팀 -->
                     <div class="form-group">
                        <label for="myclub" class="control-label col-sm-2">마이팀</label>
                        <div class="col-sm-6">
                           <select id="myclub" name="cbNo">
                              <option id="myclub" value="none">== 구단선택 ==</option>
                              <option id="myclub" value="CB001">한화 이글스</option>
                              <option id="myclub" value="CB002">SSG 랜더스</option>
                              <option id="myclub" value="CB003">키움 히어로즈</option>
                              <option id="myclub" value="CB004">LG 트윈스</option>
                              <option id="myclub" value="CB005">KT 위즈</option>
                              <option id="myclub" value="CB006">KIA 타이거즈</option>
                              <option id="myclub" value="CB007">NC 다이노스</option>
                              <option id="myclub" value="CB008">삼성 라이온즈</option>
                              <option id="myclub" value="CB009">롯데 자이언츠</option>
                              <option id="myclub" value="CB010">두산 베어스</option>
                           </select>
                        </div>
                     </div>

                     <hr class="my-4">

                     <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-6">
                           <button class="w-75 btn btn-primary btn-md" type="submit">
                              가입하기</button>
                           <span id="joinspan"></span>
                        </div>
                     </div>
               </form>
            </div>
         </div>
      </main>

   </div>
   <script src="js/join.js"></script>
   <script
      src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script>
      $('#idChk').on('click', function() {

         $('#disp').text("");

         let idVal = $('#id').val();

         if (idVal.trim().length == 0)
            return;

         $.ajax({
            url : 'idChk.jsp',
            type : 'post',
            data : {
               'id' : idVal
            },
            success : function(data) {
               console.log(data);
               if (data.code == "ok") {
                  $('#disp').text(data.msg).css('color', 'green');
               } else {
                  $('#disp').text(data.msg).css('color', 'red');
               }
            },
            error : function(xhr) {
            	if (xhr.status == 200) {
            		alert("인증번호가 발송되었습니다.");
            	} 
            },
            dataType : 'json'
         });
      });

      $('#pwChkBtn').on('click', function() {
         $('#disp2').text();

         let pass = $('#pass').val();
         let pwChk = $('#pwChk').val();

         if (pass == pwChk) {
            $('#disp2').text("비밀번호가 일치합니다.").css('color', 'green');
         } else {
            $('#disp2').text("입력한 비밀번호가 다릅니다.").css('color', 'red');
         }
      });

      $('#addrBtn')
            .on(
                  'click',
                  function() {
                     // daum 주소  api로 검색하여 긁어온 코드 
                     new daum.Postcode(
                           {
                              oncomplete : function(data) {

                                 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                 // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                                 // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                 var roadAddr = data.roadAddress; // 도로명 주소 변수
                                 var extraRoadAddr = ''; // 참고 항목 변수

                                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                 if (data.bname !== ''
                                       && /[동|로|가]$/g
                                             .test(data.bname)) {
                                    extraRoadAddr += data.bname;
                                 }
                                 // 건물명이 있고, 공동주택일 경우 추가한다.
                                 if (data.buildingName !== ''
                                       && data.apartment === 'Y') {
                                    extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                          + data.buildingName
                                          : data.buildingName);
                                 }
                                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                 if (extraRoadAddr !== '') {
                                    extraRoadAddr = ' ('
                                          + extraRoadAddr + ')';
                                 }

                                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                 document.getElementById('add').value = data.zonecode;
                                 document.getElementById("add1").value = roadAddr;
                                 //                 document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                              }
                           }).open();
                  });

      $('#telBtn').on('click', function() {
         $('#disp3').text();

         let telVal = $('#tel').val();

         //    alert(telVal);

         if (telVal.trim().length == 0)
            return;

         $.ajax({
            url : 'telChk.jsp',
            type : 'post',
            data : {
               'tel' : telVal
            },
            success : function(data) {
               console.log(data);
               if (data.code == "ok") {
                  $('#disp3').text(data.msg).css('color', 'green');
                  randNum = data.rndNum;
               } else {
                  $('#disp3').text(data.msg).css('color', 'red');
               }
            },
            error : function(xhr) {
               alert("상태 >> " + xhr.status);
            },
            dataType : 'json'
         });
      });

      var randNum = 0;

      $('#telChkBtn').on('click', function() {

         $('#disp4').text("");

         var chkRndNum = $('#chkRndNum').val();

         if (chkRndNum == randNum) {
            $('#disp4').text("인증성공!").css('color', 'green');
            alert("인증 성공");
         } else {
            $('#disp4').text("인증실패!").css('color', 'red');
            alert("인증번호가 일치하지 않습니다.")
         }
      });
      function valid() {

         // submit 이벤트가 실행되면서 화면전환되는 현상을 막기
         event.preventDefault();

         // 1. serialize()를 이용한 직렬화 (= 서버로 전송가능한 문자열 데이터)
         //jQuery - serialize()를 이용해서 form 안쪽 데이터들을 일괄로 직렬화 해줌
         //form 안에 존재하는 입력 양식 요소들 중 name 속성을 갖는 항목을 모두 엮어서 key = value1&key=value2...의 문자열 형태를 제공
         // > 서버에 보낼 수 있는 데이터 형태 제공ㅇ\]]]]
         console.log("데이터 직렬 화 >> ", $('form').serialize());

         //jQuery ajax는 object 형태의 데이터를 자동으로 urlendcoded 형식으로 변환하여 전송함
         let data = $('form').serializeArray();

         // ajax 처리하기 - jQuery
         $.ajax({
            type : 'post',
            url : 'serializeArr.jsp',
            data : JSON.stringify(data), // 문자열 처리후 서버로 전송
            success : function(result) {
               console.log(typeof result);
               if (result == 1) {
                  let conf = confirm("가입에 성공했습니다. 로그인 페이지로 이동할까요?");
                  if (conf)
                     location.href = "./login.jsp"
                     // 출력 위치 가입 상태를 표시
                  $('#joinspan').text("가입 성공!").css('color', 'green');
               } else {
                  $('#joinspan').text("가입 실패...").css('color', 'gray');
               }
            },
            error : function(xhr) {
               console.log("상태 : " + xhr.status);
            }
         //          ,dataType:'text'
         });

      }
   </script>
</body>