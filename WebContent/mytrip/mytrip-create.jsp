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
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c320326b2ad2dd588de2423a35a93637"></script>
    <title>TripGoGo-MyTrip</title>

    <!-- CSS FILES -->
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100;200;400;700&display=swap" rel="stylesheet"/>
    <link href="${root}/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${root}/assets/css/bootstrap-icons.css" rel="stylesheet"/>
    <link href="${root}/assets/css/board.css" rel="stylesheet"/>
    <link href="${root}/assets/css/mac-style.css" rel="stylesheet"/>
    <link href="${root}/assets/css/write.css" rel="stylesheet"/>
    <link href="${root}/assets/css/templatemo-festava-live.css" rel="stylesheet"/>
    <style>
        .area {
            display: flex;
            justify-content: center;
            /* border: 1px solid black; */
            background-color: rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }
    </style>
</head>
<body>
<main>
    <%@ include file="/include/nav.jsp" %>
    <!-- 여기가 맥북 시작-->
    <div class="board_background">
        <div class="board">
            <div class="window">
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
                    Create your Trip
                    <!-- window title -->
                </div>
                <!-- 여기서부터 내용 작성 부분-->
                <div class="content">
                    <div class="container" style="margin-top:6vh">
                        <form method="post">
                            <div class="row justify-content-center">
                                <!-- 관광지 검색 start -->
                                <!-- 시/도 검색-->
                                <div class="area col-6">
                                    <select id="search-area1" class="form-select" aria-label="Default select example"
                                            style="background-color: rgba(255, 255, 255, 0);text-align: center;border: rgba(0, 0, 0, 0);font-size: 20px;">
                                        <option value="0" selected> 시/도</option>
                                    </select>
                                </div>
                            </div>
                            <!-- 여행 날짜 선택-->
                            <div class="row justify-content-center" style="margin-top:3vh">
                                <div class="col-3">
                                    <div style="text-align: center;">
                                        <div style="display: inline;">Start Day</div>
                                        <div><input type="date"></div>
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div style="text-align: center;">
                                        <div style="display: inline;">End Day</div>
                                        <div><input type="date"></div>
                                    </div>
                                </div>
                                <!-- 여행 동행인 선택-->
                                <div class="row justify-content-center" style="margin-top:3vh">
                                    <div class="col-3">Who?</div>
                                    <div class="col-5">
                                        <label style="margin-right:10px"><input type="radio" name="people"
                                                                                value="0">혼자</label>
                                        <label style="margin-right:10px"><input type="radio" name="people"
                                                                                value="1">친구와</label>
                                        <label style="margin-right:10px"><input type="radio" name="people"
                                                                                value="2">가족과</label>
                                        <label style="margin-right:10px"><input type="radio" name="people"
                                                                                value="3">연인과</label>
                                        <label style="margin-right:10px"><input type="radio" name="people"
                                                                                value="4">기타</label>
                                    </div>
                                </div>
                                <!-- 여행 스타일 선택-->
                                <div class="row justify-content-center" style="margin-top:3vh">
                                    <div class="col-3">Who?</div>
                                    <div class="col-5">
                                        <label style="margin-right:10px"><input type="radio" name="travel-type"
                                                                                value="0">휴양</label>
                                        <label style="margin-right:10px"><input type="radio" name="travel-type"
                                                                                value="1">관광</label>
                                        <label style="margin-right:10px"><input type="radio" name="travel-type"
                                                                                value="2">뚜벅이</label>
                                        <label style="margin-right:10px"><input type="radio" name="travel-type"
                                                                                value="3">쇼핑</label>
                                        <label style="margin-right:10px"><input type="radio" name="travel-type"
                                                                                value="4">패키지</label>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <!-- 제출 버튼임-->
                        <div>
                            <button type="submit" id="btn-submit" class="form-control" style="margin: 3vh 3vw;">완료
                            </button>
                        </div>
                    </div>
                </div>
                <!-- 관광지 검색 end -->
                <!-- window content -->
            </div>
        </div>
    </div>
    <!-- ©2015 Johannes JakobMade with <3 in Germany -->
    </div>
</main>
<%@ include file="/include/footer.jsp" %>
<script>
    // 공공데이터에서 지역구 가져오기
    var serviceKey = "z3vgw8Qjex43dubAYmTKS%2BYTCarK5JjMqfW6Da3cYCNTdA2FqJThjd15mnJY6lqmPFSCIehjR2Jex%2F71IGfBvw%3D%3D";
    let areaUrl = "https://apis.data.go.kr/B551011/KorService1/areaCode1?serviceKey=" +
        serviceKey + "&numOfRows=20&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json";
    fetch(areaUrl, {method: "GET"})
        .then((response) => response.json())
        .then((data) => makeOption(data));

    function makeOption(data) {
        let areas = data.response.body.items.item;
        console.log(data);
        let sel = document.getElementById("search-area1");
        areas.forEach((area) => {
            let opt = document.createElement("option");
            opt.setAttribute("value", area.code);
            opt.appendChild(document.createTextNode(area.name));
            sel.appendChild(opt);
        });
    }

    document.querySelector("#btn-submit").addEventListener("click", function () {
        if (!document.querySelector("#search-area1").value) {
            alert("시도 입력!!");
            return;
        } else if (!document.querySelector("#content").value) {
            alert("내용 입력!!");
            return;
        } else {
            let form = document.querySelector("#form-write");
            form.setAttribute("action", "${root}/board");
            form.submit();
        }
    });
</script>
</body>

</html>