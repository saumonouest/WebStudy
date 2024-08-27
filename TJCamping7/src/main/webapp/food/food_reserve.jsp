<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		let fno=$('#fno').val()
		$.ajax({
		    type: 'post',
		    url: '../food/food_reserve_date.do',
		    data: {
		        "fno": fno
		    },
		    success: function(result) {
		        $('#rdate').html(result).show();  // 여기서 result를 사용할 수 있음
		    },
		    error: function(request, status, error) {
		        console.log(error);
		    }
		});

	})
</script>
<style type="text/css">
.rday_can:hover {
	cursor: pointer;
}

.reserve {
	background-color: rgba(141, 186, 0, .6);
}

.reservedate {
	background-color: rgba(222, 236, 183.6);
}

.can {
	background-color: red;
}
</style>
</head>
<body>
<!-- Header Start -->
<div class="container-fluid bg-breadcrumb">
	<div class="container text-center py-5" style="max-width: 900px;">
		<h3 class="text-white display-3 mb-4">맛집 예약</h3>
		<ol class="breadcrumb justify-content-center mb-0">
		</ol>
	</div>
</div>
<div class="container-fluid destination py-5">
 <div class="container py-5">
  <div class="wrapper row3">
   <main class="container clear">
    <table class="table">
     <tr>
      <td width=30% class="danger" height="400">
       <table class="table">
	    <caption> <h4 class="text-center">맛집 정보</h4> </caption>
		 <table class="table">
		  <input type="hidden" value="${vo.fno }" id="fno">
		   <tr>
			<td class="text-center dataTr" data-fno="${vo.fno }" colspan="2">
			<img src="http://bluer.co.kr${vo.poster }" style="width: 250px; height: 180px" id="poster"></td>
		   </tr>
		   <tr>
			<td width="30%" class="text-right">업체명</td>
			<td width="70%" id="camp_name">${vo.name }</td>
		   </tr>
		   <tr>
			<td width="30%" class="text-right">☎</td>
			<td width="70%" id="camp_phone">${vo.phone }</td>
		   </tr>
		   <tr>
			<td width="30%" class="text-right">예악일</td>
			<td width="70%" id="food_day"></td>
		   </tr>
		   <tr>
			<td width="30%" class="text-right">시간</td>
			<td width="70%" id="food_time_data"></td>
		   </tr>
		   <tr>
			<td width="30%" class="text-right">인원</td>
			<td width="70%" id="food_inwon_data"></td>
		   </tr>
		 </table>
	    </table>
       </td>
	   <td width=30% class="info" height="400">
        <table class="table">
         <caption><h4 class="text-center">예약일 정보</h4></caption>
         <tbody>
          <tr>
           <td id="rdate"></td>
          </tr>
         </tbody>
        </table>
       </td>
       <td width=20% rowspan="2" class="success" height="500">
	    <table class="table">
         <tr id="reserveBtn" style="display: none">
          <td colspan="2" class="text-center">
           <form action="../food/food_reserve_ok.do" method="post">
			<input type="hidden" name="fno" value="" id="fno">
			<input type="hidden" name="date" value="" id="date">
			<input type="hidden" name="time" value="" id="time">
			<input type="hidden" name="inwon" value="" id="inwon">
			<button class="btn-lg btn-primary">예약하기</button>
		   </form>
	      </td>
		 </tr>
	    </table>
       </td>
	   </tr>
	   <tr>
		<td width=30% class="default" height=100>
		 <table class="table">
		  <caption> <h4 class="text-center">시간 정보</h4></caption>
		   <tr>
	        <td class="text-center" id="time"></td>
		   </tr>
		  </table>
		 </td>
		 <td width=30% height=100>
		  <table class="table">
		   <caption> <h4 class="text-center">인원 정보</h4></caption>
			<tr>
			 <td class="text-center" id="inwon"></td>
			</tr>
		  </table>
		 </td>
		</tr>
	   </table>
	  </main>
	 </div>
	</div>
   </div>
</body>
</html>