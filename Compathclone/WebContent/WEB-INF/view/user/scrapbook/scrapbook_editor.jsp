<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.user.CPSbookEntity"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String root = request.getContextPath();
	CPSbookEntity found = (CPSbookEntity) request.getAttribute("found");
%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<link href="../vendor/bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">

<!-- Bootstrap core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,900|Poppins:700"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="resource/css/main.css">
<link rel="stylesheet" type="text/css"
	href="resource/css/searchmain.css">
<!--SummerNote-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>

<script>
	$(document).ready(function() {
		//call summernote
		$('#summernote').summernote({
			height : 400,
			minHeight : null,
			maxHeight : null,
			focus : true
		});
		//보낸 sbook 객체에서 contents에 들어있는 html코드를 변수에 저장한다
		var sbcontent = "${found.contents}";
		$('#summernote').summernote('code', sbcontent);

	});
	/*function rsearch() {
	 location.href = "recruit_search.do?empBusiNm="
	 + $("#sword").val();
	 }*/
	//작성 후 저장버튼 누르면 update 그다음 shareSbook 호출
	
  	function savebtn(){
        if($("div .title").val()==""){
            alert("제목을 입력하세요");
            $("div .title").focus();
        } else{

            var queryString = $("form[name=toupdate]").serialize() ;
            var contents= $('#summernote').summernote('code');
            alert(contents);
            alert(queryString);
            $.ajax({
                type : "post",
                url : "sbook_update.do?"+queryString+"&contents="+contents,
                dataType : "text",
                error: function(xhr, status, error){
                    alert("xhr"+xhr+" status "+status+" error "+error);
                },
                success : function(){
                    alert("저장이 완료되었습니다");
                 	shareSbook("${found.scrapbook_num}");
                   
                },
            });     
        }
         
        
    }


	 /* 	function saveSbook(num, title, contents, input_URL1, input_URL2, input_URL3) {
		 var flag = confirm("스크랩북을 저장합니다.")
		 if(flag){
			 $.post( "sbook_update.do", $( "#toupdate" ).serialize() );
		 }
	} */

	//스크랩북 작성 후 공유할 것인지 확인 
	function shareSbook(num) {
		var flag = confirm("해당 스크랩북을 공유하시겠습니까?");
		if (flag) {
			$.get( "sbook_share.do?scrapbook_num="+${found.scrapbook_num}, function(){
				alert("공유에 성공하였습니다");
				location.href="mypage.do?id=${found.id}";})
			  .fail(function() {
			    alert( "error" );
			  })
			  .always(function() {
				  location.href="mypage.do?id=${found.id}";
			  });
            
		} else {
            location.href="mypage.do?id=${found.id}";
		}
	}

</script>

</head>



<body>
	${pageScope.found}
	<!-- 헤더 들어가는 부분 -->
	<jsp:include page="../../main/menubar.jsp"></jsp:include>

	<hr />
	<!-- <div id="wrapper"> -->
	<!--sidebar-->
	<jsp:include page="../../main/sidebar.jsp"></jsp:include>
	<!-- </div> -->

	<!-- /#sidebar-wrapper -->
	<!-- scrap news Content -->
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<h1 align="center">나의 관심 뉴스</h1>
				<c:forEach var="news" items="${requestScope.mynewslist}">
					<div class="card mb-3 mysnews">
						<div class="card-body">
							<h4>${news.title }</h4>
							<p>contents: ${news.contents }</p>
							<div onclick="likesbDetail('${news.news_number }')"
								style="font-size: small;">자세히보기</div>
							<div onclick="unlikeMyNews('${news.news_number}','${id }')">삭제</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!--스크랩북 editor-->
			<div class="col-md-8">
				<h1 class="separator text-center">Editor</h1>
				<form method="POST" action="sbook_update.do" name="toupdate"
					id="toupdate">
					<div class="input-group">
						<label
							style="align-content: center; align-self: center; align-items: center;">제목</label>
						<input class="title" name="title" type="text"
							placeholder="${found.title }" contenteditable="true"
							autofocus="autofocus" style="font-size: small; width: 90%;">
					</div>
					<br>
					<div class="container">
						<div id="summernote" class="summernote"></div>
						<br> <br>
						<div class="text-center">
							<input type="button" onclick="savebtn()"
								class="btn btn-outline-info btn-light" value="저장">
						</div>
						<input type="hidden" name="scrapbook_num"
							value="${found.scrapbook_num }"> <input type="hidden"
							name="write_time" value="${found.write_time }"> <input
							type="hidden" name="id" value="${found.id }"> <input
							type="hidden" name="write_form" value="${found.write_form }">
						<input type="hidden" name="input_URL1"
							value="${found.input_URL1 }"> <input type="hidden"
							name="input_URL2" value="${found.input_URL2 }"> <input
							type="hidden" name="input_URL3" value="${found.input_URL3 }">

					</div>
				</form>
			</div>
		</div>
	</div>


	<br>
	<br>
	<!-- 푸터 들어가는 부분 -->
	<jsp:include page="../../main/footer.jsp" />

	<!-- Modal -->


</body>

</html>