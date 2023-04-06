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
    <script src="https://kit.fontawesome.com/d4a4244bd2.js" crossorigin="anonymous"></script>
    <title>Festava Live - Ticket HTML Form</title>
    <!-- CSS FILES -->
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link
            href="https://fonts.googleapis.com/css2?family=Outfit:wght@100;200;400;700&display=swap"
            rel="stylesheet"
    />
    <link href="${root}/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${root}/assets/css/bootstrap-icons.css" rel="stylesheet"/>
    <link href="${root}/assets/css/board.css" rel="stylesheet"/>
    <link href="${root}/assets/css/mac-style.css" rel="stylesheet"/>
    <link href="${root}/assets/css/write.css" rel="stylesheet"/>
    <link href="${root}/assets/css/mytrip-view.css" rel="stylesheet"/>
    <link href="${root}/assets/css/templatemo-festava-live.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css"/>
    <script
            type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=24073e84e8ac256ed85efd18c525e7a9"
    ></script>
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
                            <a class="closebutton" href="#"
                            ><span><strong>x</strong></span></a
                            >
                        </div>
                        <div class="minimize">
                            <a class="minimizebutton" href="#"
                            ><span><strong>&ndash;</strong></span></a
                            >
                        </div>
                        <div class="zoom">
                            <a class="zoombutton" href="#"
                            ><span><strong>+</strong></span></a
                            >
                        </div>
                    </div>
                    장소 삭제
                </div>
                <div class="content">
                    <div class="view-container">
                        <div class="view-item">
                            <a href="/9" class="link-article">
                                <strong class="title">Day ${index}</strong>
                            </a>
                            <div class="board-info">
                                <span class="date">${date}</span>
                            </div>
                            <hr width="100%"/>
                            <div class="view-content">
                                <div id="map" style="width: 100%; height: 350px; margin-bottom: 10px"></div>
                                <div id="trip-list">
                                    <script>
                                        var markers = [];
                                        var linePath = [];
                                        var bounds = new kakao.maps.LatLngBounds();
                                    </script>
                                    <c:forEach var="place" items="${places}">
                                        <script>
                                            function addMarker(position) {
                                                var marker = new kakao.maps.Marker({
                                                    position: position
                                                });
                                                markers.push(marker);
                                            }
                                            addMarker(new kakao.maps.LatLng(${place.y}, ${place.x}));
                                            linePath.push(new kakao.maps.LatLng(${place.y}, ${place.x}));
                                            bounds.extend(new kakao.maps.LatLng(${place.y}, ${place.x}));
                                        </script>
                                        <div class="trip-line d-flex">
                                            <input
                                                    type="checkbox"
                                                    class="checkbox-custom"
                                                    name="check-remove"
                                                    value="${place.placeId}"
                                            />
                                            <div class="trip-item">
                                                <div class="trip-content">
                                                    <span class="title">${place.placeName}</span>
                                                    <div class="trip-info">
                                                        <span class="writer">${place.category}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <script>
                                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                                            mapOption = {
                                                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                                                level: 3 // 지도의 확대 레벨
                                            };
                                        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
                                        console.log(markers);
                                        for (var i = 0; i < markers.length; i++) {
                                            markers[i].setMap(map);
                                        }
                                        var polyline = new kakao.maps.Polyline({
                                            path: linePath, // 선을 구성하는 좌표배열 입니다
                                            strokeWeight: 5, // 선의 두께 입니다
                                            strokeColor: '#000000', // 선의 색깔입니다
                                            strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                                            strokeStyle: 'dashed' // 선의 스타일입니다
                                        });
                                        polyline.setMap(map);
                                        map.setBounds(bounds);
                                    </script>
                                    <button type="submit" id="btn-submit" class="form-control">장소 삭제</button>
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
<%@ include file="/include/footer.jsp" %>
</body>
<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
</html>
