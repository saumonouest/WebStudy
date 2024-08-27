<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.resRow{
  width: 800px
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	
	$('.infos').click(function(){
		let frno=$(this).attr("data-frno")
		$.ajax({
			type:'post',
			url:'../mypage/mypage_food_reserve_info.do',
			data:{"frno":frno},
			success: function(json) {
		        // json이 JavaScript 객체인 경우
		        console.log(json); // debug
		        $('#info').show();
		        $('#poster').attr("src", json.poster);
		        $('#name').text(json.name);
		        $('#address').text(json.address);
		        $('#phone').text(json.phone);
		        $('#price').text(json.price);
		        $('#frno').text(json.frno);
		        $('#frdate').text(json.day);
		        $('#frtime').text(json.time);
		        $('#frinwon').text(json.inwon);
		        $('#regdate').text(json.regdate);
		    },

			error:function(request,status,error){
				console.log(error)
			}
		})
	})
})
</script>
</head>
<body>

<div class="wrapper row3">
  <main class="container clear">
   <div class="row resRow">
    <table class="table">
     <tr>
      <th class="text-center">번호</th>
      <th class="text-center"></th>
      <th class="text-center">캠핑장</th>
      <th class="text-center">예약일</th>
      <th class="text-center">시간</th>
      <th class="text-center">인원</th>
      <th class="text-center">상태</th>
     </tr>
     <c:forEach var="rvo" items="${rList }">
     <input type="hidden" id="camp_addr" value="${frvo.fvo.food_addr }">
     <input type="hidden" id="camp_price" value="${frvo.fvo.food_price }">
     <input type="hidden" id="camp_phone" value="${frvo.fvo.food_phone}">
     <input type="hidden" id="camp_regdate" value="${frvo.regdate }">
       <tr>
          <td class="text-center" id="camp_rno">${frvo.frno }</td>
	      <td class="text-center">
	       <img src="${frvo.fvo.image1 }" style="width: 20px;height: 20px" id="campimg">
	      </td>
	      <td id=camp_name>${frvo.fvo.camp_name }</td>
	      <td class="text-center" id=camp_day>${frvo.day }</td>
	      <td class="text-center" id=camp_time>${frvo.time }</td>
	      <td class="text-center" id=camp_inwon>${frvo.inwon }</td>
	      <td class="text-center inline">
	       <c:if test="${frvo.isok=='y' }">
	        <span class="btn btn-success btn-xs infos" data-rno="${frvo.frno }">예약완료</span>
	       </c:if>
	       <c:if test="${frvo.isok=='n' }">
	        <span class="btn btn-default btn-xs">예약대기</span>
	       </c:if>
	        <a href="../mypage/mypage_reserve_cancel.do?rno=${frvo.frno }" class="btn btn-danger btn-xs">취소</a>
	      </td>
       </tr>
     </c:forEach>
    </table>
    <div style="height: 10px"></div>
    <table class="table" style="display:none" id="info">
      <caption><h4>예약 정보</h4></caption>
      <tr>
        <td width=30% class="text-center" rowspan="9">
          <img src="" style="width: 100%" id="poster">
        </td>
        <td colspan="2">
         <h3><span id="name"></span>&nbsp;<span id="score" style="color:orange;"></span></h3>
        </td>
      </tr>
      <tr>
       <th width=20% class="text-center">주소</th>
       <td width="50%" id="address"></td>
      </tr>
      <tr>
       <th width=20% class="text-center">전화</th>
       <td width="50%" id="phone"></td>
      </tr>
      <tr>
       <th width=20% class="text-center">가격</th>
       <td width="50%" id="price"></td>
      </tr>
      <tr>
       <th width=20% class="text-center">예약번호</th>
       <td width="50%" id="frno"></td>
      </tr>
      <tr>
       <th width=20% class="text-center">예약일</th>
       <td width="50%" id="frdate"></td>
      </tr>
      <tr>
       <th width=20% class="text-center">시간</th>
       <td width="50%" id="frtime"></td>
      </tr>
      <tr>
       <th width=20% class="text-center">인원</th>
       <td width="50%" id="frinwon"></td>
      </tr>
      <tr>
       <th width=20% class="text-center">신청일</th>
       <td width="50%" id="regdate"></td>
      </tr>
    </table> 
   </div>
  </main>
</div>
</body>
</html>