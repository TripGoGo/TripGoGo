<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <script src="https://kit.fontawesome.com/d4a4244bd2.js"
            crossorigin="anonymous"></script>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c320326b2ad2dd588de2423a35a93637"></script>
    <title>Festava Live - Ticket HTML Form</title>

    <!-- CSS FILES -->
    <link rel="preconnect" href="https://fonts.googleapis.com"/>

    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>

    <link
            href="https://fonts.googleapis.com/css2?family=Outfit:wght@100;200;400;700&display=swap"
            rel="stylesheet"/>

    <link href="${root}/assets/css/bootstrap.min.css" rel="stylesheet"/>

    <link href="${root}/assets/css/bootstrap-icons.css" rel="stylesheet"/>
    <link href="${root}/assets/css/board.css" rel="stylesheet"/>
    <link href="${root}/assets/css/mac-style.css" rel="stylesheet"/>
    <link href="${root}/assets/css/write.css" rel="stylesheet"/>
    <link href="${root}/assets/css/mytrip-select.css" rel="stylesheet"/>

    <link href="${root}/assets/css/templatemo-festava-live.css"
          rel="stylesheet"/>
    <!--

    TemplateMo 583 Festava Live

    https://templatemo.com/tm-583-festava-live

    -->
</head>
<body>
<main>
    <%@ include file="/include/nav.jsp" %>
    <div class="board_background">
        <div class="board">
            <div class="window">
                <div class="titlebar">
                    <div class="buttons">
                        <div class="close">
                            <a class="closebutton" href="board.html"><span><strong>x</strong></span></a>
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
                    글 쓰기
                    <!-- window title -->
                </div>
                <div class="content">
                    <div class="write">
                        <div class="write-container wrap">
                            <div class="contact-form-body">
                                <form method="post" id="form-write">
                                    <input type="text" name="place_name" id="place_name"
                                           class="form-control" placeholder="관광지/맛집/숙소 검색"
                                           style="font-weight: 300; margin-bottom:10px" onkeypress="searchSpot(event)"
                                           required/>
                                    <input hidden="hidden" name="action" value="add"/>
                                    <input hidden="hidden" name="category" id="category"/>
                                    <input hidden="hidden" name="x" id="x"/>
                                    <input hidden="hidden" name="y" id="y"/>
                                    <input hidden="hidden" name="mytrip_id" id="mytrip_id" value=${param.mytrip_id}>
                                    <input hidden="hidden" name="date" id="date" value=${param.date}>
                                </form>
                                <div id="trip-select-list"></div>
                                <div id="map" style="width: 100%; height: 350px"></div>
                                <button type="submit" id="btn-submit" class="form-control mt-3">추가</button>
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
</body>
<script>
    document.querySelector("#btn-submit").addEventListener("click", function () {
        if (!document.querySelector("#place_name").value) {
            alert("장소를 선택하세요!");
            return;
        } else {
            let form = document.querySelector("#form-write");
            form.setAttribute("action", "${root}/mytrip");
            // console.log(document.querySelector("#place_name").value);
            // console.log(document.querySelector("#category").value);
            // console.log(document.querySelector("#x").value);
            // console.log(document.querySelector("#y").value);
            console.log(document.querySelector("#mytrip_id").value);
            form.submit();
        }
    });
</script>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=24073e84e8ac256ed85efd18c525e7a9"></script>
<script src="${root}/assets/js/mytrip-select.js"></script>

</html>
