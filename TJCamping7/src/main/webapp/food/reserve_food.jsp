<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.types').click(function(){
		let fname=$(this).val()
		$.ajax({
			type:'post',
			url:'../food/reserve_food.do',
			data:{"type":fname},
			success:function(result)
			{
				$('#food_list').html(result)
			},
			error:function(request,status,error)
			{
				console.log(error)
			}
		})
	})
	
	$('.dataTr').click(function(){
		let fno=$(this).attr("data-fno")
		let poster=$(this).attr("data-image")
		let name=$(this).attr("data-name")
		let phone=$(this).attr("data-phone")
		$.ajax({
			type:'post',
			url:'../food/food_reserve_date.do',
			data:{"fno":fno},
			success:function(result)
			{
				$('#rdate').html(result)
				$('#poster').attr("src",poster)
				$('#name').text(name)
				$('#phone').text(phone)
				
				$('#r_fno').val(fno)
			},
			error:function(request,status,error)
			{
				console.log(error)
			}
		})
	})
})
</script>
<style type="text/css">
.dataTr:hover{
	background-color: #FC6;
	cursor: pointer;
}
</style>
</head>
<body>
	<table class="table">
		<tr>
			<td class="text-center inline">
				<input type="button" class="btn-xs btn-success types" value="한식">
				<input type="button" class="btn-xs btn-primary types" value="양식">
				<input type="button" class="btn-xs btn-danger types" value="중식">
				<input type="button" class="btn-xs btn-info types" value="일식">
				<input type="button" class="btn-xs btn-warning types" value="분식">
			</td>
		</tr>
	</table>
	<div style="height:10px"/>
	<div style="overflow-y:auto"/>
	<div>
		<table class="table">
			<tr>
				<th class="text-center"></th>
				<th class="text-center">업체명</th>
			</tr>
			<c:forEach var="vo" items="${fList }">
				<tr class="dataTr"
				  data-no="${vo.fno }"
				  data-image="${vo.poster }"
				  data-name="${vo.name }"
				  data-phone="${vo.phone }">
					<td class="text-center">
						<img src="${vo.posterv }" style="width:30px;height:30px">
					</td>
					<td>${vo.name }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>