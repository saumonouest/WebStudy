<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
aa{
	margin:20px;
}
</style>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear">
  <table class="table aa">
	<a href="../mypage/alljjim_list.do" class="btn btn-xs btn-danger"  id="all" style="margin-left:20px">전체</a>
	<a href="../mypage/fbjjim_list.do" class="btn btn-xs btn-info"  id="fb">맛집</a>
	<a href="../mypage/cgjjim_list.do" class="btn btn-xs btn-primary"  id="cg">캠핑용품</a>
	<a href="../mypage/recjjim_list.do" class="btn btn-xs btn-warning" id="cmp">레시피</a>
</table>
   <div class="row resRow">
    <table class="table">
      <tr>
          <td>
         <div class="container " style="padding-left: 30px;">
         	<div style="height:10px;"></div>
            <jsp:include page="${jjim_jsp }"></jsp:include>
         </div>
          </td>
        </tr>
    </table>
   </div>
  </main>
</div>
</body>
</html>