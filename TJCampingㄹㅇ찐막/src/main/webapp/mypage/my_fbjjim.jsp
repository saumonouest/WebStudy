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
  <div style="height: 10px"></div>
   <table class="table">
    <tr>
      <th class="text-center">번호</th>
      <th class="text-center"></th>
      <th class="text-center">이름</th>
      <th class="text-center">찜유무</th>
    </tr>
    <c:forEach var="fvo" items="${fbList }">
    <tr>
       <td class="text-center">1</td>
       <td class="text-center">
        <img src="http://www.bluer.co.kr${fvo.poster }" style="width: 30px;height: 30px">
       </td>
       <td>${fvo.name }</td>
       <td class="text-center">
       	<input type="button" class="btn-xs btn-danger" value="찜취소">
       </td>
       </tr>
    </c:forEach>
   </table>
</body>
</html>