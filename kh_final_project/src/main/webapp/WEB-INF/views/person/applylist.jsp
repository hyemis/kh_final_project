<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB-A 입사지원현황</title>

	<style>
	  th.center {
	    text-align: center;
	  }
	</style>
	
</head>
<body>
	<!-- header : css, js, boostrap, nav-bar, template 등  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->
	<div class="container-sm">	
          <div class="text-start mx-5 mt-5">
            <h1>입사지원 현황</h1><br>
            <p>
           	열람한 이력서는 입사지원 취소가 불가능합니다.
          </p>

					<div class="bg-light rounded p-3">
						<div class="bg-white rounded p-4"
							style="border: 1px dashed rgba(0, 185, 142, .3)">
							<div class="row g-5 align-items-center">
								<div class="mb-4">

	
									<table class="table table-hover">
										<thead>
										   <tr>
											 <th scope="col" class="center">지원일</th>
										     <th scope="col" class="center">회사명</th>
										     <th scope="col" class="center">공고명</th>
										     <th scope="col" class="center">열람상태</th>
										   </tr>
										 </thead>
										  <tbody class="table-group-divider">
										 
											   

										   
										      
							
										  </tbody>
										</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	
	
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


		<script>
			
			// alret
			var msg = "${msg}";
			if(msg) {
				alert(msg);
			}

		</script>
</body>
</html>