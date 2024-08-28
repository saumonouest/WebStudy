<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.title1 , .title2 {
	margin:0px auto;
	color:rgb(115,115,115);
}
.title1{
	background-color:rgba(141,186,0,.6);
}
.title2{
	background-color:rgba(92,176,153,.6);
}
.t1{
	background-color:rgba(222,236,183.6);
}
.t2{
	background-color:rgba(215,227,225,.6);
}
.fhBtn{
	background-color:rgba(185,220,116,.6);
}
.cgBtn{
	background-color:rgba(147,197,185,.6);
	color: white;
}
td{
color:rgb(82,82,82);
}
</style>

</head>
<body>
 <div style="height: 10px"></div>
   	<p class="text-center title1">캠핑장</p>
   <table class="table t1">
    <tr>
      <th class="text-center">번호</th>
      <th class="text-center"></th>
      <th class="text-center">이름</th>
      <th class="text-center">인원</th>
      <th class="text-center">가격</th>
    </tr>
    <c:forEach var="ccvo" items="${clist }">
    <tr>
    	
       <td class="text-center">1</td>
       <td class="text-center">
        <img src="${ccvo.cvo.image1 }" style="width: 30px;height: 30px">
       </td>
       <td>${ccvo.cvo.camp_name }</td>
       <td class="text-center">${ccvo.account}명</td>
       <input type="hidden" id="c_account" value="${ccvo.account}">
       <input type="hidden" id="c_price" value="${ccvo.cvo.camp_price }">
       <script type="text/javascript">
       $(document).ready(function() {
       	let c_account=$('#c_account').val()
       	let c_price=$('#c_price').val()
       	let realprice=c_account*c_price
       	$('#rprice').text(realprice + '원');
       });
       </script>
       <td id="rprice"></td>
       </tr>
    </c:forEach>
        <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td class="text-right">총금액:${ctotal }원</td>
    </table>
   	<p class="text-center title2">캠핑용품</p>
    <table class="table t2">
    <tr>
    
      <th class="text-center">번호</th>
      <th class="text-center"></th>
      <th class="text-center">이름</th>
      <th class="text-center">수량</th>
      <th class="text-center">가격</th>
    </tr>
    <c:forEach var="ccgvo" items="${glist }">
    <tr>
    <input type="hidden" id="cno" value="${ccgvo.cno }">
       <td class="text-center">1</td>
       <td class="text-center">
        <img src="${ccgvo.gvo.poster }" style="width: 30px;height: 30px">
       </td>
       <td>${ccgvo.gvo.name }</td>
       <td class="text-center">${gvo.account}</td>
       <td >${gvo.price }</td>
       </tr>
    </c:forEach>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
        <td class="text-right">총금액:${gtotal }</td>
    </table>
   	
</body>
</html>