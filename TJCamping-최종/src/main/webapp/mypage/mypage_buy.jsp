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
   <div class="row resRow">
    <table class="table">
      <tr>
          <td>
         <div class="container " style="padding-left: 30px;">
         	<div style="height:10px;"></div>
            <jsp:include page="${buy_jsp }"></jsp:include>
         </div>
          </td>
        </tr>
    </table>
   </div>
  </main>
</div>
</body>
</html>