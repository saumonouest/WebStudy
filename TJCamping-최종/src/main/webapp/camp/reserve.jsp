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
		let camp_no=$('#camp_no1').val()
		$.ajax({
		    type: 'post',
		    url: '../camp/reserve_date.do',
		    data: {
		        "camp_no": camp_no
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
.bg-breadcrumb {
    background-image: url('camp_reserve.jpg');
}
</style>
</head>
<body>
<!-- Header Start -->
<div class="container-fluid bg-breadcrumb">
	<div class="container text-center py-5" style="max-width: 900px;">
		<h3 class="text-white display-3 mb-4">캠핑장 예약</h3>
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
	    <caption> <h4 class="text-center">캠핑장 정보</h4> </caption>
		 <table class="table">
		  <input type="hidden" value="${vo.camp_no }" id="camp_no1">
		   <tr>
			<td class="text-center dataTr" data-camp_no="${vo.camp_no }" colspan="2">
			<img src="${vo.image1 }" style="width: 250px; height: 180px" id="camp_image"></td>
		   </tr>
		   <tr>
			<td width="30%" class="text-right">업체명</td>
			<td width="70%" id="camp_name">${vo.camp_name }</td>
		   </tr>
		   <tr>
			<td width="30%" class="text-right">☎</td>
			<td width="70%" id="camp_phone">${vo.camp_phone }</td>
		   </tr>
		   <tr>
			<td width="30%" class="text-right">예악일</td>
			<td width="70%" id="camp_day"></td>
		   </tr>
		   <tr>
			<td width="30%" class="text-right">시간</td>
			<td width="70%" id="camp_time_data"></td>
		   </tr>
		   <tr>
			<td width="30%" class="text-right">인원</td>
			<td width="70%" id="camp_inwon_data"></td>
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
           <form action="../camp/reserve_ok.do" method="post">
			<input type="hidden" name="camp_no" value="" id="r_camp_no">
			<input type="hidden" name="date" value="" id="r_date">
			<input type="hidden" name="time" value="" id="r_time">
			<input type="hidden" name="inwon" value="" id="r_inwon">
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
	        <td class="text-center" id="camp_time"></td>
		   </tr>
		  </table>
		 </td>
		 <td width=30% height=100>
		  <table class="table">
		   <caption> <h4 class="text-center">인원 정보</h4></caption>
			<tr>
			 <td class="text-center" id="camp_inwon"></td>
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