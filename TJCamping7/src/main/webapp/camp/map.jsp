<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title></title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600&family=Roboto&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        
        
     <!-- 
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
      -->   
        
        
        
        
        
        
        <style>
        .bg-breadcrumb {
    background-image: url('camp_map.jpg');
}
.pagination {
  display: flex;
  justify-content: center;
  margin: 20px 0;
}

.pagination ul {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
}

.pagination li {
  margin: 0 5px;
}

.pagination a {
  display: block;
  padding: 10px 15px;
  border: 1px solid #ddd;
  background-color: #f9f9f9;
  color: #333;
  text-decoration: none;
  border-radius: 4px;
}

.pagination a:hover {
  background-color: #007bff;
  color: white;
}

.pagination .current a {
  background-color: #007bff;
  color: white;
  border: 1px solid #007bff;
}
#aTr {
            display: none;
        }
.sub-buttons {
            margin-top: 10px;
        }
        .sub-buttons button {
            margin-right: 10px;
        }
        </style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
/*
$(function(){
	let bCheck = true;
    $('#aBtn').on('click', function(){
        if (bCheck) {
            bCheck = false;
            $('#aTr').show("fast");  // #aTr 요소를 빠르게 보이게 함
        } else {
            bCheck = true;
            $('#aTr').hide("fast");   // #aTr 요소를 빠르게 숨김
        }
        
        $.ajax({
			type:'post',
			url:'../board/delete.do',
			data:{"no":no,"pwd":pwd},
			success:function(result)
			{
				if(result==='yes')
				{
					// 비밀 번호가 맞는 경우
					location.href="../board/list.do"
				}
				else
				{
					// 비밀 번호가 틀린 경우
					alert("비밀 번호가 틀립니다")
					$('#del_pwd').val("")
					$('#del_pwd').focus()
				}
			},
			error:function(request,status,error)
			{
				console.log(error)
			}
		})
    });
});
*/
*
/*	$('#deleteBtn').click(function(){
		let pwd=$('#del_pwd').val()
		if(pwd.trim()==="")
		{
			$('#del_pwd').focus()
			return
		}
		let no=$('.del_no').text()
		$.ajax({
			type:'post',
			url:'../board/delete.do',
			data:{"no":no,"pwd":pwd},
			success:function(result)
			{
				if(result==='yes')
				{
					// 비밀 번호가 맞는 경우
					location.href="../board/list.do"
				}
				else
				{
					// 비밀 번호가 틀린 경우
					alert("비밀 번호가 틀립니다")
					$('#del_pwd').val("")
					$('#del_pwd').focus()
				}
			},
			error:function(request,status,error)
			{
				console.log(error)
			}
		})
	}) */
})
</script>

    </head>

    <body>

        

      

        

        <!-- Header Start -->
        <div class="container-fluid bg-breadcrumb">
            <div class="container text-center py-5" style="max-width: 900px;">
                <h3 class="text-white display-3 mb-4">지역별 캠핑장</h3>
                <ol class="breadcrumb justify-content-center mb-0">
                </ol>    
            </div>
        </div>
        <!-- Header End -->

        <!-- Explore Tour Start -->
        

                
        
        <div class="container-fluid destination py-5">
		<div class="container py-5">
		
		<!-- 여기다가 검색 기능 넣으세요^^ -->
	
		
	
<div class="tab-class text-center">

<div class="wrapper row3 reserve_row">
  <main class="container clear">
    <table class="table">
      <tr>
        <td class="text-center">
          <span class="btn btn-lg btn-success rebtn" data-no="1">경기</span> 
          <span class="btn btn-lg btn-info rebtn" data-no="2">충북</span> 
          <span class="btn btn-lg btn-primary rebtn" data-no="3">충남</span> 
        </td>
      </tr>
    </table>
    <div id="menu">
     
    </div>
    <div id="recommand">
      
    </div>
  </main>
</div>


<div class="container text-center mt-5">
    <ul class="nav nav-pills d-inline-flex justify-content-center mb-5">
        <li class="nav-item">
            <a class="d-flex mx-3 py-2 border border-primary bg-light rounded-pill" data-bs-toggle="pill" href="${aList }">
                <span class="text-dark" style="width: 150px;">전국</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="d-flex mx-3 py-2 border border-primary bg-light rounded-pill" data-bs-toggle="pill" href="#tab-2" id="btn-gyeonggi">
                <span class="text-dark" style="width: 150px;">경기</span>
            </a>
        </li> 
        <li class="nav-item">
            <a class="d-flex mx-3 py-2 border border-primary bg-light rounded-pill" data-bs-toggle="pill" href="#tab-3" id="btn-chungbuk">
                <span class="text-dark" style="width: 150px;">충북</span>
            </a>
        </li> 
        <li class="nav-item">
            <a class="d-flex mx-3 py-2 border border-primary bg-light rounded-pill" data-bs-toggle="pill" href="#tab-4" id="btn-chungnam">
                <span class="text-dark" style="width: 150px;">충남</span>
            </a>
        </li>
        
     
        
    </ul>

    
    <div id="sub-button-container" class="sub-buttons"></div>
</div>


<script>

    document.addEventListener('DOMContentLoaded', function() {
        // Elements
        const gyeonggiBtn = document.getElementById('btn-gyeonggi');
        const chungbukBtn = document.getElementById('btn-chungbuk');
        const chungnamBtn = document.getElementById('btn-chungnam');
        const subButtonContainer = document.getElementById('sub-button-container');

        // Button configurations
        const subButtons = {
            gyeonggi: ['의정부','안양','평택','동두천','안산','고양','남양주','오산','용인','파주','안성','김포','화성','광주','양주','포천','여주','연천','가평','양평'],
            chungbuk: ['청주','충주','제천','보은','옥천','영동','진천','음성','괴산','단양','증평'],
            chungnam: ['천안','아산','서산','당진','공주','보령','논산','홍성','예산','부여','서천','청양','태안','금산']
        };

        // Event listeners
        gyeonggiBtn.addEventListener('click', function() {
            displaySubButtons(subButtons.gyeonggi);
        });

        chungbukBtn.addEventListener('click', function() {
            displaySubButtons(subButtons.chungbuk);
        });

        chungnamBtn.addEventListener('click', function() {
            displaySubButtons(subButtons.chungnam);
        });

        // Function to display sub-buttons
        function displaySubButtons(buttons) {
            // Clear the existing buttons
            subButtonContainer.innerHTML = '';

            // Add new buttons
            buttons.forEach(function(name) {
                const button = document.createElement('button');
                button.className = 'btn btn-primary btn-sm';
                button.textContent = name;
                subButtonContainer.appendChild(button);
            });
        }
    });


$(function(){
	$('.rebtn').click(function(){
		let no=$(this).attr("data-no");
		$.ajax({
			type:'post',
			url:'../camp/sub_menu.do',
			data:{"no":no},
			success:function(result)
			{
				$('#menu').html(result);
			}
		})
	})
})
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>



</div>
		
		<!-- 검색 기능 End -->
		

<div style="height:70px"></div>

			<div class="tab-class text-center">
				<div class="tab-content">
					<div id="tab-1" class="tab-pane fade show p-0 active">
						
							<div class="flexslider carousel basiccarousel btmspace-80"> <!-- col-xl-8 -->
							<div class="slides"><!-- <div class="row g-4"> -->
					<div class="row g-4">
								<c:forEach var="vo" items="${list }">
									<div class="col-lg-3">
										<div class="destination-img">
										<!-- class="img-fluid rounded w-100" -->
											<img class="rounded w-100" style="width:300px;height:240px;object-fit:cover"
												src="${vo.image1 }" alt="${vo.camp_name}">
											<div class="destination-overlay p-4">
												<h4 class="mb-2 mt-3"
								  style="color:white;background-color:rgb(37,105,73);font-size:23px;font-family:'휴먼모음T'">
												  ${vo.camp_name }</h4>
												<a href="../camp/detail.do?camp_no=${vo.camp_no }"
			class="btn-hover" style="color:white;background-color:rgb(37,105,73);font-size:15px;font-family:'휴먼모음T'">자세히 보기
													<i class="fa fa-arrow-right ms-2"></i>
												</a>
											</div>
											</div>
											</div>
										</c:forEach>
										</div>
									
									</div>
							
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>

        <div class="wrapper row3">
	  <main class="container clear"> 
<nav class="pagination">
        <ul>
        <c:if test="${startPage>1 }">
          <a href="../camp/list.do?page=${startPage-1 }">&laquo; 이전</a>
        </c:if>
        <c:forEach var="i" begin="${startPage }" end="${endPage }">
          <li ${curpage==i?"class=current":"" }><a href="../camp/list.do?page=${i }">${i }</a></li>
        </c:forEach>
        <c:if test="${endPage<totalpage }">
          <a href="../camp/list.do?page=${endPage+1 }">다음 &raquo;</a>
        </c:if>
        </ul>
      </nav>
      </main>
      </div>
      
      <div style="height:30px"></div>
        
        
        <!-- Copyright Start -->
        <div class="container-fluid copyright text-body py-4">
            <div class="container">
                <div class="row g-4 align-items-center">
                    <div class="col-md-6 text-center text-md-end mb-md-0">
                        <i class="fas fa-copyright me-2"></i><a class="text-white" href="#">Your Site Name</a>, All right reserved.
                    </div>
                    <div class="col-md-6 text-center text-md-start">
                        <!--/*** This template is free as long as you keep the below author’s credit link/attribution link/backlink. ***/-->
                        <!--/*** If you'd like to use the template without the below author’s credit link/attribution link/backlink, ***/-->
                        <!--/*** you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". ***/-->
                        Designed By <a class="text-white" href="https://htmlcodex.com">HTML Codex</a> Distributed By <a href="https://themewagon.com">ThemeWagon</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Copyright End -->

        <!-- Back to Top -->
        <a href="#" class="btn btn-primary btn-primary-outline-0 btn-md-square back-to-top"><i class="fa fa-arrow-up"></i></a>   

        
        <!-- JavaScript Libraries -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/lightbox/js/lightbox.min.js"></script>
        

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        
        
        
    </body>

</html>