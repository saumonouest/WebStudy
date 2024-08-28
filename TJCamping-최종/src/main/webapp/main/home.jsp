<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<!-- 롤링배너 Start -->
	<div class="carousel-header">
		<div id="carouselId" class="carousel slide" data-bs-ride="carousel">
			<ol class="carousel-indicators">
				<li data-bs-target="#carouselId" data-bs-slide-to="0" class="active"></li>
				<li data-bs-target="#carouselId" data-bs-slide-to="1"></li>
				<li data-bs-target="#carouselId" data-bs-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="carousel-item active">
					<img src="../img/carousel-2.jpg" class="img-fluid" alt="Image">
					<div class="carousel-caption">
						<div class="p-3" style="max-width: 900px;">

							<h4 class="text-white text-uppercase fw-bold mb-4"
								style="letter-spacing: 3px;">Explore The World</h4>
							<h1 class="display-2 text-capitalize text-white mb-4">Let's
								The World Together!</h1>
							<p class="mb-5 fs-5">Lorem Ipsum is simply dummy text of the
								printing and typesetting industry. Lorem Ipsum has been the
								industry's standard dummy text ever since the 1500s,</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img src="../img/carousel-1.jpg" class="img-fluid" alt="Image">
					<div class="carousel-caption">i
						<div class="p-3" style="max-width: 900px;">
							<h4 class="text-white text-uppercase fw-bold mb-4"
								style="letter-spacing: 3px;">Explore The World</h4>
							<h1 class="display-2 text-capitalize text-white mb-4">Find
								Your Perfect Tour At Travel</h1>
							<p class="mb-5 fs-5">Lorem Ipsum is simply dummy text of the
								printing and typesetting industry. Lorem Ipsum has been the
								industry's standard dummy text ever since the 1500s,</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img src="../img/carousel-3.jpg" class="img-fluid" alt="Image">
					<div class="carousel-caption">
						<div class="p-3" style="max-width: 900px;">
							<h4 class="text-white text-uppercase fw-bold mb-4"
								style="letter-spacing: 3px;">Explore The World</h4>
							<h1 class="display-2 text-capitalize text-white mb-4">You
								Like To Go?</h1>
							<p class="mb-5 fs-5">Lorem Ipsum is simply dummy text of the
								printing and typesetting industry. Lorem Ipsum has been the
								industry's standard dummy text ever since the 1500s,</p>
						</div>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselId" data-bs-slide="prev">
				<span class="carousel-control-prev-icon btn bg-primary"
					aria-hidden="false"></span> <span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselId" data-bs-slide="next">
				<span class="carousel-control-next-icon btn bg-primary"
					aria-hidden="false"></span> <span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	<!-- 롤링배너 End -->
	
	
	<!-- Navbar & Hero End -->	
	 <div class="container-fluid search-bar position-relative"
		style="top: -50%; transform: translateY(-50%);">
		<div class="container">
			<div class="position-relative rounded-pill w-100 mx-auto p-4" style="background: rgba(37, 103, 75,0.8);">
				<input
					class="form-control border-0 rounded-pill w-100 py-3 ps-4 pe-5"
					type="text" placeholder="캠핑장 이름을 검색하세요">
				<a href="../camp/list.do"
					class="btn-primary rounded-pill py-2 px-4 position-absolute me-2"
					style="top: 50%; right: 46px; transform: translateY(-50%);">Search</a>
			</div>
		</div>
	</div>
	<!-- Navbar & Hero End -->


	<!-- About Start -->
<div class="container-fluid about py-5">
    <div class="container py-5">
        <div class="row g-5 align-items-center">
            <div class="col-lg-5">
                <div class="h-100" style="border: 10px solid rgb(37, 103, 75);">
                    <img src="../img/about-img.jpg" class="img-fluid w-100 h-100" alt="">
                </div>
            </div>
            <div class="col-lg-7" style="background: linear-gradient(rgba(255, 255, 255, .8), rgba(255, 255, 255, .8)); transform: translateX(20px);">
                <h5 class="section-about-title"></h5>
                <h1 class="mb-4">
                    Welcome to <span class="text-primary">TJ Camping!</span>
                </h1>
                <p class="mb-4">
                    TJ캠핑은 캠핑에 관련된 모든 서비스를 제공하는 전문 캠핑 플랫폼입니다.<br>
                    캠핑장 서칭부터 예약, 용품 구매, 정보 및 팁 수집까지<br>
                    TJ 캠핑이 제공하는 원스탑 서비스를 통해 스마트한 캠핑 라이프를 즐겨보세요!
                </p>
                <!-- <p class="mb-4">TJ 캠핑만의 원스탑 서비스를 통해 스마트한 캠핑 라이프를 즐겨보세요!</p> -->
                <div class="row gy-2 gx-4 mb-4">
                    <div class="col-sm-5">
                        <p class="mb-0">
                            <i class="fa fa-arrow-right text-primary me-2"></i>캠핑장 소개
                        </p>
                    </div>
                    <div class="col-sm-5">
                        <p class="mb-0">
                            <i class="fa fa-arrow-right text-primary me-2"></i>캠핑장 예약
                        </p>
                    </div>
                    <div class="col-sm-5">
                        <p class="mb-0">
                            <i class="fa fa-arrow-right text-primary me-2"></i>캠핑용품 판매
                        </p>
                    </div>
                    <div class="col-sm-5">
                        <p class="mb-0">
                            <i class="fa fa-arrow-right text-primary me-2"></i>맛집 추천
                        </p>
                    </div>
                    <div class="col-sm-5">
                        <p class="mb-0">
                            <i class="fa fa-arrow-right text-primary me-2"></i>레시피 소개
                        </p>
                    </div>
                    <div class="col-sm-5">
                        <p class="mb-0">
                            <i class="fa fa-arrow-right text-primary me-2"></i>생생한 후기
                        </p>
                    </div>
                </div>
                <a class="btn btn-primary rounded-pill py-3 px-5 mt-2" href="">Read More</a>
            </div>
        </div>
    </div>
</div>
<!-- About End -->


	<!-- Explore Tour Start -->
	<div class="container-fluid ExploreTour py-5">
		<div class="container py-5">
			<div class="mx-auto text-center mb-5" style="max-width: 900px;">
				<h5 class="section-title px-3">quick menu</h5>
				<h1 class="mb-4">바로가기</h1>
				</div>
				<div class="tab-content">
					<div id="NationalTab-1" class="tab-pane fade show p-0 active">
						<div class="row g-4">
							<div class="col-md-6 col-lg-4">
								<div class="national-item">
									<img src="../img/explore-tour-1.jpg"
										class="img-fluid w-100 rounded" alt="Image">
									<div class="national-content">
										<div class="national-info">
											<h3 class="text-white text-uppercase mb-2">캠핑장 소개</h3>
											<a href="#" class="btn-hover text-white">바로가기 <i
												class="fa fa-arrow-right ms-2"></i></a>
										</div>
									</div>
									<div class="national-plus-icon">
										<a href="#" class="my-auto"><i
											class="fas fa-link fa-2x text-white"></i></a>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4">
								<div class="national-item">
									 <img src="../img/explore-tour-2.jpg"
										class="img-fluid w-100 rounded" alt="Image">
									<div class="national-content">
										<div class="national-info">
											<h3 class="text-white text-uppercase mb-2">캠핑장 예약 </h3>
											<a href="../camp/list.do" class="btn-hover text-white">바로가기 <i
												class="fa fa-arrow-right ms-2"></i></a>
										</div>
									</div>
									<div class="national-plus-icon">
										<a href="#" class="my-auto"><i
											class="fas fa-link fa-2x text-white"></i></a>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4">
								<div class="national-item">
									<img src="../img/explore-tour-3.jpg"
										class="img-fluid w-100 rounded" alt="Image">
									<div class="national-content">
										<div class="national-info">
											<h3 class="text-white text-uppercase mb-2">캠핑용품</h3>
											<a href="../campgoods/list.do" class="btn-hover text-white">바로가기 <i
												class="fa fa-arrow-right ms-2"></i></a>
										</div>
									</div>
									<div class="tour-offer bg-warning">추천</div>
									<div class="national-plus-icon">
										<a href="#" class="my-auto"><i
											class="fas fa-link fa-2x text-white"></i></a>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4">
								<div class="national-item">
									<img src="../img/explore-tour-4.jpg"
										class="img-fluid w-100 rounded" alt="Image">
									<div class="national-content">
										<div class="national-info">
											<h3 class="text-white text-uppercase mb-2">맛집</h3>
											<a href="../food/list.do" class="btn-hover text-white">바로가기 <i
												class="fa fa-arrow-right ms-2"></i></a>
										</div>
									</div>
									<div class="national-plus-icon">
										<a href="#" class="my-auto"><i
											class="fas fa-link fa-2x text-white"></i></a>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4">
								<div class="national-item">
									<img src="../img/explore-tour-5.jpg"
										class="img-fluid w-100 rounded" alt="Image">
									<div class="national-content">
										<div class="national-info">
											<h3 class="text-white text-uppercase mb-2">레시피</h3>
											<a href="../recipe/list.do" class="btn-hover text-white">바로가기 <i
												class="fa fa-arrow-right ms-2"></i></a>
										</div>
									</div>
									<div class="tour-offer bg-warning">추천</div>
									<div class="national-plus-icon">
										<a href="#" class="my-auto"><i
											class="fas fa-link fa-2x text-white"></i></a>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4">
								<div class="national-item">
									<img src="../img/explore-tour-6.jpg"
										class="img-fluid w-100 rounded" alt="Image">
									<div class="national-content">
										<div class="national-info">
											<h3 class="text-white text-uppercase mb-2">커뮤니티</h3>
											<a href="#" class="btn-hover text-white">바로가기 <i
												class="fa fa-arrow-right ms-2"></i></a>
										</div>
									</div>
									<div class="national-plus-icon">
										<a href="#" class="my-auto"><i
											class="fas fa-link fa-2x text-white"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					</div>
				</div>
			</div>
			
	<!-- Explore Tour End -->


	<!-- 캠핑장 추천 Start -->
	<div class="container-fluid packages py-5">
    <div class="container py-5">
        <div class="mx-auto text-center mb-5" style="max-width: 900px;">
            <h5 class="section-title px-3">Campsite Map</h5>
            <h1 class="mb-0">캠핑장</h1>
        </div>
        <div class="packages-carousel owl-carousel">
            <c:forEach var="cvo" items="${cList}" varStatus="s">
                <div class="packages-item">
                    <div class="packages-img">
                        <img src="${cvo.image1}" style="height:280px;width:420px" class="rounded-top">
                        <div class="text-center packages-price py-2 px-4">Best</div>
                    </div>
                    <div class="packages-content bg-light">
                        <div class="p-4 pb-0">
							<a href="../camp/detail.do?camp_no=${cvo.camp_no }"/>
                            	<h5 class="mb-0 truncate-text">${cvo.camp_name}</h5>
                            </a>
                            <p class="mb-4"></p>
                        </div>
                        <div class="row bg-primary rounded-bottom mx-0">
                            <div class="col-6 text-start px-0">
                                <a href="#" class="btn-hover btn text-white py-2 px-4"></a>
                            </div>
                            <div class="col-6 text-end px-0">
                                <a href="#" class="btn-hover btn text-white py-2 px-4">${cvo.camp_price}원</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
	<!-- 캠핑장 추천 End -->


<!-- 캠핑용품 Start -->
<div class="container-fluid packages py-5">
    <div class="container py-5">
        <div class="mx-auto text-center mb-5" style="max-width: 900px;">
            <h5 class="section-title px-3">Camping Tools</h5>
            <h1 class="mb-0">캠핑용품</h1>
        </div>
        <div class="packages-carousel owl-carousel">
            <c:forEach var="vo" items="${gList}" varStatus="s">
                <div class="packages-item">
                   <div class="packages-img" style="border: 1px solid #ddd; background-color: #fff;">
					    <img src="${vo.poster}" class="img-fluid w-100 rounded-top" alt="Image"
					         style="object-fit: contain; height: 300px; background-color: #fff;">
                        <div class="packages-info d-flex border border-start-0 border-end-0 position-absolute"
                             style="width: 100%; bottom: 0; left: 0; z-index: 5;">
                            <!-- <a href="#" class="flex-fill text-center border-end py-2 text-decoration-none"
                               style="color: #ffffff;">
                                <i class="fa fa-heart me-2"></i>찜하기
                            </a> -->
                    
                            <a href="#" class="flex-fill text-center border-end py-2 text-decoration-none"
                               style="color: #ffffff;"> 
                                <i class="fa fa-shopping-cart me-2"></i>장바구니
                            </a>
                            <a href="../campgoods/detail.do?cno=${vo.cno}&gno=1" class="flex-fill text-center border-end py-2 text-decoration-none"
                               style="color: #ffffff;"> 
                                <i class="fa fa-search me-2"></i>상세보기
                            </a>
                        </div>
                        <!--<div class="text-center packages-price py-2 px-4">Best</div>-->
                    </div>
                    <div class="packages-content bg-light">
                        <div class="p-4 pb-0">
                            <h5 class="mb-0 truncate-text" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
                             ${vo.name}</h5>
                             <small class="text-uppercase truncate-text">
                                <c:choose>
                                    <c:when test="${vo.type1 == 1}">
                                        에어매트
                                    </c:when>
                                    <c:when test="${vo.type1 == 2}">
                                        텐트
                                    </c:when>
                                    <c:when test="${vo.type1 == 3}">
                                        등산용품
                                    </c:when>
                                    <c:when test="${vo.type1 == 4}">
                                        의자
                                    </c:when>
                                    <c:when test="${vo.type1 == 5}">
                                        바베큐
                                    </c:when>
                                    <c:when test="${vo.type1 == 6}">
                                        랜턴/버너
                                    </c:when>
                                    <c:otherwise>
                                        기타
                                    </c:otherwise>
                                </c:choose>
                            </small>
                            <p class="mb-4"></p>
                        </div>
                        <div class="row bg-primary rounded-bottom mx-0">
                            <div class="col-6 text-start px-0">
                                <a href="#" class="btn-hover btn text-white py-2 px-4"><i class="fa fa-heart me-2"></i>${vo.jjimcount}</a>
                            </div>
                            <div class="col-6 text-end px-0">
                                <a href="#" class="btn-hover btn text-white py-2 px-4">${vo.price}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<!-- 캠핑용품 End -->


<!-- 맛집 Start -->

<div class="container-fluid packages py-5">
    <div class="container py-5">
        <div class="mx-auto text-center mb-5" style="max-width: 900px;">
            <h5 class="section-title px-3">Foodie Map</h5>
            <h1 class="mb-0">맛집</h1>
        </div>
        <div class="packages-carousel owl-carousel">
            <c:forEach var="fvo" items="${likeList}" varStatus="s">
                <div class="packages-item" style="max-width:100%; height: 100%;">
                    <div class="packages-imges position-relative" style="width: 100%; height: 270px;">
                        <a href="../food/detail_before.do?fno=${fvo.fno }&type=1"><img class="img-fluid w-100 h-100 object-fit-cover rounded-top" src="https://www.bluer.co.kr${fvo.poster}" alt="Image"></a>
                    </div>
                    <div class="packages-content bg-light">
                        <div class="p-2 pb-2" style="display: flex; align-items: center;">
					    <h5 class="mb-0 truncate-text" style="flex: 1; margin-left: 20px;">#${fvo.tag}</h5>
					    <div class="text-center packages-price py-2 px-4" style="display: flex; align-items: center;">
					        <img src="pointer.png" style="width: 30px; height: auto; margin-right: 8px;">
					        <span>${fvo.hit}</span>
					    </div>
					</div>
                    </div>
                    <div class="row bg-primary rounded-bottom mx-0">
                        <div class="col-12 text-end px-0">
                            <a href="../food/detail_before.do?fno=${fvo.fno }&type=1" class="btn-hover btn text-white py-2 px-4">${fvo.name}</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<!-- 맛집 end -->
	
	<!-- 레시피 Start -->
	<div class="container-fluid packages py-5">
		<div class="container py-5">
			<div class="mx-auto text-center mb-5" style="max-width: 900px;">
				<h5 class="section-title px-3">Recipe</h5>
				<h1 class="mb-0">레시피</h1>
			</div>
			 <div class="packages-carousel owl-carousel"></div> 

					  <!-- Blog Start -->
			<div class="row g-4 justify-content-center">
    <c:forEach var="revo" items="${relikelist}" varStatus="s">
        <div class="col-lg-4 col-md-6">
            <div class="blog-item border rounded shadow-sm overflow-hidden" style="max-width:100%; height: 100%;">
                <div class="blog-img position-relative" style="width: 100%; height: 270px;">
                    <a href="../recipe/detail_before.do?no=${revo.no}&type=3" class="h4"><img class="img-fluid w-100 h-100 object-fit-cover rounded-top" src="https://ottogi.okitchen.co.kr/${revo.poster }" alt="Image"></a>
                    <!-- 링크 아이콘: 호버 시에만 표시 -->
                    <div class="blog-icon position-absolute top-50 start-50 translate-middle" style="opacity: 0; transition: opacity 0.3s;">
                        <a href="#"><i class="fas fa-link fa-2x text-white"></i></a>
                    </div>
                </div>
                <div class="blog-info d-flex justify-content-between align-items-center border border-start-0 border-end-0 p-3" >
                    <div class="text-center" style="margin-left:40px">
                        <img src="ready.png" style="width: 30px; height: auto;">
                        <div>준비시간<br>${revo.info1}분</div>
                    </div>
                    <div class="text-center">
                        <img src="time.png" style="width: 30px; height: auto;">
                        <div>조리시간<br>${revo.info2}분</div>
                    </div>
                    <div class="text-center" style="margin-right:40px">
                        <img src="amount.png" style="width: 30px; height: auto;">
                        <div>인분수<br>${revo.info3}인분</div>
                    </div>
                </div>
                <div class="blog-content border-top-0 rounded-bottom p-4">
                    <p class="mb-3"><img src="pointer.png" style="width: 30px; height: auto;">${revo.hit}</p>
                    <a href="../recipe/detail_before.do?no=${revo.no}&type=3" class="h4">${revo.title}</a>
                    <p class="my-3" style=" white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">${revo.subtitle}</p>
                    <a href="#" class="btn btn-primary d-block text-center"><i class="fa fa-heart me-2"></i>찜하기</a>
 
                    
                </div>
            </div>
        </div>
    </c:forEach>
</div>
</div>


				</div>
        <!-- Blog End -->
 
	<!-- 레시피 End -->

	<!-- 후기 Start -->
	<div class="container-fluid testimonial py-5">
		<div class="container py-5">
			<div class="mx-auto text-center mb-5" style="max-width: 900px;">
				<h5 class="section-title px-3">review</h5>
				<h1 class="mb-0">후기</h1>
			</div>
			<div class="testimonial-carousel owl-carousel">
				<div class="testimonial-item text-center rounded pb-4">
					<div class="testimonial-comment bg-light rounded p-4">
						<p class="text-center mb-5">Lorem ipsum dolor, sit amet
							consectetur adipisicing elit. Quis nostrum cupiditate, eligendi
							repellendus saepe illum earum architecto dicta quisquam quasi
							porro officiis. Vero reiciendis,</p>
					</div>
					<div class="testimonial-img p-1">
						<img src="../img/testimonial-1.jpg" class="img-fluid rounded-circle"
							alt="Image">
					</div>
					<div style="margin-top: -35px;">
						<h5 class="mb-0">John Abraham</h5>
						<p class="mb-0">New York, USA</p>
						<div class="d-flex justify-content-center">
							<i class="fas fa-star text-primary"></i> <i
								class="fas fa-star text-primary"></i> <i
								class="fas fa-star text-primary"></i> <i
								class="fas fa-star text-primary"></i> <i
								class="fas fa-star text-primary"></i>
						</div>
					</div>
				</div>
				<div class="testimonial-item text-center rounded pb-4">
					<div class="testimonial-comment bg-light rounded p-4">
						<p class="text-center mb-5">Lorem ipsum dolor, sit amet
							consectetur adipisicing elit. Quis nostrum cupiditate, eligendi
							repellendus saepe illum earum architecto dicta quisquam quasi
							porro officiis. Vero reiciendis,</p>
					</div>
					<div class="testimonial-img p-1">
						<img src="../img/testimonial-2.jpg" class="img-fluid rounded-circle"
							alt="Image">
					</div>
					<div style="margin-top: -35px;">
						<h5 class="mb-0">John Abraham</h5>
						<p class="mb-0">New York, USA</p>
						<div class="d-flex justify-content-center">
							<i class="fas fa-star text-primary"></i> <i
								class="fas fa-star text-primary"></i> <i
								class="fas fa-star text-primary"></i> <i
								class="fas fa-star text-primary"></i> <i
								class="fas fa-star text-primary"></i>
						</div>
					</div>
				</div>
				<div class="testimonial-item text-center rounded pb-4">
					<div class="testimonial-comment bg-light rounded p-4">
						<p class="text-center mb-5">Lorem ipsum dolor, sit amet
							consectetur adipisicing elit. Quis nostrum cupiditate, eligendi
							repellendus saepe illum earum architecto dicta quisquam quasi
							porro officiis. Vero reiciendis,</p>
					</div>
					<div class="testimonial-img p-1">
						<img src="../img/testimonial-3.jpg" class="img-fluid rounded-circle"
							alt="Image">
					</div>
					<div style="margin-top: -35px;">
						<h5 class="mb-0">John Abraham</h5>
						<p class="mb-0">New York, USA</p>
						<div class="d-flex justify-content-center">
							<i class="fas fa-star text-primary"></i> <i
								class="fas fa-star text-primary"></i> <i
								class="fas fa-star text-primary"></i> <i
								class="fas fa-star text-primary"></i> <i
								class="fas fa-star text-primary"></i>
						</div>
					</div>
				</div>
				<div class="testimonial-item text-center rounded pb-4">
					<div class="testimonial-comment bg-light rounded p-4">
						<p class="text-center mb-5">Lorem ipsum dolor, sit amet
							consectetur adipisicing elit. Quis nostrum cupiditate, eligendi
							repellendus saepe illum earum architecto dicta quisquam quasi
							porro officiis. Vero reiciendis,</p>
					</div>
					<div class="testimonial-img p-1">
						<img src="../img/testimonial-4.jpg" class="img-fluid rounded-circle"
							alt="Image">
					</div>
					<div style="margin-top: -35px;">
						<h5 class="mb-0">John Abraham</h5>
						<p class="mb-0">New York, USA</p>
						<div class="d-flex justify-content-center">
							<i class="fas fa-star text-primary"></i> <i
								class="fas fa-star text-primary"></i> <i
								class="fas fa-star text-primary"></i> <i
								class="fas fa-star text-primary"></i> <i
								class="fas fa-star text-primary"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 후기 End -->
</div>

</body>
</html>