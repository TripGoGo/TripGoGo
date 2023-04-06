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
    <link href="${root}/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${root}/assets/css/bootstrap-icons.css" rel="stylesheet" />
    <link href="${root}/assets/css/board.css" rel="stylesheet" />
    <link href="${root}/assets/css/mac-style.css" rel="stylesheet" />
    <link href="${root}/assets/css/write.css" rel="stylesheet" />
    <link href="${root}/assets/css/templatemo-festava-live.css" rel="stylesheet" />
</head>
<style>
    .mytrip-item{
        height: 200px;
        box-sizing: border-box;
        padding: 10px;
        border-radius: 10px;
        outline: 1px solid lightgrey;
        outline-offset: -4px;
    }
</style>
<body>
<main>
    <%@ include file="/include/nav.jsp" %>
    <!-- 여기가 맥북 시작-->
    <div class="board_background" style="min-width:300px" >
        <div class="board">
            <div class="window" >
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
                            <a class="zoombutton" href="${root}/mytrip?action=mvwrite"><span><strong>+</strong></span></a>
                            <!-- zoom button link -->
                        </div>
                    </div>
                    MyTrip List
                    <!-- window title -->
                </div>
                <!-- 여기서부터 내용 작성 부분-->
                <div class="content" style="padding-left:0px; padding-top: 0px; padding-right: 0px;">
                    <c:if test="${not empty mytrips}">
                    <div class="row w-100" style="margin:0px">
                        <c:forEach var="mytrip" items="${mytrips}">
                        <div class="mytrip-item col-lg-6 col-md-6 col-sm-12">
                            <div class="row" style="height: 100%; width: 100%; padding:10px 0px">
                                <div style="width: 150px; height:150px">
                                    <img src="${root}/assets/images/noimg.png" alt=""
                                         style="height:100%; width:100%; border-radius:10px">
                                </div>
                                <div class="col">
                                    <a href="#" class="link-mytrip" data-no="${mytrip.myTripId}">
                                        <strong class="title">${mytrip.city} 여행</strong>
                                    </a>
                                    <div >${mytrip.startDate} ~  ${mytrip.endDate}</div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
                </c:if>
                <c:if test="${empty mytrips}">
                    <div style="height:300px; font-weight:200; text-align:center; line-height:300px">게시글이 존재하지 않습니다.</div>
                </c:if>
                <!-- window content -->
            </div>
        </div>
    </div>
    <!-- ©2015 Johannes JakobMade with <3 in Germany -->
    </div>
</main>
<%@ include file="/include/footer.jsp" %>
<script>
    let titles = document.querySelectorAll(".link-mytrip");
    titles.forEach(function (title) {
        title.addEventListener("click", function () {
            console.log(this.getAttribute("data-no"));
            location.href = "${root}/mytrip?action=view&mytrip_id=" + this.getAttribute("data-no");
        });
    });
</script>
</body>

</html>