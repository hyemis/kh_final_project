
 $(document).ready(function() {
	 //삭제버튼
	 $('.delete').click(function() {
		  
		  var conf = confirm("정말로 삭제하시겠습니까?");
		  
		  if(conf){
			  $.ajax({
			    	type : "POST"
			    	, url : "${pageContext.request.contextPath}/admin/account/delete"
			    	, data : {userId :  $(this).closest("tr").find(".userId").text()}
			    	, success : function(result){ 
			                if(result == 1){
			                	location.reload();	
			                }else if(result == 3){
			                	alert("자기 자신은 삭제 할 수 없습니다.");	
			                }else if(result != 1){
			                	alert("계정 삭제에 실패했습니다.");	
			                }
		                }
					, error : function(request, status, error){
		                    alert("삭제 실패.");
			            }
			    });
		  }
	 });
	 
	 

});