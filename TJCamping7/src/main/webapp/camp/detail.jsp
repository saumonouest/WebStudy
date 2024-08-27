<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
        <title></title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        
        
        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600&family=Roboto&display=swap" rel="stylesheet">
         

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        
        
        
        
        
<style type="text/css">
.bg-breadcrumb {
    background-image: url('camp_detail.png');
}
.no, .wifi{
	position: absolute;
}
.no, .store{
	position: absolute;
}
.no, .animal{
	position: absolute;
}
.wifi{
	position: absolute;
}
.store{
	position: absolute;
}
.animal{
	position: absolute;
}
.grid-container {
    display: grid;
    grid-template-columns: repeat(4, 300px); /* 4개의 컬럼 */
    gap: 10px; /* 이미지 사이의 간격 */
    justify-content: center; /* 그리드를 가운데 정렬 */
    padding: 20px; /* 그리드와 컨테이너 사이에 패딩 추가 */
}
.destination-img {
    position: relative; /* 부모 요소의 상대적 위치 설정 */
}
.search-icon {
    position: absolute; /* 부모 요소를 기준으로 위치 설정 */
    top: 10px; /* 상단에서 10px 떨어지게 설정 */
    right: 10px; /* 오른쪽에서 10px 떨어지게 설정 */
    border-radius: 50%; /* 원형으로 설정 */
    padding: 10px; /* 내부 여백 설정 */
    z-index: 10; /* 다른 요소들보다 위에 표시 */
    opacity: 0;
}
.destination-img:hover .search-icon {
    opacity: 1; /* 마우스 오버 시 아이콘 표시 */
}

  .flexslider .slides li {
    display: inline-flex;
  }
  .flexslider {
    justify-content: center;
  }
</style>        

</head>
<body>

<!-- Header Start -->
        <div class="container-fluid bg-breadcrumb">
            <div class="container text-center py-5">
                <h3 class="display-3 mb-4"
                style="display:inline-block;color:white;background-color:rgb(37,105,73,0.5);">${vo.camp_name }</h3>
                <ol class="breadcrumb justify-content-center mb-0">
                </ol>    
            </div>
        </div>
        <!-- Header End -->




<!-- main_jsp Start -->
<!-- About Start -->
        <div class="container-fluid about py-5">
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <div class="col-lg-8">
                        <div class="h-100"
                        style="border: 50px solid; border-color: transparent rgb(37,105,73) transparent rgb(37,105,73);">
                            <img src="${vo.image1 }" class="img-fluid" style="width: 750px; height: 500px;">
                        </div>
                    </div>
                    <div class="col-lg-4"
             style="background: linear-gradient(rgba(255, 255, 255, .8), rgba(255, 255, 255, .8)), url(img/about-img-1.png);">
                        <h5 class="section-about-title pe-3" style="color:rgb(37,105,73)">About Campsite</h5>
                        <h1 class="mb-4">Welcome to</h1>
                        <h1 class="mb-4">
                        	<span style="color:rgb(37,105,73);font-family:'휴먼모음T'">${vo.camp_name }</span>
                        </h1>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->

<div class="container">
	<div class="row">
		<table class="table" style="border: rgba(0, 0, 0, 0.0)">
			<tr>
				<th width="50%" style="font-size:33px;color:black">
				전화번호&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;${vo.camp_phone }</th>
				<th width="50%" style="font-size:33px;color:black">
				가격&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;${vo.camp_price }&nbsp;원</th>
			</tr>
		</table>
		<div style="height:30px"></div>
		<table class="table" style="border: rgba(0, 0, 0, 0.0)">
			<tr>
				<th style="font-size:33px;color:black">
				주소&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;${vo.camp_addr }</th>
			</tr>
		</table>
		<div style="height:30px"></div>
		<table class="table" style="border: rgba(0, 0, 0, 0.0)">
	    	<tr>
	    		<td style="font-size:23px">${vo.camp_content }</td>
	    	</tr>
	    </table>
	    <div style="height:30px"></div>
	    <table class="table">
	    	<div class="col-lg-4 text-center">
			    <c:if test="${vo.camp_wifi=='n' }">
			    	<p class="f_ico">
				    	<img src="no.svg" width="120" class="no"/>
				    	<img src="wifi.svg" width="120" class="wifi"/>
			    	</p>
				</c:if>
			    <c:if test="${vo.camp_wifi=='y' }">
			    	<p class="f_ico">
			    		<img src="wifi.svg" width="120" class="wifi"/>
			    	</p>
				</c:if>
			</div>
	    	<div class="col-lg-4 text-center">
			    <c:if test="${vo.camp_store=='n' }">
			    	<p class="f_ico">
				    	<img src="no.svg" width="120" class="no"/>
				    	<img src="store.svg" width="120" class="store"/>
			    	</p>
				</c:if>
			    <c:if test="${vo.camp_store=='y' }">
			    	<p class="f_ico">
			    		<img src="store.svg" width="120" class="store"/>
			    	</p>
				</c:if>
			</div>
	    	<div class="col-lg-4 text-center">
			    <c:if test="${vo.camp_animal=='n' }">
			    	<p class="f_ico">
				    	<img src="no.svg" width="120" class="no"/>
				    	<img src="animal.svg" width="120" class="animal"/>
			    	</p>
				</c:if>
			    <c:if test="${vo.camp_animal=='y' }">
			    	<p class="f_ico">
			    		<img src="animal.svg" width="120" class="animal"/>
			    	</p>
				</c:if>
			</div>
		</table>
		<div style="height:120px"></div>
		<table class="table">
			<div class="col-lg-4 text-center" style="font-size:20px">
			와이파이
			</div>
			<div class="col-lg-4 text-center" style="font-size:20px">
			매점
			</div>
			<div class="col-lg-4 text-center" style="font-size:20px">
			반려동물
			</div>
		</table>
	    	
		    
		
	</div>
</div>
<div style="height:70px"></div>

<h2 class="text-center">* 갤러리 *</h2>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-4">
            <div class="grid-container">
                <div class="destination-img">
                    <img class="rounded w-100" style="width:200px;height:270px; object-fit:cover" src="${vo.image1 }">
                	<div class="search-icon">
						<a href="${vo.image1 }"
						data-lightbox="destination-1">
						<i class="fa fa-plus-square fa-1x btn btn-light btn-lg-square text-primary"></i></a>
					</div>
                </div>
                <div class="destination-img">
                    <img class="rounded w-100" style="width:200px;height:270px; object-fit:cover" src="${vo.image2 }">
                	<div class="search-icon">
						<a href="${vo.image2 }"
						data-lightbox="destination-1">
						<i class="fa fa-plus-square fa-1x btn btn-light btn-lg-square text-primary"></i></a>
					</div>
                </div>
                <div class="destination-img">
                    <img class="rounded w-100" style="width:200px;height:270px; object-fit:cover" src="${vo.image3 }">
                	<div class="search-icon">
						<a href="${vo.image3 }"
						data-lightbox="destination-1">
						<i class="fa fa-plus-square fa-1x btn btn-light btn-lg-square text-primary"></i></a>
					</div>
                </div>
                <div class="destination-img">
                    <img class="rounded w-100" style="width:200px;height:270px; object-fit:cover" src="${vo.image4 }">
                	<div class="search-icon">
						<a href="${vo.image4 }"
						data-lightbox="destination-1">
						<i class="fa fa-plus-square fa-1x btn btn-light btn-lg-square text-primary"></i></a>
					</div>
                </div>
                <div class="destination-img">
                    <img class="rounded w-100" style="width:200px;height:270px; object-fit:cover" src="${vo.image5 }">
                	<div class="search-icon">
						<a href="${vo.image5 }"
						data-lightbox="destination-1">
						<i class="fa fa-plus-square fa-1x btn btn-light btn-lg-square text-primary"></i></a>
					</div>
                </div>
                <div class="destination-img">
                    <img class="rounded w-100" style="width:200px;height:270px; object-fit:cover" src="${vo.image6 }">
                	<div class="search-icon">
						<a href="${vo.image6 }"
						data-lightbox="destination-1">
						<i class="fa fa-plus-square fa-1x btn btn-light btn-lg-square text-primary"></i></a>
					</div>
                </div>
                <div class="destination-img">
                    <img class="rounded w-100" style="width:200px;height:270px; object-fit:cover" src="${vo.image7 }">
                	<div class="search-icon">
						<a href="${vo.image7 }"
						data-lightbox="destination-1">
						<i class="fa fa-plus-square fa-1x btn btn-light btn-lg-square text-primary"></i></a>
					</div>
                </div>
                <div class="destination-img">
                    <img class="rounded w-100" style="width:200px;height:270px; object-fit:cover" src="${vo.image8 }">
                	<div class="search-icon">
						<a href="${vo.image8 }"
						data-lightbox="destination-1">
						<i class="fa fa-plus-square fa-1x btn btn-light btn-lg-square text-primary"></i></a>
					</div>
                </div>
                
                
            </div>
        </div>
    </div>








<div style="height:50px"></div>                 
                    
                    
<!-- 지도 -->
<h2 class="text-center">* 오시는 길 *</h2>
<div style="height:30px"></div>  
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6051fd0240c1e74e12904150ec495217&libraries=services"></script>
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
geocoder.addressSearch('${vo.camp_addr}', function(result, status) {

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
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.camp_name}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>

<div style="height:100px"></div>

<div class="container-fluid packages py-5">
    <div class="container py-5">
        <div class="mx-auto text-center mb-5" style="max-width: 900px;">
            <h5 class="section-title px-3">Campsite Map</h5>
            <h1 class="mb-0">캠핑장</h1>
        </div>
        <div class="packages-carousel owl-carousel">
            <c:forEach var="nvo" items="${nList}" varStatus="s">
                <div class="packages-item">
                    <div class="packages-img">
                        <img src="${nvo.image1}" class="img-fluid w-100 rounded-top" alt="Image">
                        <div class="text-center packages-price py-2 px-4">Best</div>
                    </div>
                    <div class="packages-content bg-light">
                        <div class="p-4 pb-0">
                            <h5 class="mb-0 truncate-text">${nvo.camp_name}</h5>
                            <p class="mb-4"></p>
                        </div>
                        <div class="row bg-primary rounded-bottom mx-0">
                            <div class="col-6 text-start px-0">
                                <a href="#" class="btn-hover btn text-white py-2 px-4"></a>
                            </div>
                            <div class="col-6 text-end px-0">
                                <a href="#" class="btn-hover btn text-white py-2 px-4">${nvo.camp_price}원</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<div class="flexslider carousel basiccarousel btmspace-80">
	      <ul class="slides">
	       <c:forEach var="vo" items="${nList }">
		        <li>
		          <figure><img class="radius-10 btmspace-10"
		            src="${vo.image1 }" style="width: 320px;height: 185px"
		            title="${vo.camp_addr }">
		            <figcaption><a href="../camp/detail.do?camp_no=${vo.camp_no }">${vo.camp_name }</a></figcaption>
		          </figure>
		        </li>
	        </c:forEach>
	      </ul>
	    </div>
	    <div>
	    <tr>
	    			<td colspan="3" class="text-right">
	    				<c:if test="${sessionScope.id!=null }">
		    				<a href="../camp/reserve.do?camp_no=${vo.camp_no }" class="btn btn-xs btn-info">예약</a>
		    			</c:if>
		    			<input type="button" class="btn btn-xs btn-danger" value="목록" onclick="javascript:history.back()">
	    			</td>
	    		</tr>
	    </div>

</div>


<div style="height:60px"></div>

<!-- main_jsp End -->






<a href="#" class="btn btn-primary btn-primary-outline-0 btn-md-square back-to-top"><i class="fa fa-arrow-up"></i></a>   

        
        <!-- JavaScript Libraries -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/lightbox/js/lightbox.min.js"></script>
        

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
</body>
</html>