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
          <form  class="custom-form ticket-form mb-5 mb-lg-0" id="find-password-form" method="POST">

            <h2 class="text-center mb-4">Find Password</h2>

            <div class="ticket-form-body">

              <input type="hidden" name="action" value="findpassword">



                <select name="question" id="find-question" class="form-select" aria-label="Default select example"
                        style="font-size: 18px;">
                  <option value="0" selected> 가장 존경하는 선생님</option>
                  <option value="1" > 가장 인상깊게 읽은 책</option>
                  <option value="2" > 졸업한 초등학교</option>
                  <option value="3" > 가장 좋아하는 음식</option>
                </select>

                <div class="col-6" style="padding-right:0px">
                  <input type="text" name="find-answer" id="answer"
                         class="form-control" placeholder="answer" required>
                </div>


              <div class="col-lg-4 col-md-10 col-8 mx-auto" >
                <button type="button" id="send-button" class="btn custom-btn d-lg-block d-none w-100">Send</button>
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

  document.querySelector("#send-button").addEventListener("click", function () {
    if (!document.querySelector("#find-answer").value) {
      alert("답변 입력!!!");
      return;
    }  else {
      let form = document.querySelector("#find-password-form");
      form.setAttribute("action", "${root}/user");
      form.submit();
    }
  });
</script>

</body>

</html>
