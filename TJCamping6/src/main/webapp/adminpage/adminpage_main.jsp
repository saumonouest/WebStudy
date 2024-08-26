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
    </style>
</head>
<body>
    <div class="wrapper row3">
	<h3 class="sectiontitle text-center text-center">${title }</h3>
        <main class="container clear">
            <div class="col-sm-3">
                <div class="panel panel-primary text-center">
                    <div class="panel-heading ">
                        <h3 class="panel-title">관리</h3>
                    </div>
                    <!-- 사이드바 메뉴목록1 -->
                    <ul class="list-group">
                        <li class="list-group-item"><a href="../adminpage/member_list.do">회원관리</a></li>
                        <li class="list-group-item"><a href="../adminpage/notice_list.do">공지사항관리</a></li>
                        <li class="list-group-item"><a href="#">구매관리</a></li>
                        <li class="list-group-item"><a href="#">예약관리</a></li>
                        <li class="list-group-item"><a href="../adminpage/reply_list.do">QnA</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-sm-9">
                <jsp:include page="${admin_jsp }"></jsp:include>
            </div>
        </main>
    </div>
</body>
</html>