<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style type="text/css">
       
        .sectiontitle{
        	margin:100px;
        }
        .ques1{
        	margin:0px auto;
        }
        .list-group1 {
        display: flex;
        justify-content: center;
    }

    .list-group1-item {
        display: inline-block;
        margin: 0 10px; /* 리스트 항목 간의 간격 조정 */
    }
    </style>
</head>
<body>

	<style>
    .panel-body {
        display: flex;
        justify-content: space-around;
    }

    .panel-body .card {
        width: 18%;
        background-color: #f8f9fa;
        padding: 15px;
        border: 1px solid #ddd;
        border-radius: 5px;
        text-align: center;
    }

    .panel-body .card a {
        text-decoration: none;
        color: #007bff;
    }
</style>
<h3 class="sectiontitle text-center text-center">고객센터</h3>
<main class="container clear ques1" style="width:1500px;">
    <div class="panel panel-primary text-center">
        <div class="panel-heading">
            <h3 class="panel-title">자주묻는 질문!</h3>
        </div>
        <div class="panel-body">
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
    <div class="wrapper row3">
	
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
        </main>
</body>
</html>