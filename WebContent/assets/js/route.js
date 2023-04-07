// 검색 버튼을 누르면
// 지역, 유형, 검색어 얻기
// 위 데이터를 가지고 공공데이터에 요청
// 받은 데이터를 이용하여 화면 구성

var departureX;
var departureY;
var arrivalX;
var arrivalY;
var markers = [];
var linePath = [];
var bounds = new kakao.maps.LatLngBounds();
document.getElementById("btn-search-departures").addEventListener("click", function () {
  //index page 로딩 후 전국의 시도 설정
  let serviceKey = "4d808b2eea3ad1fde7f7c7e442ca91fc";
  let searchUrl =
      "https://dapi.kakao.com/v2/local/search/keyword.json?page=1&size=5&sort=accuracy&query=";
  let keyword = document.getElementById("search-departures").value;
  if (!keyword) {
    alert("검색어 입력 필수!!");
    return;
  } else {
    searchUrl += `${keyword}`;
    console.log(searchUrl);
  }

  fetch(searchUrl, {
    method: "GET",
    headers: {
      Authorization: "KakaoAK " + serviceKey,
    },
  })
      .then((response) => response.json())
      .then((data) => makeList(data, "departures-list", "search-departures"));
});

document.getElementById("btn-search-arrivals").addEventListener("click", function () {
  //index page 로딩 후 전국의 시도 설정
  let serviceKey = "4d808b2eea3ad1fde7f7c7e442ca91fc";
  let searchUrl =
      "https://dapi.kakao.com/v2/local/search/keyword.json?page=1&size=5&sort=accuracy&query=";
  let keyword = document.getElementById("search-arrivals").value;
  if (!keyword) {
    alert("검색어 입력 필수!!");
    return;
  } else {
    searchUrl += `${keyword}`;
  }

  fetch(searchUrl, {
    method: "GET",
    headers: {
      Authorization: "KakaoAK " + serviceKey,
    },
  })
      .then((response) => response.json())
      .then((data) => makeList(data, "arrivals-list", "search-arrivals"));
});

function makeList(data, idname, inputname) {
  console.log(data);
  let trips = data.documents;
  console.log(trips);
  let tripList = ``;
  document.getElementById(idname).innerHTML = ``;
  trips.forEach((area) => {
    let li = document.createElement("li");
    let button = document.createElement("button");
    button.setAttribute("type", "button");
    button.setAttribute("class", "btn-select");
    // button.setAttribute(
    //   "style",
    //   "width:100%; font-weight:bold; color:white; background-color:transparent"
    // );
    button.appendChild(document.createTextNode(area.place_name));
    li.append(button);
    document.getElementById(idname).appendChild(li);
    button.addEventListener("click", function () {
      if (idname == "departures-list") {
        departureX = area.x;
        departureY = area.y;
      } else {
        arrivalX = area.x;
        arrivalY = area.y;
      }
      document.getElementById(inputname).value = area.place_name;
      document.getElementById(idname).innerHTML = ``;
    });
  });
}

document.getElementById("btn-search-route").addEventListener("click", function () {
  console.log("departure : " + departureX + " , " + departureY);
  console.log("arrival : " + arrivalX + " , " + arrivalY);

  const options = {
    method: "POST",
    headers: {
      accept: "application/json",
      "content-type": "application/json",
      appKey: "C8v8OqOyyW5b9aCzvpYGu6T9Fdi4oU9Z2ErTwEJF",
    },
    body: JSON.stringify({
      startX: departureX,
      startY: departureY,
      endX: arrivalX,
      endY: arrivalY,
      lang: 0,
      format: "json",
      count: 10,
    }),
  };

  fetch("https://apis.openapi.sk.com/transit/routes", options)
      .then((response) => response.json())
      .then((data) => makeRouteList(data))
      .then(map.relayout())
      .catch((err) => console.error(err));
});

function addMarker(position) {
  var marker = new kakao.maps.Marker({
    position: position
  });
  markers.push(marker);
}

function makeRouteList(data) {
  console.log(data);
  console.log(data.metaData.plan);
  let trips = data.metaData.plan.itineraries;
  // fa-bus-simple
  for (trip of trips) {
    let route = `
    <div class="tab-content w-100 mb-3" style="background-color:rgb(255, 255, 255); border:1px solid lightgray">
      <div class="w-100 d-flex align-items-center mb-3">`;
    let desc = ``;
    let totalTime = trip.totalTime;
    let totalFare = trip.fare.regular.totalFare;
    let legs = trip.legs;
    for (leg of legs) {
      if (leg.mode == "WALK") {
        route += `<span class="fa-stack fa-1x">
        <i class="fa-solid fa-circle fa-stack-2x"></i>
        <i class="fa-solid fa-person-walking fa-stack-1x fa-inverse"></i>
      </span>`;
        route += `<hr style="width:${
            (leg.sectionTime * 100) / totalTime
        }%; border:5px solid black;"></hr>`;
      } else if (leg.mode == "TRANSFER") {
        route += `<hr style="width:${Math.ceil(
            (leg.sectionTime * 100) / totalTime
        )}%; border:5px solid gray;"></hr>`;
      } else if (leg.mode == "BUS") {
        route += `<span class="fa-stack fa-1x" style="color:#${leg.routeColor}">
        <i class="fa-solid fa-circle fa-stack-2x"></i>
        <i class="fa-solid fa-bus-simple fa-stack-1x fa-inverse"></i>
      </span>`;
        route += `<hr style="width:${Math.ceil(
            (leg.sectionTime * 100) / totalTime
        )}%; border:5px solid #${leg.routeColor};"></hr>`;
      } else if (leg.mode == "SUBWAY") {
        route += `<span class="fa-stack fa-1x" style="color:#${leg.routeColor}">
        <i class="fa-solid fa-circle fa-stack-2x"></i>
        <i class="fa-solid fa-bus-simple fa-stack-1x fa-inverse"></i>
      </span>`;
        route += `<hr style="width:${Math.ceil(
            (leg.sectionTime * 100) / totalTime
        )}%; border:5px solid #${leg.routeColor};"></hr>`;
      }
    }
    route += `</div>`;
    route += `<div class="mt-1">${Math.ceil(totalTime / 60)}분<div><div>${totalFare}원 환승 | ${
        trip.transferCount
    }번 | 도보 ${Math.ceil(trip.totalWalkTime / 60)}분</div>`;
    route += `</div>`;
    document.getElementById("route-result").innerHTML += route;
    document.getElementById("route-result").style.display = "block";

    addMarker(new kakao.maps.LatLng(departureY, departureX));
    linePath.push(new kakao.maps.LatLng(departureY, departureX));
    bounds.extend(new kakao.maps.LatLng(departureY, departureX));
    addMarker(new kakao.maps.LatLng(arrivalY, arrivalX));
    linePath.push(new kakao.maps.LatLng(arrivalY, arrivalX));
    bounds.extend(new kakao.maps.LatLng(arrivalY, arrivalX));
    var mapContainer = document.getElementById("map"), // 지도를 표시할 div
        mapOption = {
          center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
          level: 3, // 지도의 확대 레벨
        };
    var map = new kakao.maps.Map(mapContainer, mapOption);
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
  }
}

