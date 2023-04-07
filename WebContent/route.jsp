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
    <title>대중교통 길찾기</title>
    <!-- CSS FILES -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Outfit:wght@100;200;400;700&display=swap"
            rel="stylesheet"
    />
    <link href="${root}/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${root}/assets/css/bootstrap-icons.css" rel="stylesheet" />
    <link href="${root}/assets/css/templatemo-festava-live.css" rel="stylesheet" />
    <link href="${root}/assets/css/board.css" rel="stylesheet" />
    <link href="${root}/assets/css/mac-style.css" rel="stylesheet" />
    <link href="${root}/assets/css/write.css" rel="stylesheet" />
    <link href="${root}/assets/css/route.css" rel="stylesheet" />
</head>
<body>
<%@ include file="/include/nav.jsp" %>
<main>
    <div class="board_background">
        <div class="board">
            <div class="window">
                <div class="titlebar">
                    <div class="buttons">
                        <div class="close">
                            <a class="closebutton" href="#"
                            ><span><strong>x</strong></span></a
                            >
                            <!-- close button link -->
                        </div>
                        <div class="minimize">
                            <a class="minimizebutton" href="#"
                            ><span><strong>&ndash;</strong></span></a
                            >
                            <!-- minimize button link -->
                        </div>
                        <div class="zoom">
                            <a class="zoombutton" href="#"
                            ><span><strong>+</strong></span></a
                            >
                            <!-- zoom button link -->
                        </div>
                    </div>
                    길찾기
                    <!-- window title -->
                </div>
                <div class="content" style="min-height: 600px;">
                    <div style="width: 100%; height: 30px; margin-bottom: 10px">
                    </div>
                    <div class="row d-flex justify-content-center" style="line-height: 38px">
                        <!-- 관광지 검색 start -->
                        <div style="width:350px; height:30px">
                            <input class="route-search" id="search-departures" type="text" placeholder="departure..." style="width:300px"/>
                            <button id="btn-search-departures" class="btn-search" type="button" style="background-color: transparent; border: 0px; width:20px">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>
                            <ul class="search-results" id="departures-list" style="padding: 0px; padding-right: 26px;"></ul>
                            </ul>
                        </div>
                        <div style="width:350px; height:30px">
                            <input class="route-search" id="search-arrivals" type="text" placeholder="arrival..." style="width:300px"/>
                            <button id="btn-search-arrivals" class="btn-search" type="button" style="background-color: transparent; border: 0px; width:20px">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>
                            <ul class="search-results" id="arrivals-list" style="padding: 0px; padding-right: 26px;">
                            </ul>
                        </div>
                        <button class="btn" id="btn-search-route" style="width: 50px; text-align: center;">find</button>
                    </div>
                    <div
                            id="route-result"
                            class="tab-content"
                    >
                        <div id="map" class="mb-3" style="width: 100%; height: 500px"></div>
                    </div>
                </div>
                <!-- window content -->
            </div>
        </div>
    </div>
    <!-- ©2015 Johannes JakobMade with <3 in Germany -->
    </div>
</main>
<%@ include file="/include/footer.jsp" %>
<!-- JAVASCRIPT FILES -->
<script src="${root}/assets/js/bootstrap.min.js"></script>
<script src="${root}/assets/js/custom.js"></script>
<script
        type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=24073e84e8ac256ed85efd18c525e7a9"
></script>
<script src="${root}/assets/js/route.js"></script>

</body>
</html>

