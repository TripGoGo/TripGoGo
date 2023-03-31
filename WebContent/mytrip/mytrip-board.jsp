<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <meta name="description" content="" />
    <meta name="author" content="" />
    <script src="https://kit.fontawesome.com/d4a4244bd2.js" crossorigin="anonymous"></script>

    <script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>



    <title>TripGoGo-MyTrip</title>

    <!-- CSS FILES -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />

    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100;200;400;700&display=swap" rel="stylesheet" />

    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <link href="css/bootstrap-icons.css" rel="stylesheet" />
    <link href="css/board.css" rel="stylesheet" />
    <link href="css/mac-style.css" rel="stylesheet" />
    <link href="css/write.css" rel="stylesheet" />


    <link href="css/templatemo-festava-live.css" rel="stylesheet" />
    <!--

TemplateMo 583 Festava Live

https://templatemo.com/tm-583-festava-live

-->

    <style>
        .area {
            display: flex;
            justify-content: center;
            /* border: 1px solid black; */
            background-color: rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }

        .img {
            object-fit: cover;
        }

        li {
            list-style: none;
        }

        .font2 {
            font-size: 10px;
            text-align: center;
            margin-top: 5px;
        }

        .font1 {
            font-size: 15px;
            text-align: center;
            margin-top: 10px;
        }

        .mytripItem{
            min-width: 300px;
            
        }
    </style>
</head>

<body>
    <main> <%@ include file="/include/nav.jsp"%>
        <!-- 여기가 맥북 시작-->
        <div class="board_background" >
            <div class="board">
                <div class="window" style="min-width: 1000px;">
                    <div class="titlebar">
                        <div class="buttons">
                            <div class="close">
                                <a class="closebutton" href="#"><span><strong>x</strong></span></a>
                                <!-- close button link -->
                            </div>
                            <div class="minimize">
                                <a class="minimizebutton" href="#"><span><strong>&ndash;</strong></span></a>
                                <!-- minimize button link -->
                            </div>
                            <div class="zoom">
                                <a class="zoombutton" href="#"><span><strong>+</strong></span></a>
                                <!-- zoom button link -->
                            </div>
                        </div>
                        MyTrip List
                        <!-- window title -->
                    </div>
                    <!-- 여기서부터 내용 작성 부분-->




                    <div class="content">
                        <div class="container d-flex flex-wrap" style="margin:3vh 0vh;">
                            <div class="row justify-content-center" >
                                <div class="col">
                                    <div class="row">
                                        
                                        <div class="col"
                                            style="border:solid 1px gray;height: 200px; border-radius: 10px; overflow: auto; margin-right: 10px;">
                                            <div class="row" style="height: 100%; width: 100%; padding:10px 0px">
                                                <div class="col">
                                                    <img src="./images/pexels-heesang-park-13716545.jpg" alt=""
                                                        style="height:100%; width:100%; border-radius:10px">
                                                </div>
                                                <div class="col" style="overflow: auto;">
                                                    <div class="row" style="font-size: 20px; margin-left: 20%;">
                                                        서울 여행
                                                    </div>
                                                    
                                                    <div class="row font1">DATE :</div>
                                                    <div class="row justify-content-center font2"> 2023.03.30 ~ 2023.04.01</div>

                                                </div>

                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <div class="col" >
                                    <div class="row">
                                        
                                        <div class="col"
                                            style="border:solid 1px gray;height: 200px; border-radius: 10px; overflow: auto; margin-left: 10px;">
                                            <div class="row" style="height: 100%; width: 100%; padding:10px 0px">
                                                <div class="col">
                                                    <img src="./images/pexels-heesang-park-13716545.jpg" alt=""
                                                        style="height:100%; width:100%; border-radius:10px">
                                                </div>
                                                <div class="col" style="overflow: auto;">
                                                    <div class="row justify-content-center" style="font-size: large;">
                                                        부산 여행
                                                    </div>
                                                    
                                                    <div class="row font1">DATE :</div>
                                                    <div class="row justify-content-center font2"> 2023.03.30 ~ 2023.04.01</div>

                                                </div>

                                            </div>

                                        </div>
                                        

                                    </div>
                                </div>


                            </div>






                        </div>

                    </div>

                    <!-- window content -->
                </div>
            </div>
        </div>
        <!-- ©2015 Johannes JakobMade with <3 in Germany -->
        </div>
    </main>
    <footer class="site-footer">
        <div class="site-footer-top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-12">
                        <h2 class="text-white mb-lg-0">Festava Live</h2>
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
                            <a href="#" class="site-footer-link">Artists</a>
                        </li>

                        <li class="site-footer-link-item">
                            <a href="#" class="site-footer-link">Schedule</a>
                        </li>

                        <li class="site-footer-link-item">
                            <a href="#" class="site-footer-link">Pricing</a>
                        </li>

                        <li class="site-footer-link-item">
                            <a href="#" class="site-footer-link">Contact</a>
                        </li>
                    </ul>
                </div>

                <div class="col-lg-3 col-md-6 col-12 mb-4 mb-lg-0">
                    <h5 class="site-footer-title mb-3">Have a question?</h5>

                    <p class="text-white d-flex mb-1">
                        <a href="tel: 090-080-0760" class="site-footer-link"> 090-080-0760 </a>
                    </p>

                    <p class="text-white d-flex">
                        <a href="mailto:hello@company.com" class="site-footer-link"> hello@company.com </a>
                    </p>
                </div>

                <div class="col-lg-3 col-md-6 col-11 mb-4 mb-lg-0 mb-md-0">
                    <h5 class="site-footer-title mb-3">Location</h5>

                    <p class="text-white d-flex mt-3 mb-2">
                        Silang Junction South, Tagaytay, Cavite, Philippines
                    </p>

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
                        <p class="copyright-text">
                            Distributed by: <a href="https://themewagon.com">ThemeWagon</a>
                        </p>
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

</body>

</html>