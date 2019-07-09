<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% String root= request.getContextPath(); %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->

<title>스크랩북</title>

<!-- 부트스트랩 -->
<link href="../vendor/bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.js"></script>
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

<script>
function likeSbook(sbook_number,id){
	var flag=window.confirm(sbook_number+"번 스크랩북을 "+id+"의 관심 목록에 추가합니다");
	if(flag>0){
	$.ajax({
		type: "GET",
		url: "mysbook_like.do?sbook_number="+ sbook_number + "&id=" + id,
				dataType : "text",
				error : function() {
					alert("추가 실패");
				},
				success : function() {
					alert("관심 목록에 추가되었습니다");
					//추가된 거 표시할 수 있는 코드 필요함 (이미지 바꾼다던가)
				}
			});
		}
	};
</script>
</head>

<body>
	<!-- 헤더 들어가는 부분 -->
	<jsp:include page="../../main/menubar.jsp"></jsp:include>
	<hr />
	<div class="container">
		<div class="row">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-md-12">
							<div class="news-title">
								<h2 class="text-center">${found.title }</h2>
							</div>

							<hr>

							<div style="font-size: 0.9em; text-align: right;">작성자 :
								${found.id} 작성시간 : ${found.write_time} 조회수 : ??</div>
							<br>
							<div class="news-content">
								<p>
									content 내용이 오는 곳 :<br> ${found.contents}
								</p>
								${found.input_URL1 } <br>${found.input_URL2 } <br>
								${found.input_URL3 }
							</div>
							<hr>
							<div class="news-footer" align="center">
								<div class="news-likes">
									<button type="button" class="btn btn-outline-secondary">
										<i class="fa fa-thumbs-o-up text-success"></i> <span
											class="badge ">내 스크랩북에 저장</span>
									</button>
									<button type="button" class="btn btn-outline-secondary">
										<i class="fa fa-thumbs-o-down text-danger"></i><span
											class="badge">흠.....</span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>
		</div>
	</div>

	<br>
	<br>
	<br>
	<hr />
	<!-- 푸터 들어가는 부분 -->
	<jsp:include page="../../main/footer.jsp"></jsp:include>
	<!--// 푸터 들어가는 부분 -->


	<!-- Modal -->
	
</body>




</html>