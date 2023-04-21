<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!-- css file link part start -->
    <!-- Favicon -->
    <link href="${pageContext.request.contextPath}/resources/template/makaan/img/favicon.ico" rel="icon">
	<%-- ${pageContext.request.contextPath} --%>
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/template/makaan/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/template/makaan/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/template/makaan/css/style.css" rel="stylesheet">
    <!-- css file link part end -->
    
    <title>카테고리 관리</title>
    
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    
    <!-- js part start -->
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>
    
    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>
    <!-- Custom Javascript -->
    <script src="${pageContext.request.contextPath}/resources/js/admin.account.js"></script>
    <!-- js part end -->

</head>

<body>
    <div class="container-xxl bg-white p-0">
     
    	<jsp:include page="/WEB-INF/views/common/adheader.jsp" />

		 <div class="min-vh-100 d-flex justify-content-center align-items-center">
			 <div class="fdept flex-grow-1 mx-3 bg-info" style="min-height: 500px;">
		 		<div class="m-2 text-lg-end">
		 			<button class="addFdeptCate m-1" type="button"><img src="${pageContext.request.contextPath}/resources/template/makaan/img/plusbutton.png" width="20"></button>
		 		</div>
			 	<div class="m-3 bg-white fdeptList" style="min-height: 300px;">
			 		<c:forEach var="fList" items="${fdeptList}" >
			 			<div class="mx-2 fcateinfo">
			 				<input type="hidden" class="categoryId" name="categoryId" value="${fList.categoryId}">
			 				<input type="hidden" class="categoryName" name="categoryName" value="${fList.categoryName}">
			 				<input type="hidden" class="categoryType" name="categoryType" value="${fList.categoryType}">
			 				<input type="hidden" class="reqCategoryId" name="reqCategoryId" value="${fList.categoryId}">
			 				${fList.categoryId} : ${fList.categoryName}
			 				<button type="button" class="btn cateDelete" style=" display: none;">삭제</button>
			 			</div> 
			 		</c:forEach>
			 	</div>
			 </div>
			 <div class="mdept flex-grow-1 mx-3 bg-primary" style="min-height: 500px;">
			 
			 </div>
			 <div class="ldept flex-grow-1 mx-3 bg-primary" style="min-height: 500px;">
			 
			 </div>
		 </div>

		<%-- <%@ include file="../common/footer.jsp" %> --%>
		
		<script type="text/javascript">
		
		$(".addFdeptCate").click(function() {
		    if($(".fdeptList input[type='text']").length == 0){
		        let inputCate = '<div class="container mx-2 inputCate" id="inputCate">';
		        inputCate += '<button type="button" class="closeInput btn btn-dark btn-sm border-0">X</button>';
		        inputCate += '<form action="" method="post">'
		        inputCate += '<div class="mx-2 col-6"><label for="categoryId">아이디</label><input type="text" class="categoryId form-control form-control-sm" name="categoryId" id="categoryId"></div>';
		        inputCate += '<div class="mx-2 col-6"><label for="categoryName">이름</label><input type="text" class="categoryName form-control form-control-sm" name="categoryName" id = "categoryName"></div>';
		        inputCate += '<button type="button" class="addFcate btn btn-dark btn-sm border-0 my-1">추가</button>'
		        inputCate += '</div>';
		        //inputCate 를  클래스명 fdeptList 아래 추가
		        $(".fdeptList").append(inputCate);        		
		    }
		});
        
		//클릭시 inputCate 안에 내용 삭제
        $(document).on('click', '.closeInput', function() {
        	$(this).closest('#inputCate').first().remove();
		});
        
		//addFcate 1단계 카테고리 추가 (inputCate 안에 input태그의 정보)
        $(document).on('click', '.addFcate', function() {
        	let categoryId = $(this).closest('.inputCate').find('.categoryId').val();
        	let categoryName = $(this).closest('.inputCate').find('.categoryName').val();
        	let inputCate = $(this).closest('.inputCate');
        	
        	if(categoryId ===''){
        		alert("아이디 입력해주세요");
        	}else if(categoryId.match(/\s/g)){
        		alert("공백 제거 해주세요");
        	}else{
	    		$.ajax({ 
	    			url: "${pageContext.request.contextPath}/admin/category/addfcate"
	    			, type: "post"
	    			, data:  {categoryId : categoryId, categoryName : categoryName}
	    			, success: function(result){
	    				if(result == 1){
	    					location.reload();
	    				}else if(result == -1){
	    					alert("아이디가 중복 되었습니다.");
	    					inputCate.find('.categoryId').val('');
	    				}else{
	    					alert("등록에 실패 했습니다.");
	    				}
	    			}
	    			, error: function(e){
	    				alert(e +" : 오류")
	    			}
	    		});        		
        	}
        	
		});
		
        $('.fcateinfo').on('click', function() {
        	//삭제 버튼 나오기
        	$(this).find('button').toggle();
            $('.fcateinfo').not(this).find('button').hide();
            $('.ldept').empty();
            
            let id = $(this).find('.categoryId').val(); 
            let type = $(this).find('.categoryType').val(); 
            let reqid = $(this).find('.reqCategoryId').val(); 
            
            //다음 단계나오게
    		$.ajax({ 
    			url: "${pageContext.request.contextPath}/admin/category/listmcate"
    			, type: "post"
    			, data:  {categoryId : id}
    			, dataType:"json"
    			, success: function(result){

	    				let htmlVal = '<div class="m-2 text-lg-end">';
	    				htmlVal += '<button class="addMdeptCate m-1" type="button"><img src="${pageContext.request.contextPath}/resources/template/makaan/img/plusbutton.png" width="20"></button></div>';
	    				htmlVal += '<div class="m-3 bg-white mdeptList" style="min-height: 300px;">';
    					htmlVal += '<input type="hidden" class="categoryType" name="categoryType" value="'+type+'">';
    					htmlVal += '<input type="hidden" class="reqCategoryId" name="reqCategoryId" value="'+reqid+'">';
	    				for(i = 0; i< result.length; i++){
	    					let list = result[i];
	    					htmlVal += '<div class="mx-2 mcateinfo">';
	    					htmlVal += '<input type="hidden" class="categoryId" name="categoryId" value="'+list.categoryId+'">';
	    					htmlVal += '<input type="hidden" class="categoryName" name="categoryName" value="'+list.categoryName+'">';
	    					htmlVal += list.categoryId +' : '+list.categoryName;
	    					htmlVal += '<button type="button" class="btn cateDelete" style=" display: none;">삭제</button>';
	    					htmlVal += '</div>';
	    				}
	    				htmlVal += '</div>';
	    				$(".mdept").html(htmlVal);    					
    			}
    			, error: function(e){
    				alert(e +" : 오류")
    			}

    		}); 
        });
        
        //카테고리 지우기 버튼
        $(document).on('click','.cateDelete', function() {
        	let id = $(this).prevAll('.categoryId').val();
    		$.ajax({ 
    			url: "${pageContext.request.contextPath}/admin/category/delfcate"
    			, type: "post"
    			, data:  {categoryId : id}
    			, success: function(result){
    				if(result == 1){
    					location.reload();
    				}else if(result == 3){
    					alert("해당 카테고리를 참조하고 있는 하위 카테고리가 존재 합니다.");
    				}else{
    					alert("삭제에 실패 했습니다.");
    				}
    			}
    			, error: function(e){
    				alert(e +" : 오류")
    			}
    		}); 
        	
        });
        //2단계 +버튼 클릭시 카테고리 생성 정보 입력 칸 노출
        $(document).on('click', '.addMdeptCate', function() {
		    if($(".mdeptList input[type='text']").length == 0){
		        let inputCate = '<div class="container mx-2 inputCate" id="inputCate">';
		        inputCate += '<button type="button" class="closeInput btn btn-dark btn-sm border-0">X</button>';
		        inputCate += '<form action="" method="post">';
		        inputCate += '<div class="mx-2 col-6"><label for="categoryId">아이디</label><input type="text" class="categoryId form-control form-control-sm" name="categoryId" id="categoryId"></div>';
		        inputCate += '<div class="mx-2 col-6"><label for="categoryName">이름</label><input type="text" class="categoryName form-control form-control-sm" name="categoryName" id = "categoryName"></div>';
		        inputCate += '<button type="button" class="addMcate btn btn-dark btn-sm border-0 my-1">추가</button>';
		        inputCate += '</div>';
		        $(".mdeptList").append(inputCate);        		
		    }
		});
        
        //2단계 카테고리 추가
        $(document).on('click', '.addMcate', function() {
        	let categoryId = $(this).closest('.inputCate').find('.categoryId').val();
        	let categoryName = $(this).closest('.inputCate').find('.categoryName').val();
        	let inputCate = $(this).closest('.inputCate');
        	let categoryType = $(this).closest('.mdeptList').find('.categoryType').val();
        	let reqCategoryId = $(this).closest('.mdeptList').find('.reqCategoryId').val();
        	
        	if(categoryId ===''){
        		alert("아이디 입력해주세요");
        	}else if(categoryId.match(/\s/g)){
        		alert("공백 제거 해주세요");
        	}else{
	    		$.ajax({ 
	    			url: "${pageContext.request.contextPath}/admin/category/addmcate"
	    			, type: "post"
	    			, data:  {categoryId : categoryId
	    						, categoryName : categoryName
	    						, categoryType : categoryType
	    						, reqCategoryId : reqCategoryId
	    					 }
	    			, success: function(result){
	    				if(result == 1){
	    					location.reload();
	    				}else if(result == -1){
	    					alert("아이디가 중복 되었습니다.");
	    					inputCate.find('.categoryId').val('');
	    				}else{
	    					alert("등록에 실패 했습니다.");
	    				}
	    			}
	    			, error: function(e){
	    				alert(e +" : 오류")
	    			}
	    		});        		
        	}
        	
		});
        
        $(document).on('click', '.mcateinfo', function() {
        	$(this).find('button').toggle();
            $('.mcateinfo').not(this).find('button').hide();
            
            let id = $(this).find('.categoryId').val(); 
            let type = $(this).closest('.mdeptList').find('.categoryType').val(); 
            //다음 단계나오게
    		$.ajax({ 
    			url: "${pageContext.request.contextPath}/admin/category/listlcate"
    			, type: "post"
    			, data:  {categoryId : id}
    			, dataType:"json"
    			, success: function(result){
	    				let htmlVal = '<div class="m-2 text-lg-end">';
	    				htmlVal += '<button class="addLdeptCate m-1" type="button"><img src="${pageContext.request.contextPath}/resources/template/makaan/img/plusbutton.png" width="20"></button></div>';
	    				htmlVal += '<div class="m-3 bg-white ldeptList" style="min-height: 300px;">';
    					htmlVal += '<input type="hidden" class="categoryType" name="categoryType" value="'+type+'">';
    					htmlVal += '<input type="hidden" class="reqCategoryId" name="reqCategoryId" value="'+id+'">';
	    				for(i = 0; i< result.length; i++){
	    					let list = result[i];
	    					htmlVal += '<div class="mx-2 lcateinfo">';
	    					htmlVal += '<input type="hidden" class="categoryId" name="categoryId" value="'+list.categoryId+'">';
	    					htmlVal += '<input type="hidden" class="categoryName" name="categoryName" value="'+list.categoryName+'">';
	    					htmlVal += list.categoryId +' : '+list.categoryName;
	    					htmlVal += '<button type="button" class="btn cateDelete" style=" display: none;">삭제</button>';
	    					htmlVal += '</div>';
	    				}
	    				htmlVal += '</div>';
	    				$(".ldept").html(htmlVal);
    			}
    			, error: function(e){
    				alert(e +" : 오류")
    			}
    		}); 
            
        });
      //3단계 +버튼 클릭시 카테고리 생성 정보 입력 칸 노출
        $(document).on('click', '.addLdeptCate', function() {
		    if($(".ldeptList input[type='text']").length == 0){
		        let inputCate = '<div class="container mx-2 inputCate" id="inputCate">';
		        inputCate += '<button type="button" class="closeInput btn btn-dark btn-sm border-0">X</button>';
		        inputCate += '<form action="" method="post">';
		        inputCate += '<div class="mx-2 col-6"><label for="categoryId">아이디</label><input type="text" class="categoryId form-control form-control-sm" name="categoryId" id="categoryId"></div>';
		        inputCate += '<div class="mx-2 col-6"><label for="categoryName">이름</label><input type="text" class="categoryName form-control form-control-sm" name="categoryName" id = "categoryName"></div>';
		        inputCate += '<button type="button" class="addLcate btn btn-dark btn-sm border-0 my-1">추가</button>';
		        inputCate += '</div>';
		        $(".ldeptList").append(inputCate);        		
		    }
		});
      
      //3단계 카테고리 추가
        $(document).on('click', '.addLcate', function() {
        	let categoryId = $(this).closest('.inputCate').find('.categoryId').val();
        	let categoryName = $(this).closest('.inputCate').find('.categoryName').val();
        	let inputCate = $(this).closest('.inputCate');
        	let categoryType = $(this).closest('.ldeptList').find('.categoryType').val();
        	let reqCategoryId = $(this).closest('.ldeptList').find('.reqCategoryId').val();
        	
        	if(categoryId ===''){
        		alert("아이디 입력해주세요");
        	}else if(categoryId.match(/\s/g)){
        		alert("공백 제거 해주세요");
        	}else{
	    		$.ajax({ 
	    			url: "${pageContext.request.contextPath}/admin/category/addlcate"
	    			, type: "post"
	    			, data:  {categoryId : categoryId
	    						, categoryName : categoryName
	    						, categoryType : categoryType
	    						, reqCategoryId : reqCategoryId
	    					 }
	    			, success: function(result){
	    				if(result == 1){
	    					location.reload();
	    				}else if(result == -1){
	    					alert("아이디가 중복 되었습니다.");
	    					inputCate.find('.categoryId').val('');
	    				}else{
	    					alert("등록에 실패 했습니다.");
	    				}
	    			}
	    			, error: function(e){
	    				alert(e +" : 오류")
	    			}
	    		});        		
        	}
        	
		});
      //3단계 삭제 버튼 토글
        $(document).on('click', '.lcateinfo', function() {
        	$(this).find('button').toggle();
            $('.lcateinfo').not(this).find('button').hide();
        });

		</script>

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

</body>

</html>