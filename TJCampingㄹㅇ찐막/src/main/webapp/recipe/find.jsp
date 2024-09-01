<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
        <meta charset="utf-8">
        <title>Travela - Tourism Website Template</title>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="../lib/easing/easing.min.js"></script>
<script src="../lib/waypoints/waypoints.min.js"></script>
<script src="../lib/owlcarousel/owl.carousel.min.js"></script>
<script src="../lib/lightbox/js/lightbox.min.js"></script>
<script type="text/javascript"></script>
<style>
.bg-breadcrumb {
    background-image: url('recipe.jpg');
    background-size: cover; /* 이미지가 요소를 덮도록 설정 */
    background-position: center; /* 이미지가 중앙에 위치하도록 설정 */
}
	main{
    margin-top : 70px;
}
.packages-img {
    width: 100%;
    height: 200px; /* 모든 이미지 틀의 높이를 동일하게 설정 */
    overflow: hidden; /* 넘치는 부분을 숨김 */
}

.packages-img img {
    width: 100%;
    height: 100%;
    object-fit: cover; /* 이미지가 틀에 맞추어 크롭되도록 설정 */
    display: block; 
    margin: 0 auto; /* 이미지가 가운데에 위치하도록 설정 */
}

.packages-item {
    margin-bottom: 30px; /* 각 패키지 항목 사이에 공간 추가 */
    max-width: 100%; /* 이미지를 컨테이너 너비에 맞게 조정 */
    overflow: hidden; /* 패키지 항목 내부의 넘치는 내용을 숨김 */
}
.packages-content h5{
    white-space: nowrap; /* 텍스트가 한 줄로 표시되도록 설정 */
    overflow: hidden; /* 넘치는 텍스트를 숨김 */
    text-overflow: ellipsis; /* 넘치는 텍스트를 "..."로 표시 */
    text-align: center; /* 텍스트를 가운데 정렬 */
}

.pagination {
    display: flex;
    justify-content: center; /* 페이지 버튼을 중앙에 정렬 */
    margin-top: 20px; /* 페이지 버튼 위쪽 여백 */
}

.pagination .page-link {
    border: 1px solid #ddd; /* 페이지 버튼 테두리 설정 */
    border-radius: 5px; /* 페이지 버튼 모서리 둥글게 설정 */
}


.search-container {
    display: flex; /* 자식 요소들을 가로 방향으로 배치 */
    justify-content: center; /* 가로 방향 중앙 정렬 */
    align-items: center; /* 세로 방향 중앙 정렬 */
    margin: 20px; /* 상하좌우 여백 추가 */
}

/* 검색 폼 스타일 */
.search-form {
    display: flex; /* 자식 요소들을 가로 방향으로 배치 */
    gap: 10px; /* 검색창과 버튼 사이의 간격 */
}

/* 검색창 스타일 */
.search-input {
    width: 300px; /* 검색창 너비 설정 */
    padding: 10px; /* 안쪽 여백 */
    border: 1px solid #ced4da; /* 테두리 스타일 */
    border-radius: 4px; /* 모서리 둥글게 */
    font-size: 16px; /* 글자 크기 */
}

li {
    list-style-type: none; /* Removes the bullet point */
    padding-left: 0; /* Removes any default padding */
    margin-left: 0; /* Ensures no margin is left */
}


</style>

</head>
<body>
<div class="container-fluid whitezzz" style="height:100px;"></div>
  <div class="wrapper row3">
  <main class="container clear"> 
    <!-- main body --> 
    <div class="content"> 
    
    
      <div class="container-fluid packages py-5">
      <div class="container py-5">
      <div class="mx-auto text-center mb-5" style="max-width: 900px;">
		<h5 class="section-title px-3">레시피 리스트</h5>
		<h1 class="mb-0">검색한 레시피</h1>
		</div>
      
        <figure>
          <header class="search-container">
           <form method="post" action="../recipe/find.do" class="search-form">
            <input type=text name=ress class="search-input" value="${ress}" >
            <button type="submit" class="btn-sm btn-primary">검색</button>
           </form>
          </header>
          
          
    <div class="row">
    <c:forEach var="vo" items="${reList }" varStatus="s">
        <div class="col-lg-3 col-md-6 col-sm-12">
            <div class="packages-item">
                <li class="one_quarter ${ s.index%4==0?'first':''}">
                    <a href="../recipe/detail_before.do?no=${vo.no}&type=3">
                        <div class="packages-img">
                            <img src="https://ottogi.okitchen.co.kr/${vo.poster}" class="img-fluid w-200 h-200 rounded-top" alt="${vo.title}">
                            <div class="packages-info d-flex border border-start-0 border-end-0 position-absolute" style="width: 100%; bottom: 0; left: 0; z-index: 5;">
                                <i class="text-white fa flex-fill text-center border-end text-decoration-none"><img src="pointer.png" style="width: 30px; height: auto; display: inline;">${vo.hit}</i>
                            </div>
                            <div class="text-center packages-price">${vo.info3}인분</div>
                        </div>
                        <div class="packages-content bg-light">
                            <div class="p-3 pb-1">
                                <h5 class="mb-0 text-center" style="margin-bottom:10px;">${vo.title}</h5>
                                <p class="mb-4"></p>
                            </div>
                        </div>
                    </a>
                </li>
            </div>
        </div>
    </c:forEach>
</div>

        </figure>
      </div>
      <nav class="pagination">
        <ul class="pagination justify-content-center">
          <%-- startPage = 1 11 21... --%>
          <c:if test="${startPage>1}">
           <li class="page-item">
           <a class="page-link" 
           href="../recipe/find.do?page=${startPage-1 }&ress=${ress}">&laquo; Previous</a></li>
          </c:if>
           <c:forEach var="i" begin="${startPage }" end="${endPage }">
            <li class="page-item ${i==curpage?'active':''}">
            <a class="page-link" href="../recipe/find.do?page=${i }&ress=${ress}">${i }</a></li>
           </c:forEach>
           
          <c:if test="${endPage<totalpage }">
           <li class="page-item"><a class="page-link" href="../recipe/find.do?page=${endPage+1}&ress=${ress}">Next &raquo;</a></li>
          </c:if>
          <%-- endPage = 10 20 30.. --%>
        </ul>
      </nav>
      </div>
    </div>
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
</body>
</html>