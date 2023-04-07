<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">

    <title>TripGoGo Change MyPage</title>

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
                        <!-- 여기서부터 회원가입 form 부분-->
                        <form class="custom-form ticket-form mb-5 mb-lg-0" id="modifyForm" method="POST" action="${root}/user">
                            <h2 class="text-center mb-4">Change MyPage</h2>

                            <input type="hidden" name="action" value="modifyuser">
                            <div class="ticket-form-body">
                                <div class="container">

                                    <div class="row">
                                        <div class="col-6" style="margin: 0px;padding: 0px;">
                                            <input type="text" name="name" id="modify-name"
                                                   class="form-control" value="${user.userName}" required>
                                        </div>

                                        <div class="col-6" style="padding-right:0px">
                                            <input type="text" name="email" id="modify-email"
                                                   class="form-control" value="${user.email}" required>
                                        </div>

                                    </div>


                                    <input type="hidden" name="id" id="modify-id"
                                           class="form-control" value="${user.userId}">

                                    <input type="password" name="pwd" id="modify-pwd"
                                           class="form-control"  placeholder="PASSWORD" required>
                                    <div style="margin:0px; padding:0px" id="modify-pwd-result"></div>

                                    <input type="password" name="pwd-confirm" id="modify-pwd-confirm"
                                           class="form-control" placeholder="PASSWORD confirm" required>
                                    <div style="margin:0px; padding:0px" id="modify-password-confirm-result"></div>

                                </div>


                                <div class="col-lg-4 col-md-10 col-8 mx-auto" >
                                    <button type="button" id="submitBtn" class="btn custom-btn d-lg-block d-none">SUBMIT</button>
                                </div>
                                <div class="col-lg-4 col-md-10 col-8 mx-auto" style="margin-top: 20px;">
                                    <a href="${root}/user?action=mvmypage&id=${userinfo.userId}" class="btn custom-btn d-lg-block d-none" style="background-color: black;">CANCEL</a>
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
        // querySelector("#modify-form");
        <%--f.setAttribute("action", "${root}/user");--%>
        <%--document.querySelector("#submitBtn").addEventListener("click", function () {--%>
        <%--    console.log("aaaaa");--%>
        <%--    // console.log(document.forms["modify-form"]);--%>
        <%--    // document.forms["modify-form"].submit();--%>
        <%--    let f = document.querySelector("#modifyForm");--%>
        <%--    console.log(f);--%>
        <%--    f.submit();--%>
        <%--    // t();--%>
        <%--    &lt;%&ndash;let f = document.getElementById("modify-form");&ndash;%&gt;--%>
        <%--    &lt;%&ndash;// querySelector("#modify-form");&ndash;%&gt;--%>
        <%--    &lt;%&ndash;f.setAttribute("action", "${root}/user");&ndash;%&gt;--%>
        <%--    &lt;%&ndash;console.log(f);&ndash;%&gt;--%>
        <%--    &lt;%&ndash;f.submit();&ndash;%&gt;--%>
        <%--    &lt;%&ndash;// HTMLFormElement.prototype.submit.call(f);&ndash;%&gt;--%>
        <%--});--%>


        var validation = true;
        <%-- 비밀번호 유효성 검사--%>
        document.querySelector("#modify-pwd").addEventListener("keyup", function () {
            let pwd = this.value;
            let regPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;

            let resultDiv = document.querySelector("#modify-pwd-result");
            if(regPw.test(pwd) === false){
                console.log("정규식 됨");
                resultDiv.setAttribute("class", "mb-3 text-danger");
                resultDiv.textContent = "숫자, 특수문자 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력하세요";
                validation = false;
            } else{
                resultDiv.setAttribute("class", "mb-3 text-primary");
                resultDiv.textContent = "정상적인 비밀번호입니다";
                validation = true;
            }
        });


        document.querySelector("#modify-pwd-confirm").addEventListener("keyup", function () {
            let pwdConfirm = this.value;
            let pwd = document.getElementById("modify-pwd").value;
            console.log(pwd);
            let resultDiv = document.querySelector("#modify-password-confirm-result");
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


        document.querySelector("#submitBtn").addEventListener("click", function () {
            if (!document.querySelector("#modify-name").value) {
                alert("이름 입력!!");
                return;
            } else if (!document.querySelector("#modify-pwd").value) {
                alert("비밀번호 입력!!");
                return;
            } else if (!document.querySelector("#modify-email").value) {
                alert("email 입력!!");
                return;
            } else if(! validation){
                alert("입력을 다시 확인하세요");
            }
            else {
                let f = document.querySelector("#modifyForm");
                console.log(f);
                f.submit();
            }
        });
    </script>


</body>

</html>