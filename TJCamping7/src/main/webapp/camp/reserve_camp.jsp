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
		let tname=$(this).val()
		$.ajax({
			type:'post',
			url:'../camp/reserve_camp.do',
			data:{"type":tname},
			success:function(result)
			{
				$('#camp_list').html(result)
			},
			error:function(request,status,error)
			{
				console.log(error)
			}
		})
	})
	
	$('.dataTr').click(function(){
		let camp_no=$(this).attr("data-no")
		let image1=$(this).attr("data-image")
		let camp_name=$(this).attr("data-name")
		let camp_phone=$(this).attr("data-phone")
		let camp_price=$(this).attr("data-price")
		$.ajax({
			type:'post',
			url:'../camp/reserve_date.do',
			data:{"camp_no":camp_no},
			success:function(result)
			{
				$('#rdate').html(result)
				$('#camp_image').attr("src",image1)
				$('#camp_name').text(camp_name)
				$('#camp_phone').text(camp_phone)
				$('#camp_price').text(camp_price)
				
				$('#r_camp_no').val(camp_no)
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
				  data-no="${vo.camp_no }"
				  data-image="${vo.image1 }"
				  data-name="${vo.camp_name }"
				  data-phone="${vo.camp_phone }">
					<td class="text-center">
						<img src="${vo.image1 }" style="width:30px;height:30px">
					</td>
					<td>${vo.camp_name }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>