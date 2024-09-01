<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
  
     var IMP = window.IMP; 
     IMP.init("imp68206770"); 
     
     function requestPay(json,name,price) {
    	 IMP.request_pay({
             pg: "html5_inicis",
             pay_method: "card",
             merchant_uid: "ORD20180131-0000011",   // 주문번호
             name: name,
             amount: price, // 숫자 타입
             buyer_email: json.email,
             buyer_name: json.name,
             buyer_tel: json.phone,
             buyer_addr: json.address,
             buyer_postcode: json.post
         }, function (rsp) { // callback
         	location.href='http://localhost/TJCamping/mypage/mypage_main.do'
             
         });
     }
     
    	 
      
     
     $(function(){
     	$('.buyBtn').click(function(){
     		let cno=$(this).attr("data-cno");
     		let name=$('#gname'+cno).text()
     		let price=$('#price'+cno).text()
     		let account=$('#account'+cno).text()
     		price=price*account
     		$.ajax({
     			type:'post',
     			url:'../mypage/mypage_cart_buy.do',
     			data:{"cno":cno},
     			success:function(result)
     			{
     				let json=JSON.parse(result)
     				console.log(json)
     				requestPay(json,name,price)
     				  
     			} 
     		})
     		
     	})
     })
 </script>
</head>
<body>
 
<c:if test="${count==0 }">
    <table class="table">
     <tr>
      <td class="text-center">
       <h4>장바구니에 상품이 없습니다</h4>
      </td>
     </tr>
    </table>
  </c:if>
   <c:if test="${count!=0 }">
	  <table class="table">
	   <tr>
	    <th class="text-center">번호</th>
	    <th class="text-center"></th>
	    <th class="text-center">상품명</th>
	    <th class="text-center">수량</th>
	    <th class="text-center">가격</th>
	    <th class="text-center"></th>
	   </tr>
	   <c:forEach var="cavo" items="${cartList }">
	     <tr>
	      <td class="text-center" id="cno${cavo.cno }">${cavo.cno }</td>
	      <td class="text-center">
	       <img src="${cavo.gvo.poster }" style="width:25px;height: 25px">
	      </td>
	      <td class="text-center" id="gname${cavo.cno }">${cavo.gvo.name }</td>
	      <td class="text-center" id="account${cavo.cno }">${cavo.account }</td>
	      <td class="text-center" id="price${cavo.cno }">${cavo.price }</td>
	      <td class="text-center">
	       <input type="button" class="btn btn-xs btn-primary buyBtn" value="구매"  data-cno="${cavo.cno }" >
	       <a href="../mypage/mypage_cart_cancel.do?cno=${cavo.cno }" class="btn btn-xs btn-danger">취소</a>
	      </td>
	     </tr>
	   </c:forEach>
	  </table>
   </c:if>
</body>
</html>