<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String root = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->

<title>스크랩북 게시판 com:path</title>

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
		url: "mysbook_like.do?sbook_number=" + sbook_number + "&id=" + id,
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
	<!-- 헤더 -->
	<jsp:include page="../../main/menubar.jsp"></jsp:include>
	<hr />
	<!--sidebar-->
	<div id="wrapper">
		<!--sidebar-->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<div class="d-none d-sm-block">
					<h3>
						<li><a href="#">카테고리</a></li>
					</h3>
					<li><a href="#">직 업 정 보</a></li>
					<li><a href="#">직 무 정 보</a></li>
					<li><a href="#">산 업 정 보</a></li>
					<li><a href="#">채 용 정 보</a></li>
				</div>
			</ul>
		</div>

		<!--page content-->

		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="d-none d-sm-block">
							<a href="#" class="btn btn-success" id="menu-toggle">분류별 보기</a>
						</div>
						<h1 class="mt-4">Scrap Book 게시판</h1>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>No</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성시간</th>
									<th>관심글</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach var="be" items="${requestScope.all}">
									<tr>
										<td>${be.scrapbook_num}</td>
										<td><a
											href="sbook_content.do?scrapbook_num=${be.scrapbook_num}">${be.title}</a></td>
										<td>${be.id}</td>
										<td>${be.write_time}</td>
										<td><div onclick="likeSbook('${be.scrapbook_num}')"
												style="color: blue;">좋아요</div></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<hr />
						<br />
						<br />
						<div class="container-fluid">

							<ul class="pagination justify-content-center inline-block">
								<li class="page-item"><a class="page-link" href="#">Previous</a>
								</li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item"><a class="page-link" href="#">6</a></li>
								<li class="page-item"><a class="page-link" href="#">Next</a>
								</li>

								<div class="dropdown">
									<button class="btn btn-default dropdown-toggle" id="mystatus"
										value="title" type="button" data-toggle="dropdown"
										aria-expanded="true">
										전체 <span class="caret"></span>
									</button>
									<ul id="mytype" class="dropdown-menu" role="menu"
										aria-labelledby="searchType">
										<li role="presentation"><a role="menuitem" tabindex="-1">제목</a></li>
										<li role="presentation"><a role="menuitem" tabindex="-1">내용</a></li>
										<li role="presentation"><a role="menuitem" tabindex="-1">작성자</a></li>
										<li role="presentation"><a role="menuitem" tabindex="-1">제목+내용</a></li>
									</ul>

									<%
										String url = request.getContextPath();
									%>
								</div>
								<form class="form-inline" action="<%=url%>/sbook_selectbyid.do"
									name="bull_entity" method="GET">

									<input class="form-control sm-2" type="search"
										placeholder="Search" name="id" id="searchID" /> 
									<button class="btn btn-outline-info btn-light">검색</button>
								</form>
							</ul>
						</div>
						<br> <br> <br> <br> <br>
						<hr />

						<!-- 푸터 들어가는 부분 -->
						<jsp:include page="../../main/footer.jsp"></jsp:include>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- Menu Toggle Script -->
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("menuDisplayed");
		});
		$('#mytype li > a').on('click', function() {
			// 버튼에 선택된 항목 텍스트 넣기 
			$('#mystatus').text($(this).text());

		});
	</script>

	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="../bootstrap/js/bootstrap.min.js"></script>

</body>

</html>