<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->

<title>12.트렌드 com:path</title>

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
</head>

<body>
	<!-- 헤더 들어가는 부분 -->
	<jsp:include page="../main/menubar.jsp"></jsp:include>
	<hr />

	<!-- 오늘의 키워드 -->
	<div class="container">

		<h1 class="separator">검색 키워드 워드클라우드</h1>
		<!-- protovis로 띄운다 -->
		<div id="chartdiv" style="width:100%; height:500px;"></div>
		<script src="resource/js/core.js"></script>
		<script src="resource/js/charts.js"></script>
		<script src="resource/plugins/wordCloud.js"></script>
		<script src="resource/themes/animated.js"></script>
		<script src="resource/js/word-cloud-changing-data.js"></script>

		<div class="container-fluid text-center">
			<br>
			<br>
			<nav aria-label="Wordcloud Adjust Bar" class="separator">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item active"><a class="page-link" href="#">2
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
							class="sr-only">Next</span>
					</a></li>
				</ul>
			</nav>
		</div>
		<!-- 해당 키워드 언급량 (연관 키워드 ~3위까지 보여줌) -->
		<div id="chartdiv1" style="width:100%; height:500px;"></div>
		<script src="resource/js/core.js"></script>
		<script src="resource/js/charts.js"></script>
		<script src="resource/themes/animated.js"></script>
		<script src="resource/themes/dark.js"></script>
		<script src="resource/js/adding-live-data.js"></script>

		<!-- 오늘의 키워드 뉴스 리스트 -->
		<h1 class="separator">키워드 관련 뉴스 리스트</h1>
		<div class="bd-example">
			<ul class="list-unstyled">
				<li class="media">
					<div class="media-body">
						<h5 class="mt-0 mb-1">뉴스 1</h5>
						동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려 강산 대한사람 대한으로 길이
						보전하세 남산 위에 저 소나무 철갑을 두른듯 바람서리 불변함은 우리 기상일세 무궁화 삼천리 화려 강산 대한사람 대한으로
						길이 보전하세.
					</div>
				</li>
				<li class="media my-4">
					<div class="media-body">
						<h5 class="mt-0 mb-1">뉴스 2</h5>
						동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려 강산 대한사람 대한으로 길이
						보전하세 남산 위에 저 소나무 철갑을 두른듯 바람서리 불변함은 우리 기상일세 무궁화 삼천리 화려 강산 대한사람 대한으로
						길이 보전하세.
					</div>
				</li>
				<li class="media">
					<div class="media-body">
						<h5 class="mt-0 mb-1">뉴스 3</h5>
						동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려 강산 대한사람 대한으로 길이
						보전하세 남산 위에 저 소나무 철갑을 두른듯 바람서리 불변함은 우리 기상일세 무궁화 삼천리 화려 강산 대한사람 대한으로
						길이 보전하세.
					</div>
				</li>
			</ul>
		</div>

		<!-- 오늘의 기업 -->
		<h1 class="separator ">오늘의 기업</h1>
		<div class="card-group card-columns">
			<div class="card">
				<img class="card-img-top" src="..." alt="Card image cap">
				<div class="card-body">
					<h4 class="card-title">Card title</h4>
					<p class="card-text">This is a wider card with supporting text
						below as a natural lead-in to additional content. This content is
						a little bit longer.</p>
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="..." alt="Card image cap">
				<div class="card-body">
					<h4 class="card-title">Card title</h4>
					<p class="card-text">This card has supporting text below as a
						natural lead-in to additional content.</p>
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="..." alt="Card image cap">
				<div class="card-body">
					<h4 class="card-title">Card title</h4>
					<p class="card-text">This is a wider card with supporting text
						below as a natural lead-in to additional content. This card has
						even longer content than the first to show that equal height
						action.</p>
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="..." alt="Card image cap">
				<div class="card-body">
					<h4 class="card-title">Card title</h4>
					<p class="card-text">This is a wider card with supporting text
						below as a natural lead-in to additional content. This card has
						even longer content than the first to show that equal height
						action.</p>
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top" src="..." alt="Card image cap">
				<div class="card-body">
					<h4 class="card-title">Card title</h4>
					<p class="card-text">This is a wider card with supporting text
						below as a natural lead-in to additional content. This card has
						even longer content than the first to show that equal height
						action.</p>
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
			</div>
			<br>
			<div class="card">
				<img class="card-img-top" src="..." alt="Card image cap">
				<div class="card-body">
					<h4 class="card-title">Card title</h4>
					<p class="card-text">This is a wider card with supporting text
						below as a natural lead-in to additional content. This card has
						even longer content than the first to show that equal height
						action.</p>
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
			</div>
		</div>


		<!-- 최신 채용공고 -->
		<h1 class="separator ">최신 채용공고</h1>
		<div class="card-group card-columns">
			<div class="card" style="width: 20rem;">
				<div class="card-body">
					<h4 class="card-title">Card title</h4>
					<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
					<a href="#" class="card-link">Card link</a> <a href="#"
						class="card-link">Another link</a>
				</div>
			</div>
			<div class="card" style="width: 20rem;">
				<div class="card-body">
					<h4 class="card-title">Card title</h4>
					<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
					<a href="#" class="card-link">Card link</a> <a href="#"
						class="card-link">Another link</a>
				</div>
			</div>
			<div class="card" style="width: 20rem;">
				<div class="card-body">
					<h4 class="card-title">Card title</h4>
					<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
					<a href="#" class="card-link">Card link</a> <a href="#"
						class="card-link">Another link</a>
				</div>
			</div>
			<div class="card" style="width: 20rem;">
				<div class="card-body">
					<h4 class="card-title">Card title</h4>
					<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
					<a href="#" class="card-link">Card link</a> <a href="#"
						class="card-link">Another link</a>
				</div>
			</div>
			<div class="card" style="width: 20rem;">
				<div class="card-body">
					<h4 class="card-title">Card title</h4>
					<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
					<a href="#" class="card-link">Card link</a> <a href="#"
						class="card-link">Another link</a>
				</div>
			</div>
			<div class="card" style="width: 20rem;">
				<div class="card-body">
					<h4 class="card-title">Card title</h4>
					<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
					<a href="#" class="card-link">Card link</a> <a href="#"
						class="card-link">Another link</a>
				</div>
			</div>

		</div>
	</div>
	<hr />
	<!-- 푸터 들어가는 부분 -->
	<jsp:include page="../main/footer.jsp"></jsp:include>
	<!--// 푸터 들어가는 부분 -->

	<!-- Modal -->

</body>