<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.times').click(function(){
		let time=$(this).text()
		
		$.ajax({
			type:'post',
			url:'../food/food_reserve_inwon.do',
			success:function(result)
			{
				$('#inwon').html(result)
				$('#time_data').text(time)
				
				$('#r_time').val(time)
			},
			error:function(request,status,error)
			{
				console.log(error)
			}
		})
	})
})
</script>
</head>
<body>
	<c:forEach var="ft" items="${ftList }">
		<span class="btn btn-xs btn-primary times" style="margin-top:5px;margin-left:5px">${ft }</span>
	</c:forEach>
</body>
</html>