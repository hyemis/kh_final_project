<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실행 확인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
	<form action="">
	<div class="mb-3">
           <label for="userBirth">생년월일</label>
           <input type="date" class="form-control userBirth2" name="userBirth2" placeholder="YYYYMMDD" required>
           <div class="invalid-feedback">생년월일을 입력해주세요.</div>
         </div>
         <button type="button" class="test">asdf</button>
	</form>
	
	
	<script type="text/javascript">
    
    $('.test').on('click', function() {
    	alert($(".userBirth2").val());
    	
		$.ajax({ 
			url: "${pageContext.request.contextPath}/temp/list"
			, type: "post"
			, data:  {userBirth2 : $(".userBirth2").val()}
			, success: function(result){
				if(result == 1){
					
				}else{
					
				}
			}
			, error: function(e){
				alert(e +" : 오류")
			}
		}); 
    	
    });
	</script>
</body>
</html>