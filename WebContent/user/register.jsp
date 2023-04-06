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

                                        </div>


                                        <input type="text" name="id" id="id"
                                               class="form-control" placeholder="Id" required>

                                        <input type="password" name="pwd" id="pwd"
                                               class="form-control" placeholder="PASSWORD" required>

                                        <input type="password" name="pwd-confirm" id="pwd-confirm"
                                               class="form-control" placeholder="PASSWORD confirm" required>
                                
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


    <footer class="site-footer">
        <div class="site-footer-top">
            <div class="container">
                <div class="row">

                    <div class="col-lg-6 col-12">
                        <h3 class="text-white mb-lg-0">Use TripGoGo for your Trip</h3>
                    </div>

                    <div class="col-lg-6 col-12 d-flex justify-content-lg-end align-items-center">
                        <ul class="social-icon d-flex justify-content-lg-end">
                            <li class="social-icon-item">
                                <a href="#" class="social-icon-link">
                                    <span class="bi-twitter"></span>
                                </a>
                            </li>

                            <li class="social-icon-item">
                                <a href="#" class="social-icon-link">
                                    <span class="bi-apple"></span>
                                </a>
                            </li>

                            <li class="social-icon-item">
                                <a href="#" class="social-icon-link">
                                    <span class="bi-instagram"></span>
                                </a>
                            </li>

                            <li class="social-icon-item">
                                <a href="#" class="social-icon-link">
                                    <span class="bi-youtube"></span>
                                </a>
                            </li>

                            <li class="social-icon-item">
                                <a href="#" class="social-icon-link">
                                    <span class="bi-pinterest"></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">

                <div class="col-lg-6 col-12 mb-4 pb-2">
                    <h5 class="site-footer-title mb-3">Links</h5>

                    <ul class="site-footer-links">
                        <li class="site-footer-link-item">
                            <a href="#" class="site-footer-link">Home</a>
                        </li>

                        <li class="site-footer-link-item">
                            <a href="#" class="site-footer-link">About</a>
                        </li>

                        <li class="site-footer-link-item">
                            <a href="#" class="site-footer-link">Info</a>
                        </li>

                        <li class="site-footer-link-item">
                            <a href="#" class="site-footer-link">Route</a>
                        </li>

                        <li class="site-footer-link-item">
                            <a href="#" class="site-footer-link">Trip</a>
                        </li>

                    </ul>
                </div>

                <div class="col-lg-3 col-md-6 col-12 mb-4 mb-lg-0">
                    <h5 class="site-footer-title mb-3">Have a question?</h5>

                    <p class="text-white d-flex mb-1">
                        <a href="tel: 090-080-0760" class="site-footer-link">
                            010-0000-0000
                        </a>
                    </p>

                    <p class="text-white d-flex">
                        <a href="mailto:hello@company.com" class="site-footer-link">
                            hello@ssafy.com
                        </a>
                    </p>
                </div>

                <div class="col-lg-3 col-md-6 col-11 mb-4 mb-lg-0 mb-md-0">
                    <h5 class="site-footer-title mb-3">Location</h5>

                    <p class="text-white d-flex mt-3 mb-2">
                        Silang Junction South, Tagaytay, Cavite, Philippines</p>

                    <a class="link-fx-1 color-contrast-higher mt-3" href="#">
                        <span>Our Maps</span>
                        <svg class="icon" viewBox="0 0 32 32" aria-hidden="true">
                            <g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="16" cy="16" r="15.5"></circle>
                                <line x1="10" y1="18" x2="16" y2="12"></line>
                                <line x1="16" y1="12" x2="22" y2="18"></line>
                            </g>
                        </svg>
                    </a>
                </div>
            </div>
        </div>

        <div class="site-footer-bottom">
            <div class="container">
                <div class="row">

                    <div class="col-lg-3 col-12 mt-5">
                        <p class="copyright-text">Copyright © 2036 Festava Live Company</p>
                        <p class="copyright-text">Distributed by: <a href="https://themewagon.com">ThemeWagon</a></p>
                    </div>

                    <div class="col-lg-8 col-12 mt-lg-5">
                        <ul class="site-footer-links">
                            <li class="site-footer-link-item">
                                <a href="#" class="site-footer-link">Terms &amp; Conditions</a>
                            </li>

                            <li class="site-footer-link-item">
                                <a href="#" class="site-footer-link">Privacy Policy</a>
                            </li>

                            <li class="site-footer-link-item">
                                <a href="#" class="site-footer-link">Your Feedback</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!--

T e m p l a t e M o

-->
    <!-- JAVASCRIPT FILES -->
    <script src="${root}/assets/js/jquery.min.js"></script>
    <script src="${root}/assets/js/bootstrap.min.js"></script>
    <script src="${root}/assets/js/jquery.sticky.js"></script>
    <script src="${root}/assets/js/custom.js"></script>

    <script>

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
            } else {
                let form = document.querySelector("#register-form");
                form.setAttribute("action", "${root}/user");
                form.submit();
            }
        });
    </script>

</body>

</html>