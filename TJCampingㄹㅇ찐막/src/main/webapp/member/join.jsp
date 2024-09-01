<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
})
$(function(){
	$('#checkBtn').on('click',function(){
		Shadowbox.open({
			content:'../member/idcheck.do',
			player:'iframe',
			width:370,
			height:200,
			title:'아이디 중복체크'
		})
	})
	$('#postBtn').click(function(){
		new daum.Postcode({
			oncomplete:function(data)
			{
				$('#post1').val(data.zonecode)
				$('#addr1').val(data.address)
			}
		}).open()
	})
})
</script>
<style>
.bg-breadcrumb {
   background-image: url('camp_food.jpg');
   background-size: cover; /* 이미지가 요소를 덮도록 설정 */
   background-position: center; /* 이미지가 중앙에 위치하도록 설정 */
}

.row1 {
	margin: 0px auto;
	width: 800px;
}
</style>
</head>
<body>
<!-- Header Start -->
	<div class="container-fluid whitezzz "style="height:100px;"></div>
		<div class="container text-center py-5" style="max-width: 200px; ">
			<div class="mx-auto text-center mb-5" style="max-width: 200px;">
				<h5 class="section-title py-12"></h5>
				<h1 class="mb-0 " >회원가입</h1>
			</div>
		</div>
	<!-- Header End -->
<div class="container py-5">
  <main class="container clear">
   <div class="row1">
   <form method="post" action="../member/join_ok.do" name="frm">
    <table class="table">
     <tr>
      <th class="text-right thtext" width="15%" >ID</th>
      <td width="85%" class="inline">
       <input type="text" size=20 class="input-sm" 
          readonly name="id" id="id">
       <input type="button" value="중복체크"
         class="btn-sm btn-danger" id="checkBtn">
      </td>
     </tr>
     <tr>
      <th class="text-right thtext" width="15%">비밀번호</th>
      <td width="85%" class="inline">
       <input type="password" size=20 class="input-sm" name="pwd" id="pwd">
       &nbsp;재입력:<input type="password" size=20 class="input-sm" id="pwd1">
      </td>
     </tr>
     <tr>
      <th class="text-right thtext" width="15%">이름</th>
      <td width="85%">
       <input type="text" size=20 class="input-sm" name="name" id="name">
      </td>
     </tr>
     <tr>
      <th class="text-right thtext" width="15%">성별</th>
      <td width="85%" class="inline">
       <input type="radio" name="sex" value="남자" checked>남자
       <input type="radio" name="sex" value="여자">여자
      </td>
     </tr>
     <tr>
      <th class="text-right thtext" width="15%">생년월일</th>
      <td width="85%">
       <input type="date" size=30 class="input-sm" name="birth" id="day">
      </td>
     </tr>
     <tr>
      <th class="text-right thtext" width="15%">이메일</th>
      <td width="85%">
       <input type="text" size=70 class="input-sm" name="email" id="email">
      </td>
     </tr>
     <tr>
      <th class="text-right thtext" width="15%">우편번호</th>
      <td width="85%" class="inline">
       <input type="text" size=15 class="input-sm" name="post" readonly id="post1">
       <input type=button value="우편번호검색"
         class="btn btn-sm btn-primary" id="postBtn">
      </td>
     </tr>
     <tr>
      <th class="text-right thtext" width="15%">주소</th>
      <td width="85%">
       <input type="text" size=70 class="input-sm" name="addr1" readonly id="addr1">
      </td>
     </tr>
     <tr>
      <th class="text-right thtext" width="15%">상세주소</th>
      <td width="85%">
       <input type="text" size=70 class="input-sm" name="addr2">
      </td>
     </tr>
     <tr>
      <th class="text-right thtext" width="15%">전화번호</th>
      <td width="85%" class="inline">
       <select class="input-sm" name="phone1">
        <option>010</option>
       </select>
       <input type="text" size=20 class="input-sm" name="phone2" id="phone2">
      </td>
     </tr>
     <tr>
      <th class="text-right thtext" width="15%">소개</th>
      <td width="85%">
       <textarea rows="5" cols="70" name="content"></textarea>
      </td>
     </tr>
     <tr>
       <td colspan="2" class="text-center inline">
        <input type="submit" value="회원가입"
         class="btn-sm btn-info" id="joinBtn"
        >
        <input type=button value="취소"
         class="btn-sm btn-warning"
         onclick="javascript:history.back()"
        >
       </td>
     </tr>
    </table>
    </form>
   </div>
  </main>
</div>
</body>
</html>