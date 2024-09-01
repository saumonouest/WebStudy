<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
  <main class="container clear">
   <div class="row">
    <table class="table">
     <tr>
      <th class="text-center">번호</th>
      <th class="text-center"></th>
      <th class="text-center">ID</th>
      <th class="text-center">업체명</th>
      <th class="text-center">예약일</th>
      <th class="text-center">시간</th>
      <th class="text-center">인원</th>
      <th class="text-center">상태</th>
     </tr>
     <c:forEach var="rrvo" items="${recvList }">
       <tr>
          <td class="text-center">${rrvo.rno }</td>
	      <td class="text-center">
	       <img src="${rrvo.cvo.image1 }" style="width: 20px;height: 20px">
	      </td>
	      <td class="text-center">${rrvo.id }</td>
	      <td>${rrvo.cvo.camp_name }</td>
	      <td class="text-center">${rrvo.day }</td>
	      <td class="text-center">${rrvo.time }</td>
	      <td class="text-center">${rrvo.inwon }</td>
	      <td class="text-center inline">
	       <c:if test="${rrvo.isok=='y' }">
	        <span class="btn btn-default btn-xs">승인완료</span>
	       </c:if>
	       <c:if test="${rrvo.isok=='n' }">
	        <a href="../adminpage/adminpage_reserve_ok.do?rno=${rrvo.rno }" class="btn btn-success btn-xs oks">승인대기</a>
	       </c:if>
	      </td>
       </tr>
     </c:forEach>
    </table>
   </div>
  </main>
</div>
</body>
</html>