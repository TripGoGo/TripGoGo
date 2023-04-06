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
        /* radio */
        .five { width: 18.72%; max-width: 18.72%;}
        .radios input{
            display: none;
        }
        .col {
            display: block;
            float:left;
            margin: 1% 0 1% 1.6%;
        }
        .col:first-of-type { margin-left: 0; }
        label{
            position: relative;
            color: black;
            border: 1px solid lightgray;
            border-radius: 5px;
            font-size: 18px;
            text-align: center;
            height: 50px;
            line-height: 50px;
            display: block;
            cursor: pointer;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
        .radios input:checked + label{
            border: 1px solid lightgray;
            background-color: lightblue;
        }
        input[type="date"]{
            box-sizing: border-box;
            padding: 15px;
            height: 50px;
            color: black;
            font-size: 18px;
            border: none;
            outline: none;
            border-radius: 5px;
            border:1px solid lightgray;
            width:100%;
        }
        ::-webkit-calendar-picker-indicator{
            background-color: #ffffff;
            padding: 5px;
            cursor: pointer;
            border-radius: 3px;
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
                        <form id="mytrip-form" method="post">
                            <input type="hidden" name="action" value="write">
                            <div class="row justify-content-center">
                                <!-- 관광지 검색 start -->
                                <!-- 시/도 검색-->
                                <div class="area" >
                                    <div style="display: inline;">여행 도시</div>
                                    <select name="city" id="search-area1" class="form-select" aria-label="Default select example"
                                            style="font-size: 18px;">
                                        <option value="0" selected> 시/도</option>
                                    </select>
                                </div>
                            </div>

                            <!-- 여행 날짜 선택-->
                            <div class="row justify-content-center" style="margin-top:3vh">
                                <div class="col-6">
                                    <div>
                                        <div style="display: inline;">여행 시작</div>
                                        <div><input type="date" id="start_date" name="start_date"></div>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div>
                                        <div style="display: inline;">여행 종료</div>
                                        <div><input type="date" id="end_date" name="end_date"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- 여행 동행인 선택-->
                            <div class="row justify-content-center" style="margin-top:3vh">
                                <div class="">
                                    <div style="display: inline;">동반인</div>
                                    <div class="radios w-100">
                                        <input type="radio" name="companion" id="alone" value="0"/>
                                        <label class="five col" for="alone">혼자</label>
                                        <input type="radio" name="companion" id="friend" value="1" checked="checked"/>
                                        <label class="five col" for="friend">친구와</label>
                                        <input type="radio" name="companion" id="family" value="2"/>
                                        <label class="five col" for="family">가족과</label>
                                        <input type="radio" name="companion" id="couple" value="3"/>
                                        <label  class="five col" for="couple">연인과</label>
                                        <input type="radio" name="companion" id="etc" value="4"/>
                                        <label class="five col" for="etc">기타</label>
                                    </div>
                                </div>
                            </div>
                            <!-- 여행 스타일 선택-->
                            <div class="row justify-content-center" style="margin-top:3vh">
                                <div>
                                    <div style="display: inline;">여행 스타일</div>
                                    <div class="radios w-100">
                                        <input type="radio" name="trip_style" id="trip_style0" value="0" checked>
                                        <label class="five col" for="trip_style0">휴양</label>
                                        <input type="radio" name="trip_style" id="trip_style1" value="1">
                                        <label class="five col" for="trip_style1">관광</label>
                                        <input type="radio" name="trip_style" id="trip_style2" value="2">
                                        <label class="five col" for="trip_style2">뚜벅이</label>
                                        <input type="radio" name="trip_style" id="trip_style3" value="3">
                                        <label class="five col" for="trip_style3">쇼핑</label>
                                        <input type="radio" name="trip_style"  id="trip_style4"value="4">
                                        <label class="five col" for="trip_style4">패키지</label>
                                    </div>
                                </div>
                            </div>
                            <!-- 제출 버튼임-->
                            <div>
                                <button type="submit" id="btn-submit" class="form-control" style="margin: 2vh 0">완료</button>
                            </div>
                        </form>
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
            opt.setAttribute("value", area.name);
            opt.appendChild(document.createTextNode(area.name));
            sel.appendChild(opt);
        });
    }

    document.querySelector("#btn-submit").addEventListener("click", function () {
        var startDate = document.getElementById("start_date").value;
        var endDate = document.getElementById("end_date").value;
        var startArray = startDate.split("-");
        var endArray = endDate.split("-");
        var start_date = new Date(startArray[0], startArray[1], startArray[2]);
        var end_date = new Date(endArray[0], endArray[1], endArray[2]);
        if (document.getElementById("search-area1").value == '0'){
            alert("여행할 도시를 선택해주세요.")
        } else if (document.getElementById("start_date").value == ""){
            alert("시작일을 선택해주세요.")
        } else if (document.getElementById("end_date").value == ""){
            alert("종료일을 선택해주세요.")
        } else if (start_date.getTime() > end_date.getTime()){
            alert("여행 종료일이 시작일보다 앞설 수 없습니다.")
        } else {
            let form = document.querySelector("#mytrip-form");
            form.setAttribute("action", "${root}/mytrip");
            form.submit();
        }
    });
</script>
</body>

</html>