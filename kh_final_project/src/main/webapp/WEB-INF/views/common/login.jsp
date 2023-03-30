<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 페이지</title>
	
</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div class="wrap">
<div class="title">login</div>
	 <form action="kakaologin" method="post">
			<input type="text" name="username" placeholder="Username"/><br>
			<input type="password" name="password" placeholder="Password"/><br>
		<button class="btn btn-primary py-3 px-5 me-3 animated fadeIn login">로그인</button>
	</form>

	    <a class="kakao" href="https://kauth.kakao.com/oauth/authorize?client_id=77dfb2057fb10018f5dbf8b933cc96dd&redirect_uri=http://localhost:8090/job/common/login
	&response_type=code">
	
		
		
	
      	<div class="kakao_i"></div>
      	<div class="kakao_txt">카카오톡으로 간편로그인 </div>
   	</a>
</div>
</body>
</html>