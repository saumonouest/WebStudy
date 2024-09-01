<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .container {
        display: flex;
        flex-direction: column;
    }
    .text-center {
        margin: 10px auto;
    }
    .button-container {
    }
    .btn-warning {
        background-color: #ffc107;
        border: none;
        padding: 5px 10px;
        color: #fff;
        border-radius: 5px;
        margin-left: 10px; /* 버튼과 텍스트 사이의 간격 */
    }
</style>
</head>
<body>
    <div class="container">
        <div class="text-center"><h2>${name}님 안녕하세요.</h2></div>
        <div class="text-center">Tj camp입니다!</div>
        <div class="text-center">피곤하고 지친 피로감</div>
        <div class="text-center">캠핑여행, 맛집 탐방은 어떠세요~~ ?</div>
        <div class="text-center ">궁금하신 점이 있으시면 언제든지 물어봐주세요!!<a href="#" class="btn-warning button-container">1:1 상담</a>
        </div>
    </div>
</body>
</html>
