<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
      h1 {
        text-align: center;
        margin-top: 30px;
        margin-bottom: 30px;
    }

    .wrapper {
        margin: 0 auto; /* 중앙 정렬 */
        max-width: 1200px; /* 최대 너비 설정 */
    }

    .table {
        margin-bottom: 20px; /* 테이블과 아래 내용 간격 조정 */
    }

    .table th, .table td {
        text-align: center; /* 테이블 텍스트 중앙 정렬 */
    }

    .pagination {
        text-align: center; /* 페이지네이션 가운데 정렬 */
        margin-top: 20px; /* 페이지네이션과 위 내용 간격 조정 */
        margin-bottom: 50px; /* 페이지네이션과 아래 내용 간격 조정 */
    }
        
    .btn-container {
        text-align: right; /* 버튼 오른쪽 정렬 */
        margin-bottom: 20px; /* 버튼과 위 내용 간격 조정 */
    }
    </style>
</head>
<body>
<div class="container-fluid whitezzz"></div>
    <h1>레시피 공지사항</h1>
    <div class="wrapper">

        <table class="table">
            <thead>
                <tr>
                    <th width="10%" class="text-center">번호</th>
                    <th width="35%" class="text-center">제목</th>
                    <th width="10%" class="text-center">작성자</th>
                    <th width="15%" class="text-center">작성일</th>
                    <th width="10%" class="text-center">조회수</th>
                    <th width="20%" class="text-center"></th>
                </tr>
            </thead>
            <tbody>
                <c:set var="count" value="${count }" />
                <c:forEach var="vo" items="${recipeList }">
                    <tr>
                        <td width="10%" class="text-center">${count }</td>
                        <td width="35%"><a href="../servicecenter/recipe_detail.do?no=${vo.no }">[${vo.recipe_type}]&nbsp;${vo.subject }</a></td>
                        <td width="10%" class="text-center">${vo.name }</td>
                        <td width="15%" class="text-center">${vo.dbday }</td>
                        <td width="10%" class="text-center">${vo.hit }</td>
                        <td width="20%" class="text-center">
                            <a href="../servicecenter/recipe_update.do?no=${vo.no }" class="btn btn-sm btn-success">수정</a>
                            <a href="../servicecenter/recipe_delete.do?no=${vo.no }" class="btn btn-sm btn-primary">삭제</a>
                        </td>
                    </tr>
                    <c:set var="count" value="${count-1 }" />
                </c:forEach>
            </tbody>
        </table>
        
        <div class="btn-container">
            <a href="../servicecenter/recipe_insert.do" class="btn btn-sm btn-danger">공지등록</a>
        </div>

        <div class="pagination">
            <a href="#" class="btn btn-sm btn-primary">이전</a> ${curpage } page / ${totalpage } pages 
            <a href="#" class="btn btn-sm btn-primary">다음</a>
        </div>
    </div>
</body>
</html>