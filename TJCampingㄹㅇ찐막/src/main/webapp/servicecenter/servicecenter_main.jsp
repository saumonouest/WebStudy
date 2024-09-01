<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <style type="text/css">
       
      .sectiontitle {
            margin: 50px 0; /* 제목과 상하 간격 조정 */
            font-size: 2em; /* 제목 크기 조정 */
            text-align: center;
        }

        .info-box {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .info-box .card {
            width: 300px; /* 카드 상자의 너비 조정 */
            margin: 10px; /* 카드 상자 간격 조정 */
            padding: 20px;
            background-color: #f8f9fa;
            border: 1px solid #ddd;
            border-radius: 5px;
            text-align: center;
        }

        .category-container {
            display: flex;
            justify-content: center;
            gap: 20px; /* 아이콘 간의 간격 조정 */
            margin-top: 20px; /* 제목과 아이콘 간의 간격 조정 */
        }

        .category {
            text-align: center;
            cursor: pointer;
        }

        .category img {
            width: 120px; /* 이미지 크기 조정 */
            height: 120px; /* 이미지 크기 조정 */
            margin-bottom: 10px;
        }

        .category p {
            font-size: 1.2em; /* 텍스트 크기 조정 */
            margin: 0;
        }

        #categories {
            padding: 20px;
        }

        .container {
            padding: 20px;
            border: 1px solid #ddd; /* 테두리 스타일 */
            border-radius: 5px; /* 모서리 둥글기 */
            background-color: #fff; /* 배경색 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        }
    </style>
</head>
<body>

	<style>

</style>
    <h3 class="sectiontitle">고객센터</h3>
    <main class="container">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">자주묻는 질문!</h3>
            </div>
            <div class="info-box">
                <div class="card">
                    <a href="../adminpage/member_list.do">배송중인데 추적되지 않아요</a>
                </div>
                <div class="card">
                    <a href="../adminpage/notice_list.do">반품은 어떻게 하나요?</a>
                </div>
                <div class="card">
                    <a href="#">캠핑장이 전화를 받지않아요!</a>
                </div>
                <div class="card">
                    <a href="#">아이디/비밀번호를 잊었어요...</a>
                </div>
                <div class="card">
                    <a href="../adminpage/reply_list.do">QnA</a>
                </div>
            </div>
        </div>
    </main>
<div style="height:300px;"></div>

<!-- <section id="categories">
    <h2 class="text-center">각각의 카테고리별로 궁금증을 해결하세요!</h2>
    <div class="category-container">
        <div class="category" onclick="loadList('camp_list.jsp')">
            <img src="camp.png" alt="캠핑 아이콘">
            <p>캠핑</p>
        </div>
        <div class="category" onclick="loadList('goods_list.jsp')">
            <img src="goods.png" alt="용품 아이콘">
            <p>용품</p>
        </div>
        <div class="category" onclick="loadList('recipe_list.jsp')">
            <img src="recipe.png" alt="레시피 아이콘">
            <p>레시피</p>
        </div>
        <div class="category" onclick="loadList('food_list.jsp')">
            <img src="restau.png" alt="맛집 아이콘">
            <p>맛집</p>
        </div>
    </div>
</section>-->

<section id="categories">
        <h2 class="text-center">카테고리별 궁금증을 해결하세요!</h2>
        <div class="category-container">
            <div class="category">
                <a href="../servicecenter/camp_list.do">
                    <img src="camp.png" alt="캠핑 아이콘">
                    <p>캠핑</p>
                </a>
            </div>
            <div class="category">
                <a href="../servicecenter/goods_list.do">
                    <img src="goods.png" alt="용품 아이콘">
                    <p>용품</p>
                </a>
            </div>
            <div class="category">
                <a href="../servicecenter/recipe_list.do">
                    <img src="recipe.png" alt="레시피 아이콘">
                    <p>레시피</p>
                </a>
            </div>
            <div class="category">
                <a href="../servicecenter/food_list.do">
                    <img src="restau.png" alt="맛집 아이콘">
                    <p>맛집</p>
                </a>
            </div>
        </div>
    </section>

<!-- 리스트가 로드될 부분 -->
<!-- <div id="list-container" class="container">
<script>
    function loadList(page) {
        $.ajax({
            url: '../servicecenter/camp_list.do', // 로드할 JSP 파일의 경로
            type: 'post',
            success: function(data) {
                $('#list-container').html(data); // 불러온 데이터를 #list-container에 삽입
            },
            error: function() {
                alert('리스트를 로드하는 데 실패했습니다.');
            }
        });
    }
</script>
</div> -->

<%--     <div class="wrapper row3">
	
        <main class="container clear" style="width:1500px;">
            <div class="col-sm-3">
                <div class="panel panel-primary text-center">
                    <div class="panel-heading ">
                        <h3 class="panel-title">관리</h3>
                    </div>
                    <!-- 사이드바 메뉴목록1 -->
                    <ul class="list-group">
                        <li class="list-group-item"><a href="../adminpage/member_list.do">아이디찾기</a></li>
                        <li class="list-group-item"><a href="../adminpage/notice_list.do">비밀번호찾기</a></li>
                        <li class="list-group-item"><a href="#">문의글작성</a></li>
                        <li class="list-group-item"><a href="#">문의내역확인하기</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-sm-9">
                <jsp:include page="${admin_jsp }"></jsp:include>
            </div>
        </main>
    </div>
    <main class="container clear" style="width:1500px;">
            
            <div >
                <jsp:include page="${notice_jsp }"></jsp:include>
            </div>
        </main> --%>
</body>
</html>