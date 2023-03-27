<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOB-A 회원탈퇴</title>
</head>
<body>
	<!-- header : css, js, boostrap, nav-bar, template 등  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- 영역 잡기 위해서 컨테이너 안에 내용 넣어주세요. -->
	<div class="container-sm">	
          <div class="text-start mx-5 mt-5">
            <h1>회원 탈퇴</h1><br>
            <p>
           	＊JOB-A에서는 다양한 맞춤서비스들을 제공하고 있습니다.<br>
                        ＊탈퇴를 하시면 다음과 같은 서비스를 이용하실 수 없습니다.<br>
                        ＊소셜계정을 통해 가입된 정보는 JOB-A에서만 삭제되며, 해당 소셜 채널에서 탈퇴되지 않습니다.
          </p>

			<div class="container-sm py-5">
				<div class="grid gap-3 border border-dark-subtle">

					<div class="bg-light rounded p-3">
						<div class="bg-white rounded p-4"
							style="border: 1px dashed rgba(0, 185, 142, .3)">
							<div class="row g-5 align-items-center">
								<div class="mb-4">

									<div class="d-grid gap-2 d-md-flex mb-1">
										<h3 class="mb-3">탈퇴를 하시면</h3>
									</div>
										<b>이력서 삭제</b><br>
										등록해 놓은 이력서가 삭제되어 원하시는 기업의 채용공고에 JOB-A의 이력서를 사용한 온라인 지원에 제약이 가해질 수 있습니다.<br><br>
										<b>입사지원내역 조회불가</b><br>
										JOB-A를 통해 지원하신 입사지원 내역을 조회하실 수 없습니다. <br><br>
										<b>다양한 이벤트 참가불가</b><br>
										회원을 탈퇴하시면 인크루트에서 준비한 다양한 이벤트에 참여 하실 수 없습니다. <br>
										참여하시고자 한다면 재가입하셔야 합니다.<br><br>
				
									
						
						  <button class="btn btn-primary" onclick="location.href='deletepw'">회원탈퇴 하러가기</button>
						
																
								</div>
							</div>
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