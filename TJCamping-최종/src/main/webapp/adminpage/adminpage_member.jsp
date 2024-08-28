<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.table{
	width:1200px;
}
</style>
</head>
<body>
  <div style="height: 10px"></div>
   <table class="table">
    <tr>
      <th class="text-center" style="width:5%">ID</th>
      <th class="text-center" style="width:7%">이름</th>
      <th class="text-center" style="width:5%">성별</th>
      <th class="text-center" style="width:12%">생년월일</th>
      <th class="text-center" style="width:13%">이메일</th>
      <th class="text-center" style="width:10%">전화번호</th>
      <th class="text-center" style="width:10%">우편번호</th>
      <th class="text-center" style="width:25%">주소</th>
      <th class="text-center" style="width:10%">가입일</th>
      <th class="text-center" style="width:3%"></th>
    </tr>
    <c:forEach var="mvo" items="${mList }">
    <tr>
       <td class="text-center" style="width:5%">${mvo.id }</td>
      <td class="text-center" style="width:7%">${mvo.name }</td>
      <td class="text-center" style="width:5%">${mvo.sex }</td>
      <td class="text-center" style="width:12%">${mvo.bir }</td>
      <td class="text-center" style="width:13%">${mvo.email }</td>
      <td class="text-center" style="width:10%">${mvo.phone }</td>
      <td class="text-center" style="width:10%">${mvo.post }</td>
      <td class="text-center" style="width:25%">${mvo.addr1 }&nbsp;${mvo.addr2 }</td>
      <td class="text-center" style="width:10%">${mvo.reg }</td>
      <td class="text-center" style="width:3%">
      	<!-- <input type="button" value="Ⅹ" class="btn-xs"> -->
      	<a href="#" class="btn btn-xs btn-danger">Ⅹ</a>
      </td>
       </tr>
    </c:forEach>
   </table>
</body>
</html>