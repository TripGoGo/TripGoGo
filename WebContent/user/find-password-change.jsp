<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="msg" value="${msg}"/>

<c:if test="${not empty msg}">
  <script>
    alert("${msg}");
  </script>
</c:if>

<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta name="description" content="">
  <meta name="author" content="">

  <title>TripGoGo Login</title>

  <!-- CSS FILES -->
  <link rel="preconnect" href="https://fonts.googleapis.com">

  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100;200;400;700&display=swap" rel="stylesheet">

  <link href="${root}/assets/css/bootstrap.min.css" rel="stylesheet">

  <link href="${root}/assets/css/bootstrap-icons.css" rel="stylesheet">

  <link href="${root}/assets/css/templatemo-festava-live.css" rel="stylesheet">


</head>

<body>
<main>
  <%@ include file="/include/nav-user.jsp" %>

  <section class="login-section section-padding " style="height:100vh; display:flex; align-items: center;">

    <div class="section-overlay">
      <div class="video-wrap">
        <video autoplay="" loop="" muted="" class="custom-video" poster="">
          <source src="${root}/assets/video/pexels-olya-kobruseva-5236593.mp4" type="video/mp4">

          Your browser does not support the video tag.
        </video>
      </div>
    </div>

    <div class="container">
      <div class="row">

        <div class="col-lg-6 col-10 mx-auto">
          <!-- 여기서부터 login form 부분-->
          <form  class="custom-form ticket-form mb-5 mb-lg-0" id="change-password-form" method="POST">

            <h2 class="text-center mb-4">Change Password</h2>

            <div class="ticket-form-body">

              <input type="hidden" name="action" value="changepassword">

              <input type="text" name="id" id="change-id"
                     class="form-control" placeholder="ID" required>



              <input type="password" name="pwd" id="change-pwd"
                     class="form-control" placeholder="PASSWORD" required>

              <div style="margin:0px; padding:0px" id="change-pwd-result"></div>

              <input type="password" name="pwd-confirm" id="change-pwd-confirm"
                     class="form-control" placeholder="PASSWORD confirm" required>
              <div style="margin:0px; padding:0px" id="change-password-confirm-result"></div>


              <div class="col-lg-4 col-md-10 col-8 mx-auto" >
                <button type="button" id="change-button" class="btn custom-btn d-lg-block d-none w-100">Change</button>
              </div>


            </div>
          </form>

        </div>
      </div>
    </div>
  </section>
</main>


<%@ include file="/include/footer.jsp" %>

<!--

T e m p l a t e M o

-->
<!-- JAVASCRIPT FILES -->
<script src="${root}/assets/js/jquery.min.js"></script>
<script src="${root}/assets/js/bootstrap.min.js"></script>
<script src="${root}/assets/js/jquery.sticky.js"></script>
<script src="${root}/assets/js/custom.js"></script>

<script>
  <%--document.querySelector("#btn-mv-join").addEventListener("click", function () {--%>
  <%--    location.href = "${root}/user?action=mvjoin";--%>
  <%--});--%>

  <%-- 비밀번호 유효성 검사--%>
  document.querySelector("#change-pwd").addEventListener("keyup", function () {
    let pwd = this.value;
    let regPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;

    let resultDiv = document.querySelector("#change-pwd-result");
    if(regPw.test(pwd) === false){
      console.log("정규식 됨");
      resultDiv.setAttribute("class", "mb-3 text-danger");
      resultDiv.textContent = "숫자, 특수문자 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력하세요";
    } else{
      resultDiv.setAttribute("class", "mb-3 text-primary");
      resultDiv.textContent = "정상적인 비밀번호입니다";
      validation = true;
    }
  });


  document.querySelector("#change-pwd-confirm").addEventListener("keyup", function () {
    let pwdConfirm = this.value;
    let pwd = document.getElementById("pwd").value;
    console.log(pwd);
    let resultDiv = document.querySelector("#change-password-confirm-result");
    if(pwdConfirm != pwd) {
      resultDiv.setAttribute("class", "mb-3 text-danger");
      resultDiv.textContent = "입력된 비밀번호를 다시 확인하세요";
      validation = false;
    }else{
      resultDiv.setAttribute("class", "mb-3 text-primary");
      resultDiv.textContent = "비밀번호가 확인되었습니다";
      validation = true;
    }
  });

  document.querySelector("#change-button").addEventListener("click", function () {
    if (!document.querySelector("#change-id").value) {
      alert("아이디를 입력하세요 !!");
      return;
    }else if (!document.querySelector("#change-pwd").value) {
      alert("새로운 비밀번호 입력하세요 !!");
      return;
    } else if (!document.querySelector("#change-pwd-confirm").value) {
      alert("비밀번호 확인하세요");
      return;
    } else {
      let form = document.querySelector("#change-password-form");
      form.setAttribute("action", "${root}/user");
      form.submit();
    }
  });
</script>

</body>

</html>
