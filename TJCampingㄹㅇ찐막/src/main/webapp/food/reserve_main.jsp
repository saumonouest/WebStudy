<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation Information</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
    let fno = $('#fno1').val();
    
    if (!fno) {
        console.error('fno value is missing.');
        return;
    }
    
    $.ajax({
        type: 'post',
        url: '../food/date_info.do',
        data: { "fno": fno },
        success: function(result) {
            $('#frdate').html(result).show();
        },
        error: function(request, status, error) {
            console.log(error);
        }
    });
});

</script>
<style type="text/css">
.rday_can:hover {
    cursor: pointer;
}

.reserve {
    background-color: rgba(141, 186, 0, .6);
}

.reservedate {
    background-color: rgba(222, 236, 183, .6);
}

.can {
    background-color: red;
}

/* Flexbox 컨테이너 설정 */
.flex-container {
    display: flex;
    justify-content: space-between; /* 요소 간 공간을 균등하게 배분 */
}

.flex-item {
    width: 45%; /* 각 flex 아이템의 너비 설정 */
}


.info-box {
    border: 2px solid darkgreen; /* 테두리 색상 및 두께 */
    padding: 20px; /* 내부 여백 */
    margin-top: 0px; /* 상단 여백 */
    width: 550px; /* 상자의 너비 */
    background-color: #f9f9f9; /* 배경 색상 */
}

.info-box div {
    border-bottom: 1px solid #ccc; /* 각 섹션 하단의 선 */
    padding: 10px 0; /* 각 섹션의 상하 여백 */
    text-align: center; /* 텍스트 중앙 정렬 */
}

.info-box div:last-child {
    border-bottom: none; /* 마지막 섹션에는 하단의 선 제거 */
}

</style>
</head>
<body>
<!-- Header Start -->
<div class="container-fluid destination py-5">
  <div class="container py-5">
    <div class="row">
      <!-- 맛집 정보 -->
      <div class="col-md-6">
        <h4>${vo.name } 위치</h4> <!-- 맛집 정보 제목을 별도로 빼서 위로 이동 -->
        <table class="table">
          <tr>
            <td class="text-center dataTr" data-fno="${vo.fno }" colspan="2">
              <!-- 지도를 표시할 div -->
              <div id="map" style="width: 250px; height: 180px;"></div>
            </td>
          </tr>
          <tr>
            <td width="30%" class="text-right">주차</td>
            <td width="70%" id="name">${vo.parking }</td>
          </tr>
          <tr>
            <td width="30%" class="text-right">영업 시간</td>
            <td width="70%" id="name">${vo.time }</td>
          </tr>
          <tr>
            <td width="30%" class="text-right">전화번호</td>
            <td width="70%" id="phone">${vo.phone }</td>
          </tr>
          <tr>
            <td width="30%" class="text-right">예약일</td>
            <td width="70%" id="day"></td>
          </tr>
          <tr>
            <td width="30%" class="text-right">시간</td>
            <td width="70%" id="time_data"></td>
          </tr>
          <tr>
            <td width="30%" class="text-right">인원</td>
            <td width="70%" id="inwon_data"></td>
          </tr>
        </table>
      </div>

      <!-- 예약일 정보, 시간 정보, 인원 정보 -->
      <div class="info-box col-md-6">
        <table class="table">
          <caption><h4 class="text-center">예약 가능 날짜</h4></caption>
          <tbody>
            <tr>
              <td id="frdate"></td>
            </tr>
          </tbody>
        </table>
        <table class="table">
          <caption><h4 class="text-center">시간</h4></caption>
          <tr>
            <td class="text-center" id="fr_time"></td>
          </tr>
        </table>
        <table class="table">
          <caption><h4 class="text-center">인원</h4></caption>
          <tr>
            <td class="text-center" id="fr_inwon"></td>
          </tr>
        </table>
      </div>
    </div>
  </div>
</div>

<!-- Kakao Map Script -->
<script type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9965c727d3306713c47391be682e4be9&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${vo.address}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.name}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>

</body>
</html>
