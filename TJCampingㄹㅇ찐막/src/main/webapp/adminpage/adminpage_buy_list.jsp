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
  <div>
   <table class="table">
    <tr>
      <th class="text-center" style="width:10%">ID</th>
      <th class="text-center" style="width:15%"></th>
      <th class="text-center" style="width:20%">상품명</th>
      <th class="text-center" style="width:10%">수량</th>
      <th class="text-center" style="width:20%">구매가격</th>
      <th class="text-center" style="width:20%">구매날짜</th>
    </tr>
    <c:forEach var="mvo" items="${mList }">
    <tr>
       <td class="text-center" style="width:15%">${mvo.id }</td>
      <td class="text-center" style="width:15%">
      	<img src="${mvo.gvo.poster }" style="width: 40px;height: 40px">
      </td>
      <td class="text-center" style="width:20%">${mvo.gvo.name }</td>
      <td class="text-center" style="width:10%">${mvo.account }</td>
      <td class="text-center" style="width:20%">${mvo.price }</td>
      <td class="text-center" style="width:20%">${mvo.dbday }</td>
       </tr>
    </c:forEach>
   </table>
   <table class="table">
     <tr>
       <td class="text-center">
        <a href="../adminpage/adminpage_buy_list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-info">이전</a>
         &nbsp;
							<a class="boardlistsytle">${curpage } page &nbsp; / &nbsp; ${totalpage } pages</a><!-- 이전 현재쪽 / 총쪽 다음 -->
						&nbsp;
        <a href="../adminpage/adminpage_buy_list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-info">다음</a>
       </td>
     </tr>
   </table>
   </div>
</body>
</html>