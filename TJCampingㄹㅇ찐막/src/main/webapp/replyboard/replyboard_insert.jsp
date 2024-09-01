<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid whitezzz "style="height:100px;"></div>
		<div class="container text-center py-5" style="max-width: 200px; ">
			<div class="mx-auto text-center mb-5" style="max-width: 200px;">
				<h5 class="section-title py-12"></h5>
				<h1 class="mb-0 " >QnA</h1>
			</div>
		</div>
<div class="wrapper row3">
  <main class="container clear">
   <h2 class="sectiontitle">등록하기</h2>
   <form method=post action="../replyboard/insert_ok.do">
   <table class="table">
    <tr>
      <th width=20% class="text-center">제목</th>
      <td width=80%>
       <input type=text name=subject class="input-sm" size=50>
      </td>
    </tr>
    <tr>
      <th width=20% class="text-center">내용</th>
      <td width=80%>
       <textarea rows="10" cols="50" name="content"></textarea>
      </td>
    </tr>
    <tr>
     <td colspan="2" class="text-center inline">
       <button class="btn-sm btn-danger">등록</button>
       <input type=button value="취소" class="btn-sm btn-warning"
        onclick="javascript:history.back()">
     </td>
    </tr>
   </table>
   </form>
  </main>
</div>
</body>
</html>