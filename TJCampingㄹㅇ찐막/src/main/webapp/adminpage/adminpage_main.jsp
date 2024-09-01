<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
        .sectiontitle{
        	margin:80px;
        }
    </style>
</head>
<body>
	<!-- Header Start -->
	<div class="container-fluid whitezzz "style="height:100px;"></div>
	<!-- Header End -->
    <div class="container py-5">
	<h3 class="sectiontitle text-center">${title }</h3>
        <main class="container clear">
        <div class="row" >
            <div class="col-sm-2">
                <div class="panel panel-primary text-center">
                    <div class="panel-heading ">
                        <h3 class="panel-title">관리</h3>
                    </div>
                    <!-- 사이드바 메뉴목록1 -->
                    <ul class="list-group">
                        <li class="list-group-item"><a href="../adminpage/memberlist.do">회원관리</a></li>
                        <li class="list-group-item"><a href="../adminpage/notice_list.do">공지사항관리</a></li>
                        <li class="list-group-item"><a href="../adminpage/adminpage_buy_list.do">구매관리</a></li>
                        <li class="list-group-item"><a href="../adminpage/adminpage_reserve.do">예약관리</a></li>
                        <li class="list-group-item"><a href="../adminpage/reply_list.do">QnA</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-sm-10">
            	<div style="height:40px;"></div>
                <jsp:include page="${admin_jsp }"></jsp:include>
            </div>
            </div>
        </main>
    </div>
</body>
</html>