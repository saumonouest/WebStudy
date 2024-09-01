<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Travela - Tourism Website Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600&family=Roboto&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">


<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="../lib/easing/easing.min.js"></script>
<script src="../lib/waypoints/waypoints.min.js"></script>
<script src="../lib/owlcarousel/owl.carousel.min.js"></script>
<script src="../lib/lightbox/js/lightbox.min.js"></script>
<script type="text/javascript"></script>
<style>
.bg-breadcrumb {
	background-image: url('blank.jpg');
	background-size: cover; /* 이미지가 요소를 덮도록 설정 */
	background-position: center; /* 이미지가 중앙에 위치하도록 설정 */
}

.owl-nav {
	display: flex;
}

main {
	margin-top: 70px;
}

.packages-item {
	margin-bottom: 30px; /* 각 패키지 항목 사이에 공간 추가 */
	max-width: 100%; /* 이미지를 컨테이너 너비에 맞게 조정 */
	overflow: hidden; /* 패키지 항목 내부의 넘치는 내용을 숨김 */
}

.packages-img {
	width: 100%;
	height: 300px; /* 모든 이미지 틀의 높이를 동일하게 설정 */
	overflow: hidden; /* 넘치는 부분을 숨김 */
}

.packages-img img {
	width: 100%;
	height: 100%;
	display: block;
	margin: 0 auto; /* 이미지가 가운데에 위치하도록 설정 */
}

.packages-content h5 {
	white-space: nowrap; /* 텍스트가 한 줄로 표시되도록 설정 */
	overflow: hidden; /* 넘치는 텍스트를 숨김 */
	text-overflow: ellipsis; /* 넘치는 텍스트를 "..."로 표시 */
	text-align: center; /* 텍스트를 가운데 정렬 */
}

.mainsection {
	position: relative;
	/* width: 100%; */
	margin: 0 auto /* 수평 중앙 정렬 */
    overflow: hidden;
	height: 350px; /* 컨테이너 높이 */
	
	 margin-bottom: 70px; /* 이미지 아래 공간 추가 */
        text-align: center; /* 이미지를 가운데 정렬 */
        
    width: auto; 
    
     
}

.mainsection img#mainThumb {
	width: 75%;
	height: 125%;
	position: absolute;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}


.recipeinfo {
	margin-top: 50px;
	margin-bottom: 30px;
}

  .text-right {
        text-align: right;
        margin-top: 50px; /* 버튼과 이미지 사이의 공간 추가 */
    }

.detailTable{
	width:auto;
	height:100%;
}


.ingredients{
	margin: 0 auto;
	margin-top : 100px;
	margin-bottom : 100px;
}

.info-box {
    border: 5px solid lightgray; /* 테두리 색상 및 두께 */
    padding: 100px; /* 내부 여백 */
    margin-top: 50px; /* 상단 여백 */
    width: 1000px; /* 상자의 너비 */
    background-color: #f9f9f9; /* 배경 색상 */
    margin: 0 auto;
}

.info-box div {
    border-bottom: 1px solid #ccc; /* 각 섹션 하단의 선 */
    padding: 10px 0; /* 각 섹션의 상하 여백 */
    text-align: center; /* 텍스트 중앙 정렬 */
}


.step-container {
    margin-bottom: 30px; /* 각 스텝 사이의 공백 */
}

.step-container img {
    display: block;
    margin: 0 auto; /* 이미지 중앙 정렬 */
}

.step-container h2 {
    margin-top: 0; /* 제목 상단 여백 제거 */
    margin-bottom: 10px; /* 제목과 이미지 사이의 여백 */
}

.step-container p {
    margin-top: 10px; /* 이미지와 설명 사이의 여백 */
}

.step-divider {
    border: none; /* 기본 테두리 제거 */
    border-top: 5px solid green; /* 초록색 두꺼운 선 */
    margin: 20px 0; /* 상하 공백 조정 */
}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

$(function(){
   // detail.do?fno=2&type=1
   replyList(${param.fno})
   $('#writeBtn').on('click',function(){
      let msg=$('#msg').val()
      if(msg.trim()==="")
      {
         $('#msg').focus()
         return
      }
      let cno=$(this).attr("data-cno")
      
      $.ajax({
         type:'post',
         url:'../all_reply/reinsert.do',
         data:{"cno":cno,"type":3,"msg":msg},
         success:function(result)
         {
            if(result==='OK')
            {
               replyList(cno)
            }
            else
            {
               alert(result)
            }
         },
         error:function(request,status,error)
         {
            console.log(error)
         }
      })
   })
   
   /*  let bCheck=false;*/
       $('#jjimBtn').on('click',function(){
      let cno = $(this).attr("data-cno")
      // ajax이용 type=1

      $.ajax({
         type:'post',
         url:'../all_jjim/reinsert.do' ,
         data:{"cno":cno,"type":3} ,
         success:function(result){
            if(result==="OK"){
               $(this).attr("data-count",1);
               $(this).attr("class",'btn-xs btn-default')
               location.href="../recipe/detail.do?no="+cno+"&type=3"
            } else{
               alert(result)
            }
         } ,
         error:function(request,status,error)
         {
            console.log(error)
         }
      })
      
   }) 
})
// 삭제
function replyDelete(rno,cno)
{
   $.ajax({
      type:'post',
      url:'../all_reply/delete.do',
      data:{"rno":rno},
      success:function(result)
      {
         if(result==="OK")
         {
            replyList(cno)
         }
         else
         {
            alert(result)
         }
      },
      error:function(request,status,error)
      {
         console.log(error)
      }
   })
}
function replyUpdate(rno)
{
   $('.updates').hide()
   $('#m'+rno).show()
}
function replyUpdateData(rno,cno)
{
   let msg=$('#msg'+rno).val()
   if(msg.trim()==="")
   {
      $('#msg'+rno).focus()
      return
   }
   $.ajax({
      type:'post',
      url:'../all_reply/update.do',
      data:{"rno":rno,"msg":msg},
      success:function(result)
      {
         if(result==='OK')
         {
            replyList(cno)
            
         }
         else
         {
            alert(result)
         }
         $('#m'+rno).hide()
      },
      error:function(request,status,error)
      {
         console.log(error)
      }
   })
}
function replyList(cno)
 {
    $.ajax({
       type:'post',
       url:'../all_reply/list.do',
       data:{"cno":cno,"type":3},
       success:function(json)
       {
          json=JSON.parse(json)
          let html=''
          
          json.map(function(reply){
             //for(let reply of json){
                 html+='<table class="table">'
                html+='<tr>'
                html+='<td class="text-left">◑'+reply.name+'('+reply.dbday+')</td>'
                html+='<td class="text-right">'
                  if(reply.id===reply.sessionId)
                  {
                     html+='<span class="btn btn-xs btn-success ups" onclick="replyUpdate('+reply.rno+')">수정</span>&nbsp;' 
                     html+='<input type=button class="btn btn-xs btn-warning" value="삭제" onclick="replyDelete('+reply.rno+','+reply.cno+')">' 
                  }
                html+='</td>'
                html+='</tr>'
                html+='<tr>'
                html+='<td colspan="2">'
                html+='<pre style="white-space:pre-wrap;border:none;background:white">'+reply.msg+'</pre>'
                html+='</td>'
                html+='</tr>'
                 html+='<tr class="updates" id="m'+reply.rno+'" style="display:none">'
                 html+='<td>'
                 html+='<textarea rows="4" cols="70" id="msg'+reply.rno+'" style="float: left">'+reply.msg+'</textarea>'
                 html+='<input type=button value="댓글수정" onclick="replyUpdateData('+reply.rno+','+reply.cno+')" style="width: 100px;height: 85px;background-color: green;color:black">'
                 html+='</td>'
                 html+='</tr>'
                html+='</table>'
             //}
          })
          console.log(html)
          $('#reply').html(html)
          $('#msg').val("")
       },
       error:function(request,status,error)
       {
          console.log(error)
       }
    })
 }
</script>
</head>
<body>

	<!-- Header Start -->
	<div class="container-fluid bg-breadcrumb">
		<div class="container text-center py-5" style="max-width: 900px;">
			<h3 class="text-black display-3 mb-4">${revo.title }</h3>
			<h5 width="80%">${revo.subtitle }</h5>
			<ol class="breadcrumb justify-content-center mb-0">
			</ol>
		</div>
	</div>
	<!-- Header End -->


	<!-- 레시피 상세보기 -->
	<div class="container">
		<div class="mainsection">
			<img id="mainThumb" src="https://ottogi.okitchen.co.kr${revo.poster }" alt="mainThumb">
		</div>

		<table class="recipeinfo" style="width: 100%; text-align: center; ">
    <tr>
        <th width="20%">
            <div style="display: inline-block; text-align: center; width: 100px;">
                <img src="ready.png" style="width: 50px; height: auto;">
                <div>준비시간<br>${revo.info1}분</div>
            </div>
        </th>
        <th width="20%">
            <div style="display: inline-block; text-align: center; width: 100px;">
                <img src="time.png" style="width: 50px; height: auto;">
                <div>조리시간<br>${revo.info2 }분</div>
            </div>
        </th>
        <th width="20%">
            <div style="display: inline-block; text-align: center; width: 100px;">
                <img src="amount.png" style="width: 50px; height: auto;">
                <div>인분수<br>${revo.info3 }인분</div>
            </div>
        </th>
    </tr>
</table>

<table class="table" style="width: 100%; text-align: center;">
		<tr >
			<td colspan="3" class="text-right">
			<c:if test="${sessionScope.id!=null }">
						<a href="#" class="btn btn-xs btn-success">좋아요</a>
						
				<c:if test="${check==false }">
						<input type=button class="btn btn-xs btn-success" value="찜하기" id="jjimBtn" data-cno="${revo.no }">
				</c:if>
				
				<c:if test="${check==true }">
						<span class="btn btn-xs btn-default">찜하기</span>
				</c:if>
			</c:if> 
				<input type="button" class="btn btn-xs btn-success" value="목록"
				onclick="javascript:history.back()"></td>
		</tr>
	</div>
	</table>


<div>
  <table class="ingredients">
    <tr>
      <td colspan="2" class="text-center"><h2>필요한 재료</h2></td>
    </tr>
    <tr>
      <td class="text-center">${revo.ingredients }</td>
    </tr>
  </table>
</div>



<div class="info-box">
  <div class="detailTable">
    <!-- Step 1 -->
    <h2>Step 1</h2>
    <img src="https://ottogi.okitchen.co.kr${revo.detail_poster1}" style="width: 100%; height: auto;">
    <p>${revo.detail_content2}</p>
  </div>

  <div class="step-container">
    <!-- Step 2 -->
    <h2>Step 2</h2>
    <img src="https://ottogi.okitchen.co.kr${revo.detail_poster2}" style="width: 100%; height: auto;">
    <p>${revo.detail_content4}</p>
  </div>

  <div class="step-container">
    <!-- Step 3 -->
    <h2>Step 3</h2>
    <img src="https://ottogi.okitchen.co.kr${revo.detail_poster3}" style="width: 100%; height: auto;">
    <p>${revo.detail_content6}</p>
  </div>

  <div class="step-container">
    <!-- Step 4 -->
    <h2>Step 4</h2>
    <img src="https://ottogi.okitchen.co.kr${revo.detail_poster4}" style="width: 100%; height: auto;">
    <p>${revo.detail_content8}</p>
  </div>

  <div class="step-container">
    <!-- Step 5 -->
    <h2>Step 5</h2>
    <img src="https://ottogi.okitchen.co.kr${revo.detail_poster5}" style="width: 100%; height: auto;">
    <p>${revo.detail_content10}</p>
    <!-- 마지막 스텝이라 hr을 생략할 수도 있습니다 -->
    <!-- <hr class="step-divider"> -->
  </div>
</div>




	<div style="height: 10px"></div>
	<div id="map" style="width: 100%; height: 350px;"></div>
	<h2 class="sectiontitle">댓글</h2>
	<table class="table" id="reply_table">
		<tbody>
			<tr>
				<td id="reply"></td>
			</tr>
		</tbody>
	</table>
	<c:if test="${sessionScope.id!=null }">
		<table class="table" style="width:100%;">
			<tr>
				<td style="padding:0;">
				<textarea rows="4" id="msg" style="width:calc(100% - 110px); height: 85px; float: left;"></textarea>
					<input type=button value="댓글쓰기"
					style="width: 100px; height: 85px; background-color: green; color: black float: left; margin-left: 10px;"
					id="writeBtn" data-cno="${revo.no }"></td>
			</tr>
		</table>
	</c:if>
	<div style="height: 20px"></div>













	<div class="container-fluid packages py-5">
		<div class="container py-5 ">

			<div class="mx-auto text-center mb-5" style="max-width: 900px;">
				<h5 class="section-title px-3">Recipe</h5>
				<h1 class="mb-0">추천 레시피</h1>
			</div>


			<div class="packages-carousel owl-carousel">

				<c:forEach var="revo" items="${reList }" varStatus="s">
					<div class="packages-item">
						<div class="packages-img">
							<img src="https://ottogi.okitchen.co.kr${revo.poster}" class="img-fluid w-10  rounded-top"
								alt="${revo.title}" title="${revo.title}"></a>

							<div
								class="packages-info d-flex border border-start-0 border-end-0 position-absolute pb-1"
								style="width: 100%; bottom: 0; left: 0; z-index: 5;">
								<i class="text-white fa flex-fill text-center border-end  text-decoration-none">
								<img src="pointer.png" style="width: 30px; height: auto; display: inline;">${revo.hit }</i>
								<!-- 밑에 얇은줄 -->
							</div>
							<div class="text-center packages-price">${revo.info3 }인분</div>
							<!-- 매퍼에서 연결해야함~ -->
						</div>
						<div class="packages-content bg-light">
							<div class="p-4 pb-1">
						
								<!-- 회색박스 -->
								<a href="../recipe/detail_before.do?no=${revo.no}&type=3">
									<h5 class="mb-0 text-center">${revo.title}</h5>
								</a>
								<p class="mb-4"></p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>


</body>
</html>






























