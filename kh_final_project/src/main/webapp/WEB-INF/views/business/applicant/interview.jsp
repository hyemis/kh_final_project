<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>면접일정관리</title>
<!-- cs -->
	<link href="${pageContext.request.contextPath}/resources/template/makaan/img/favicon.ico" rel="icon">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/template/makaan/lib/animate/animate.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/template/makaan/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/template/makaan/css/style.css" rel="stylesheet">
	
<!-- js -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/wow/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/waypoints/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/template/makaan/js/main.js"></script>

	<!-- fullcalender -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
	
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

	
</head>
<body>
<!-- header  -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- page section -->	
<section>
<div class="container-fluid bg-white p-5">
<!--  test -->
    
    
<!-- 캘린더-->
<div id='calendar'></div>  
<!-- Modal -->
<div class="modal fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">일정추가</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
	       <form>
	          <div class="form-group">
	            <label for="event-title">일정제목</label>
	            <input type="text" class="form-control" id="title" placeholder="제목을 입력하세요">
	          </div>
	          <div class="form-group">
	            <label for="end-time">면접장소</label>
	            <input type="text" class="form-control" id="location" placeholder="면접장소를 입력하세요">
	          </div>
	          <div class="form-group">
	            <label for="end-time">면접관</label>
	            <input type="text" class="form-control" id="interviewer" placeholder="담당 면접관을 입력하세요">
	          </div>
	          <div class="form-group">
	            <label for="end-time">메모</label>
	            <input type="text" class="form-control" id="memo" >
	          </div>
	        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="saveButton">Save</button>
      </div>
    </div>
  </div>
</div>



</div>
</section>

	
<!-- footer  -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


<!-- 캘린더 -->
 <script>
 
 let events;
 document.addEventListener('DOMContentLoaded', function() {
	 getEvents();
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      headerToolbar: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'dayGridMonth,timeGridWeek,timeGridDay'
	      },
	      navLinks: true, // can click day/week names to navigate views
	      selectable: true,
	      selectMirror: true,
	      
	      //클릭시 event
	      select: function(arg) {
	    	  // 모달창 띄우기
	    	  $('#modal').modal('show');

	    	  // 모달창에서 저장 버튼 클릭 시 이벤트 처리
	    	  console.log(arg);
	    	  $('#modal').on('click', '#saveButton', function() {
	    		  console.log(arg);
	    	    // 입력된 값 가져오기
	    	    var title = $('#title').val();
	    	    var start = arg.startStr;
	    	    var end = arg.endStr;
	    	    var location = $('#location').val();
	    	    var interviewer = $('#interviewer').val();
	    	    var memo = $('#memo').val();
	    	    // 새로운 이벤트 생성
	    	    var eventData = {
	    	      caTitle: title,
	    	      dateStart: start,
	    	      dateEnd: end,
	    	      location: location,
	    	      interviewer: interviewer,
	    	      memo: memo
	    	    };
	    	    console.log(eventData);

	    	    // 서버로 데이터 전송
	    	    $.ajax({
	    	      type: "POST",
	    	      url: "${pageContext.request.contextPath}/business/applicant/calendar",
	    	      data: eventData,
	    	        dataType:'json',
	    	      success: function(response) {
	    	        // 서버로부터 응답이 성공적으로 수신되었을 때
	    	        console.log("이벤트 저장 완료");
	    	        alert("일정이 추가되었습니다");
	    	        
	    	        // 모달창 닫기 todo
	    	        $('#modal').modal('hide');


	    	        // FullCalendar에 이벤트 추가
	    	        console.log(response);
	    	      	  for(var i=0; i<response.length;i++){
	    	      	   calendar.addEvent({
	    	      		   title: response[i]['caTitle'],
	    	      		   start: response[i]['dateStart'],
	    	      		   end: response[i]['dateEnd']
	    	      	   })
	    	      	  }
	    	        //calendar.addEvent(eventData);
	    	        
		    	        // 선택 해제
		    	        calendar.unselect();
		    	        calendar.render();
	    	      },
	    	      error: function() {
	    	        // 서버와 통신 중 에러 발생 시
	    	        console.log("서버 에러");
	    	      }
	    	    });
	    	  });
	    	},

	      // 이벤트 클릭해서 삭제
	      eventClick: function(arg) {
	        if (confirm('Are you sure you want to delete this event?')) {
	          arg.event.remove()
	        }
	      },
	      editable: true,
	      dayMaxEvents: true, // allow "more" link when too many events
	      
	      
	      events:  events
         }  //FullCalendar.Calendar
	    );// FullCalendar.Calendar

	    calendar.render();
	  });  // document load
function getEvents(){
	events = [];
	$.ajax({
        url: '${pageContext.request.contextPath}/business/applicant/interview',
        type: 'POST',
        async: false,
        dataType:'json',
        success:function(result){
      	  console.log(result);
      	  //events = result;
      	  for(var i=0; i<result.length;i++){
      		events.push({
      		   title: result[i]['caTitle'],
      		   start: result[i]['dateStart'],
      		   end: result[i]['dateEnd']
      	   })
      	  }
        }
	 });
}
</script>
</body>
</html>
