<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.title1 , .title2 , .title3{
	margin:0px auto;
	color:rgb(115,115,115);
}
.title1{
	background-color:rgba(141,186,0,.6);
}
.title2{
	background-color:rgba(92,176,153,.6);
}
.title3{
	background-color:rgba(91,159,180,.6);
}
.t1{
	background-color:rgba(222,236,183.6);
}
.t2{
	background-color:rgba(215,227,225,.6);
}
.t3{
	background-color:rgba(213,226,235,.6);
}
.fbBtn{
	background-color:rgba(185,220,116,.6);
	color: white;
}
.cgBtn{
	background-color:rgba(147,197,185,.6);
	color: white;
}
.recBtn{
	background-color:rgba(165,196,214,.6);
	color: white;
}
td{
color:rgb(82,82,82);
}
</style>
</head>
<body>
   	<p class="text-center title1">맛집</p>
   <table class="table t1">
    <tr>
      <th class="text-center" width="10%">번호</th>
      <th class="text-center" width="10%"></th>
      <th class="text-center" width="65%">이름</th>
      <th class="text-center" width="15%">찜유무</th>
    </tr>
    <c:set var="ffvo" value="${ftotal}" />
    <c:forEach var="fvo" items="${fbList }" begin="1" end="${ftotal}" varStatus="i">
    <tr>
       
       <td class="text-center">${ftotal-(i.index)}</td>
       <td class="text-center">
		<img src="http://www.bluer.co.kr${fvo.poster }" style="width: 30px;height: 30px">       </td>
       <td>${fvo.name }</td>
       <td class="text-center">
       	<a href="#" class="btn btn-sm  fbBtn">찜취소</a>
       </td>
       </tr>
    </c:forEach>
    </table>
   	<p class="text-center title2">캠핑용품</p>
    <table class="table t2">
    <tr>
    
      <th class="text-center" width="10%">번호</th>
      <th class="text-center" width="10%"></th>
      <th class="text-center" width="65%">이름</th>
      <th class="text-center" width="15%">찜유무</th>
    </tr>
    <c:set var="cgvo" value="${cgtotal}" />
    <c:forEach var="cvo" items="${cgList }" begin="1" end="${cgtotal}" varStatus="c">
    <tr>
    <input type="hidden" id="cno" value="${cvo.cno }">
       <td class="text-center">${cgtotal-(c.index)}</td>
       <td class="text-center">
        <img src="${cvo.poster }" style="width: 30px;height: 30px">
       </td>
       <td>${cvo.name }</td>
       <td class="text-center">
       	<a href="../member/camp_jjim_delete.do?cno=${cvo.cno }&type=2 " class="btn btn-sm  cgBtn" >찜취소</a>
       </td>
       </tr>
    </c:forEach>
    </table>
   	<p class="text-center title3">레시피</p>
    <table class="table t3">
    <tr>
      <th class="text-center" width="10%">번호</th>
      <th class="text-center" width="10%"></th>
      <th class="text-center" width="65%">이름</th>
      <th class="text-center" width="15%">찜유무</th>
    </tr>
    <c:set var="rrvo" value="${rtotal}" />
    <c:forEach var="rvo" items="${recList }" begin="1" end="${rtotal}" varStatus="r">
    <tr>
    <input type="hidden" value="${rvo.type }">
       <td class="text-center">${rtotal-(r.index)}</td>
       <td class="text-center">
        <img src="https://ottogi.okitchen.co.kr${rvo.poster }" style="width: 30px;height: 30px">
       </td>
       <td>${rvo.title }</td>
       <td class="text-center">
       	<a href="#" class="btn btn-sm recBtn" >찜취소</a>
       </td>
       </tr>
    </c:forEach>
   </table>
</body>
</html>