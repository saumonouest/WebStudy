<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Product Detail - Travela</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">

var IMP = window.IMP; 
IMP.init("imp68206770"); 
function requestPay(json,name,price) {
    IMP.request_pay({
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: "ORD20180131-0000011",   // 주문번호
        name: name,
        amount: price, // 숫자 타입
        buyer_email: json.email,
        buyer_name: json.name,
        buyer_tel: json.phone,
        buyer_addr: json.address,
        buyer_postcode: json.post
    }, function (rsp) { // callback
    	location.href='http://localhost/TJCamping/mypage/mypage_main.do' 
    });
}

$(function(){
	$('#buy').click(function(){
	   if(sel===0)
		{
			alert("수량을 선택하세요")
			return
		}
		
		let gno=$('#gno').val()
		let price = $('#price').val()	
		price = price.replace(/[^0-9]/g, '')
		let account = $('#account').val();	
		price=Number(price) * Number(account)
		let name=$('.product-name').text()
	
		$.ajax({
			type:'post',
			url:'../campgoods/buy_insert.do',
			data:{"gno":gno,"price": price,"account": account},
			success:function(result)
			{
				console.log(result)
				let json=JSON.parse(result)
			    console.log(json)
				requestPay(json,name,price)
			}
		})
	})
})
$(function() {
    // 버튼 클릭 이벤트 처리
    $('#jjimBtn').on('click', function() {
        let button = $(this);
        let cno = button.attr("data-cno");

        button.addClass('clicked');  // 'clicked' 클래스 추가
        button.val("찜하기");  // 버튼 텍스트 변경

        $.ajax({
            type: 'post',
            url: '../all_jjim/cinsert.do',
            data: { "cno": cno, "type": 2, "gno": 1 },
            success: function(result) {
                if (result === 'OK') {
                    button.attr("data-count", 1); // 데이터 속성 업데이트
                } else {
                    alert(result); // 에러 메시지 출력
                }
            },
            error: function(request, status, error) {
                console.log(error); // 에러 로그 출력
            }
        })
    });

    // 페이지 로드 시 버튼 상태 확인
    let cno = $('#jjimBtn').attr("data-cno");

    $.ajax({
        type: 'get',
        url: '../all_jjim/status.do', // 찜 상태를 가져오는 URL
        data: { "cno": cno },
        success: function(result) {
            if (result === 'OK') {
                $('#jjimBtn').addClass('clicked');  // 찜 상태가 확인되면 'clicked' 클래스 추가
                $('#jjimBtn').val("찜하기"); // 버튼 텍스트 변경
            }
        },
        error: function(request, status, error) {
            console.log(error); // 에러 로그 출력
        }
    })
	
    $('#sel').change(function() {
        let account = $('#sel').val();
        console.log('Selected quantity:', account)

        if (account === '수량선택') {
            alert("수량을 선택하세요")
            return;
        }

        let price = $('#sel').attr("data-price")
        console.log('Price from data-price:', price)

        price = price.replace(/[^0-9]/g, '')
        console.log('Price after removing non-numeric characters:', price)

        let total = Number(price) * Number(account)
        console.log('Calculated total:', total)
        $('#total').text(total.toLocaleString() + "원")
        $('#account').val(account)
    })
	
	$('#cart').click(function(){
		$.ajax({
			   type: "post",
			   url: "../campgoods/cart_insert.do",
			   data: {
			      "gno": $('#gno').val(),
			      "account": $('#account').val(),
			      "price": $('#price').val()
			   },
			   success: function(response) {
			      //alert("장바구니에 추가되었습니다.")
			       location.href="../mypage/mypage_cart.do"; 
			   },
			   error: function() {
			      alert("장바구니에 추가하는데 실패했습니다.")
			   }
			});
	}) 
})
</script>
<style>
.bg-breadcrumb {
    position: relative;
    background-image: url('white.jpg');
    background-size: cover;
    background-position: center;
}
.bg-breadcrumb::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 49%;
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 1;
}
.btn-custom {
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 25px;
    padding: 10px 20px;
    font-size: 16px;
    transition: background-color 0.3s, transform 0.3s;
}
.btn-custom.clicked {
    background-color: #a9a9a9;
    color: #fff;
}
.btn-custom:hover {
    background-color: #0056b3;
    transform: scale(1.05);
}
.btn-custom:active {
    background-color: #004080;
    transform: scale(1);
}
.btn-group {
    margin-right: 10px;
}
.section-image-container {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}
.section-image-container img {
    max-width: 80%;
    height: auto;
    margin-top: 70px;
    margin-bottom: 70px;
}
.product-image-container {
    text-align: center;
    margin-top: 20px;
    margin-bottom: 20px;
    transform: translateX(-10px);
}
.product-image-container img {
    width: 100%; 
    max-width: 500px; 
    height: auto; 
    display: inline-block; /
    
}
.poster-img {
    border: 1px solid #ddd;
    border-radius: 8px;
    max-width: 100%;
    height: auto;
}
.product-info-container {
    padding: 40px;
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.01);
    transform: translateX(-60px);
    transform: translateY(10px);
}
.product-name {
    font-size: 24px;
    margin-bottom: 20px;
}
.product-info {
    font-size: 16px;
    color: #333;
}
.table th {
    font-weight: bold;
}
.table td {
    padding: 8px 0;
}
.btn-custom {
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 25px;
    transition: background-color 0.3s, transform 0.3s;
}
.btn-cart {
    background-color: rgb(37, 103, 75);
    color: #fff;
}
.btn-cart:hover {
    background-color: rgb(30, 83, 60);
}
.btn-wishlist {
    background-color: rgb(37, 103, 75);
    color: #fff;
}
.btn-wishlist.clicked {
    background-color: rgb(170, 170, 170);
    color: #fff; 
}
.btn-wishlist:hover {
    background-color: rgb(30, 83, 60);
}
.btn-buy {
    background-color: rgb(37, 103, 75);
    color: #fff;
}
.btn-buy:hover {
    background-color: rgb(30, 83, 60);
}
.btn-back {
    background-color: rgb(37, 103, 75);
    color: #fff;
}
.btn-back:hover {
    background-color: rgb(30, 83, 60);
}
.packages-item {
    border: 1px solid #ddd; 
    border-radius: 12px;
    overflow: hidden; 
}
</style>
</head>
<body>
<!-- Header Start -->
<div class="container-fluid bg-breadcrumb">
    <div class="container text-center" style="max-width: 900px;">
        <ol class="breadcrumb justify-content-center mb-0"></ol>
    </div>
</div>
<!-- Header End -->
<hr style="border-top: 1px solid #999; width: 70%; margin: 0px auto;">
<!-- Product Details Start -->
<div class="container product-details mt-5">
    <main class="row">
        <div class="col-md-6">
            <div class="product-image-container">
                <img src="${vo.poster}" alt="${vo.name}" class="img-fluid poster-img">
            </div>
        </div>
        <div class="col-md-6">
            <div class="product-info-container">
                <h3 class="product-name">${vo.name}</h3>
                <table class="table table-borderless product-info">
                    <tbody>
                        <tr>
                            <th class="text-right">제조사</th>
                            <td>${vo.brand}</td>
                        </tr>
                        <tr>
                            <th class="text-right">제조국</th>
                            <td>${vo.origin}</td>
                        </tr>
                        <tr>
                            <th class="text-right">소비자가</th>
                            <td class="text-decoration-line-through">${vo.price}</td>
                        </tr>
                        <tr>
                            <th class="text-right">판매가</th>
                            <td class="text-primary fw-bold">${vo.saleprice}</td>
                        </tr>
                        <tr>
                            <th class="text-right">배송비</th>
                            <td>${vo.delivery}</td>
                        </tr>
                        <tr>
						    <td colspan="2">
						        <select id="sel" data-price="${vo.price}" style="width: 75%; padding: 10px; margin-left: auto;">
								    <option>수량선택</option>
								    <c:forEach var="i" begin="1" end="10">
								        <option>${i}</option>
								    </c:forEach>
								</select>
						    </td>
						</tr>
						<tr>
						    <td colspan="2" style="text-align: right; padding-right: 25%;">
						        총 금액: 
						        <span id="total" style="font-size: 1.5em; font-weight: bold;">
						            ${vo.saleprice}
						        </span>
						    </td>
						</tr>
                    </tbody>
                </table>
                <div class="d-flex flex-wrap justify-content-start mt-3">
                    <c:if test="${sessionScope.id != null}">
                     <!-- <form method="post" action="../campgoods/cart_insert.do"> -->
				        <input type="hidden" name="gno" value="${vo.cno}" id="gno">
				        <input type="hidden" name="price" value="${vo.price}" id="price">
				        <input type="hidden" name="account" value="1" id="account">
				        <input type="submit" class="btn btn-cart btn-custom mx-2 mb-2" value="장바구니" id="cart">
				      <!-- </form> -->
                        <c:if test="${check == false}">
                            <input type="button" class="btn btn-wishlist btn-custom mx-2 mb-2" value="찜하기" 
                            id="jjimBtn" data-cno="${vo.cno}">
                        </c:if>
                        <c:if test="${check == true}">
                            <span class="btn btn-wishlist btn-custom mx-2 mb-2 clicked">찜하기</span>
                        </c:if>
                        <!-- <a href="#" class="btn btn-buy btn-custom mx-2 mb-2" >구매하기</a> -->
                        <input type="submit" class="btn btn-buy btn-custom mx-2 mb-2" value="구매하기" id="buy">
                    </c:if>
                    <input type="button" class="btn btn-back btn-custom mx-2 mb-2" value="목록" onclick="javascript:history.back()">
                </div>
            </div>
        </div>
    </main>
</div>


<hr style="border-top: 1px solid #999; width: 70%; margin: 50px auto;">


<section class="mt-4">
    <h5></h5>
    <div class="section-image-container">
        <img src="${vo.detail_poster}" alt="Detailed View" class="img-fluid">
    </div>
</section>


<!-- 추천상품 Start -->
<div class="container-fluid packages py-5">
    <div class="container py-5">
        <div class="mx-auto text-center mb-5" style="max-width: 900px;">
            <h2 class="section-title px-3" style="color: black;">인기상품</h2>
        </div>

        <div class="packages-carousel owl-carousel">
            <c:forEach var="vo" items="${gList}" varStatus="s">
                <div class="packages-item">
                    <div class="packages-img" style="background-color: white; display: flex; justify-content: center; align-items: center; height: 300px; width: 100%;">
					    <img src="${vo.poster}" style="max-height: 100%; max-width: 100%; object-fit: contain;" class="img-fluid w-100 rounded-top" alt="Image">
					    <div class="packages-info d-flex border border-start-0 border-end-0 position-absolute" style="width: 100%; bottom: 0; left: 0; z-index: 5;">
					        <!-- <a href="#" class="flex-fill text-center border-end py-2 text-decoration-none" style="color: #ffffff;">
					            <i class="fa fa-shopping-cart me-2"></i>장바구니
					        </a> -->
					        <a href="../campgoods/detail.do?cno=${vo.cno}&gno=1" class="flex-fill text-center border-end py-2 text-decoration-none" style="color: #ffffff;">
					            <i class="fa fa-search me-2"></i>상세보기
					        </a>
					    </div>
					    <!--<div class="text-center packages-price py-2 px-4">Best</div>-->
					</div>
					
	              <div class="packages-content bg-light">
	                  <div class="p-4 pb-0">
	                      <h5 class="mb-0 truncate-text" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
	                       ${vo.name}</h5>
	                      <small class="text-uppercase truncate-text">
	                          <c:choose>
	                              <c:when test="${vo.type1 == 1}">
	                                  에어매트
	                              </c:when>
	                              <c:when test="${vo.type1 == 2}">
	                                  텐트
	                              </c:when>
	                              <c:when test="${vo.type1 == 3}">
	                                  등산용품
	                              </c:when>
	                              <c:when test="${vo.type1 == 4}">
	                                  의자
	                              </c:when>
	                              <c:when test="${vo.type1 == 5}">
	                                  바베큐
	                              </c:when>
	                              <c:when test="${vo.type1 == 6}">
	                                  랜턴/버너
	                              </c:when>
	                              <c:otherwise>
	                                  기타
	                              </c:otherwise>
	                          </c:choose>
	                      </small>
	                      <p class="mb-4"></p>
	                  </div>
	                  <div class="row bg-primary rounded-bottom mx-0">
	                      <div class="col-6 text-start px-0">
	                           <a href="#" class="btn-hover btn text-white py-2 px-4"><i class="fa fa-heart me-2"></i>${vo.jjimcount}</a>
	                      </div>
	                      <div class="col-6 text-end px-0">
	                          <a href="#" class="btn-hover btn text-white py-2 px-4">${vo.price}</a>
	                      </div>
	                  </div>
	              </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<!-- 추천상품 End -->
</body>
</html>
