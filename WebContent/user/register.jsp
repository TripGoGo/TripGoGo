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

    <title>TripGoGo Register</title>

    <!-- CSS FILES -->
    <link rel="preconnect" href="https://fonts.googleapis.com">

    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100;200;400;700&display=swap" rel="stylesheet">

    <link href="${root}/assets/css/bootstrap.min.css" rel="stylesheet">

    <link href="${root}/assets/css/bootstrap-icons.css" rel="stylesheet">

    <link href="${root}/assets/css/templatemo-festava-live.css" rel="stylesheet">
    <!--

TemplateMo 583 Festava Live

https://templatemo.com/tm-583-festava-live

-->

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
                        <form class="custom-form ticket-form mb-5 mb-lg-0" id="register-form" method="POST">
                            <h2 class="text-center mb-4">Register</h2>

                            <div class="ticket-form-body">

                                    <input type="hidden" name="action" value="register">
                                    <div class="container">

                                        <div class="row">
                                            <div class="col-6" style="margin: 0px;padding: 0px;">
                                                <input type="text" name="name" id="name"
                                                       class="form-control" placeholder="NAME" required>
                                            </div>

                                            <div class="col-6" style="padding-right:0px">
                                                <input type="text" name="email" id="email"
                                                       class="form-control" placeholder="email" required>
                                            </div>
                                            <div style="margin:0px; padding:0px" id="email-result"></div>

                                        </div>


                                        <input type="text" name="id" id="id"
                                               class="form-control" placeholder="Id" required>

                                        <div style="margin:0px; padding:0px" id="idcheck-result"></div>

                                        <input type="password" name="pwd" id="pwd"
                                               class="form-control" placeholder="PASSWORD" required>

                                        <div style="margin:0px; padding:0px" id="pwd-result"></div>

                                        <input type="password" name="pwd-confirm" id="pwd-confirm"
                                               class="form-control" placeholder="PASSWORD confirm" required>
                                        <div style="margin:0px; padding:0px" id="password-confirm-result"></div>
                                
                                    </div>

                                    <div class="col-lg-4 col-md-10 col-8 mx-auto" style="margin: 20px 0px;">
                                        <a href="${root}/user?action=mvlogin" class="btn custom-btn d-lg-block d-none" style="background-color: black;">Login</a>
                                    </div>

                                    <div class="col-lg-4 col-md-10 col-8 mx-auto" >
                                        <button type="button" id="register-button" class="btn custom-btn d-lg-block d-none">Register</button>
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
        var validation = true;
<%--       아이디 유효성 검사--%>
        document.querySelector("#id").addEventListener("keyup", function () {
            let userid = this.value;
            console.log(userid);
            let resultDiv = document.querySelector("#idcheck-result");
            if(userid.length < 5 || userid.length > 16) {
                resultDiv.setAttribute("class", "mb-3 text-dark");
                resultDiv.textContent = "아이디는 5자 이상 16자 이하 입니다.";
                validation = false;

            } else {
                fetch("${root}/user?action=idcheck&userid=" + userid)
                    .then((response) => response.text())
                    .then((data) => {
                        console.log(data);
                        if(data == 0) {
                            resultDiv.setAttribute("class", "mb-3 text-primary");
                            resultDiv.textContent = userid + "는 사용할 수 있습니다.";
                            validation = true;

                        } else {
                            resultDiv.setAttribute("class", "mb-3 text-danger");
                            resultDiv.textContent = userid + "는 사용할 수 없습니다.";
                            validation = false;
                        }
                    });
            }
        });

<%-- 비밀번호 유효성 검사--%>
        document.querySelector("#pwd").addEventListener("keyup", function () {
            let pwd = this.value;
            let regPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;

            let resultDiv = document.querySelector("#pwd-result");
            if(regPw.test(pwd) === false){
                console.log("정규식 됨");
                resultDiv.setAttribute("class", "mb-3 text-danger");
                resultDiv.textContent = "숫자, 특수문자 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력하세요";
            } else{
                resultDiv.setAttribute("class", "mb-3 text-danger");
                resultDiv.textContent = "정상적인 비밀번호입니다";
                validation = true;
            }
        });


        document.querySelector("#pwd-confirm").addEventListener("keyup", function () {
            let pwdConfirm = this.value;
            let pwd = document.getElementById("pwd").value;
            console.log(pwd);
            let resultDiv = document.querySelector("#password-confirm-result");
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


        document.querySelector("#register-button").addEventListener("click", function () {
            if (!document.querySelector("#id").value) {
                alert("아이디 입력!!");
                return;
            } else if (!document.querySelector("#email").value) {
                alert("email 입력!!");
                return;
            } else if (!document.querySelector("#pwd").value) {
                alert("비밀번호 입력!!");
                return;
            } else if (!document.querySelector("#name").value) {
                alert("이름 입력!!");
                return;
            } else if (document.querySelector("#pwd-confirm").value != document.querySelector("#pwd").value) {
                alert("비밀번호가 다릅니다!!");
                return;
            }
            else {
                let form = document.querySelector("#register-form");
                form.setAttribute("action", "${root}/user");
                form.submit();
            }
        });
    </script>

</body>

</html>