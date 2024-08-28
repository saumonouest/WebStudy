<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<style type="text/css">

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script type="text/javascript">

let websocket;
//서버연결 
function connection(){
	// 소켓연결 
	websocket=new WebSocket("ws://localhost/TJCamping/chat/chat-ws")
	websocket.onopen=onOpen
	websocket.onclose=onClose
	websocket.onmessage=onMessage
}
//연결처리 => Callback 
function onOpen(event){
	alert("1대1 상담을 시작합니다. 해당 창을 나갈 경우 상담이 자동으로 종료됩니다.")
}	
function onClose(event){
	alert("1대1 상담을 종료합니다.")
}
function onMessage(event){
	let data=event.data // 전송된 데이터 
	 
	if(data.substring(0,3)==="my:") // oto , makeroom  ==> 100 200 300...
	// msg:[이름] 메세지
	{
	 appendMyMessage(data.substring(3))
	}
	if(data.substring(0,4)==="you:"){ // oto , makeroom  ==> 100 200 300...
	 // msg:[이름] 메세지
		appendYouMessage(data.substring(4))
	}
	if(data.substring(0,4)==="msg:"){ // oto , makeroom  ==> 100 200 300...
	// msg:[이름] 메세지
		appendMsgMessage(data.substring(4))
	}
}
function disConnection(){
	websocket.close()
}
//퇴장처리 => Callback
//메세지 전송 => Callback
function appendMsgMessage(msg){
	 $('#recvMsg').append("<font color=red>"+msg+"</font><br>")
	 let ch=$('#chatArea').height()
	 let m=$('#recvMsg').height()-ch
	 $('#chatArea').scrollTop(m)
}
function appendMyMessage(msg){
	 $('#recvMsg').append("<font color=blue>"+msg+"</font><br>")
	 let ch=$('#chatArea').height()
	 let m=$('#recvMsg').height()-ch
	 $('#chatArea').scrollTop(m)
}
function appendYouMessage(msg){
	 $('#recvMsg').append("<font color=white>"+msg+"<br>")
	 let ch=$('#chatArea').height()
	 let m=$('#recvMsg').height()-ch
	 $('#chatArea').scrollTop(m)
}
function send(){	
	let msg=$('#sendMsg').val()
	if(msg.trim()===""){
		$('#sendMsg').focus()
		return 
	}
	
	websocket.send(msg)
	$('#sendMsg').val("")
	$('#sendMsg').focus()
}

$(function(){
	$('#inputBtn').click(function(){
		connection() 
	})
	$('#outputBtn').click(function(){
		disConnection()
		location.href="../main/main.do"
	})
	$('#sendBtn').click(function(){
		send()
	})
	$('#sendMsg').keydown(function(key){
		if(key.keyCode===13)
		{
			send()
		}
	})
})

//로그인 
$(function(){
	$('#logBtn1').on('click',function(){
		let id1=$('#id1').val()
		if(id1.trim()===""){
			$('#id1').focus()
			return
		}
		let pwd1=$('#pwd1').val()
		if(pwd1.trim()===""){
			$('#pwd1').focus()
			return
		}
		
		$.ajax({
			type:'post',
			url:'../member/login.do',
			// ?id=aaa&pwd=1234
			data:{"id1":id,"pwd1":pwd},
			success:function(result){

				if(result==='NOid'){
					alert("아이디가 존재하지 않습니다!!")
					$('#id1').val("")
					$('#pwd1').val("")
					$('#id1').focus()
				}
				else if(result==='NOpwd'){
					alert("비밀번호가 틀립니다!!")
					$('#pwd1').val("")
					$('#pwd1').focus()
				}
				else{
					location.href="../chat/chat.do"
				}
			},
			error:function(request,status,error){
				console.log("code:"+request.status)
				// 404 , 500 
				console.log("message:"+request.responseText)
				console.log("error:"+error)
			}
		})
	})
})


</script>
</head>
<body>
	<!-- header start -->
	<div class="ccontainer-fluid bg-breadcrumb">
		<div class="container text-center py-5" style="max-width: 900px;">
		<h1 class="display-3 mb-4" style="color: red;">실시간 채팅</h1>
		</div>
	</div>
	<!-- header end -->
	
	<!-- board start css -->
	<div class="container-fluid booking py-3">
		<div class="container py-3">
			<div class="row1">
				<table class="table">
				<c:if test="${sessionScope.id!=null }">
					<tr>
						<td class="inline">
						<!-- 이름:<input type=text id="name" size=15 class="input-sm"> -->
							<input type=button value="채팅 시작" class="btn-danger btn-sm" id="inputBtn">
							<input type=button value="나가기" class="btn-success btn-sm" id="outputBtn">
						</td>
					</tr>
					<tr>
						<td>
							<div id="chatArea">
							<div id="recvMsg"></div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="inline">
					 		<input type=text id="sendMsg" size=80 class="input-sm">
							<input type=button id="sendBtn" value="전송" class="btn-sm btn-primary">
						</td>
					</tr>
				</c:if>
				<c:if test="${sessionScope.id==null }">
					<tr>
						<td style="text-align: center; color: white; font-size: 25px; font: bold;">
							로그인해야 이용 가능한 메뉴입니다
						</td>
					</tr>
					
					<tr>
						<td>
							<ul style="text-align: center;">
								<li style="display: inline-block;"><input size="15" style="margin-top:17px" type="text" id="id1" class="input-sm" placeholder="아이디" required></li>
						        <li style="display: inline-block;"><input size="15" type="password" id="pwd1" class="input-sm" placeholder="비밀 번호" required></li>
						        <li style="display: inline-block;"><input type="button" id="logBtn1" class="btn btn-sm btn-primary" value="로그인">&nbsp;&nbsp;</li>
				      		</ul>
						</td>
					</tr>
					
				</c:if>
				</table>
			</div>
		</div>
	</div>
</body>
</html>