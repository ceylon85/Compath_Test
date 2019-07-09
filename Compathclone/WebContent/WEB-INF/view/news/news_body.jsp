<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->

<title>4.뉴스 본문 com:path</title>

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
<script
	src="https://pixinvent.com/bootstrap-admin-template/robust/app-assets/vendors/js/charts/raphael-min.js">
	
</script>
<script
	src="https://pixinvent.com/bootstrap-admin-template/robust/app-assets/vendors/js/charts/morris.min.js">
	
</script>

<script src="resource/js/donut-script2.js">
	
</script>

<body>
	<!-- 헤더 들어가는 부분 -->
	<jsp:include page="../main/menubar.jsp"></jsp:include>
	<hr />
	<!-- <div class="container"> -->

	<div class="row">
		<div class="col-md-9">
			<div class="row mb-2">
				<div class="col-md-12">
					<div class="card">
						<div class="card-body">
							<div class="row">
								<div class="col-md-12">
									<div class="news-title">
										<h2>${newsdetail.title}</h2>
									</div>
									<div class="news-cats">
										<ul class="list-unstyled list-inline mb-1">
											<li class="list-inline-item"><i
												class="fa fa-folder-o text-danger"></i> <a href="#"><small>${newsdetail.category}</small>
											</a></li>
											<li class="list-inline-item"><i
												class="fa fa-folder-o text-danger"></i> <a href="#"><small>${newsdetail.author}</small>
											</a></li>
											<li class="list-inline-item"><i
												class="fa fa-folder-o text-danger"></i> <a href="#"><small>${newsdetail.postTime}</small></a>
											</li>
										</ul>
									</div>
									<hr />

									<div class="news-content">${articleBodyContents}</div>
									<hr />
									<div class="news-footer">
										<div class="news-likes">
											<button type="button" class="btn btn-outline-secondary">
												<i class="fa fa-thumbs-o-up text-success"></i> <span
													class="badge ">관심뉴스 등록</span>
											</button>
										</div>
									</div>

									<hr />
									<div class="news-tags">
										<h5>Tags - 얘네는 모양만 만들었으니까 신경 no no</h5>
										<button type="button" class="btn btn-sm btn-secondary">
											Education <span class="badge badge-light">4</span>
										</button>
										<button type="button" class="btn btn-sm btn-secondary">
											Entertainment <span class="badge badge-light">4</span>
										</button>
										<button type="button" class="btn btn-sm btn-secondary">
											Automobile <span class="badge badge-light">4</span>
										</button>
										<button type="button" class="btn btn-sm btn-secondary">
											Insurance <span class="badge badge-light">4</span>
										</button>
										<button type="button" class="btn btn-sm btn-secondary">
											Energy <span class="badge badge-light">4</span>
										</button>
										<button type="button" class="btn btn-sm btn-secondary">
											Health <span class="badge badge-light">4</span>
										</button>
									</div>
									<hr />
									<div class="news-author">
										<div class="row">
											<div class="col-md-auto">
												<a href="#" title="Biswajit Saha"><img src="#"
													alt="Author image" class="rounded-circle"
													style="width: 100px"></a>
											</div>
											<div class="col">
												<div class="auth-title">
													<h4 class="author h4">
														<a href="/author/biswajit/">Biswajit Saha</a>
													</h4>
													<div class="bio">Developer at GBJ solution. I love to
														travel, make new friends. I prefer tea over coffee.</div>
													<ul class="list-unstyled list-inline">
														<li class="list-inline-item"><a href="#"
															target="_blank"><i class="fa fa-twitter"></i></a></li>
														<li class="list-inline-item"><a href="#"
															target="_blank"><i class="fa fa-facebook"></i></a></li>
														<li class="list-inline-item"><a href="#"
															target="_blank"><i class="fa fa-globe"></i></a></li>
														<li class="list-inline-item"><i
															class="fa fa-map-marker"></i> India</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br />
			<div class="col-md-2"></div>
			<div class="container">
				<div class="row">
					<div class="col-lg-5">
						<div class="brand">
							<h3>이 뉴스를 추천!</h3>
						</div>
						<ul class="list-group">
							<%-- ${relatednewslist[0~5].title}--%>

							<li class="list-group-item">뉴스 타이틀 one</li>
							<li class="list-group-item">뉴스 타이틀 two</li>
							<li class="list-group-item">뉴스 타이틀 three</li>
							<li class="list-group-item">뉴스 타이틀 four</li>
							<li class="list-group-item">뉴스 타이틀 five</li>
						</ul>
					</div>
					<div class="col-sm-2"></div>
					<br />
					<div class="col-lg-5">
						<div class="brand">
							<h3>이 뉴스는 어떤가요?</h3>
						</div>
						<ul class="list-group">
							<li class="list-group-item">뉴스 타이틀 one</li>
							<li class="list-group-item">뉴스 타이틀 two</li>
							<li class="list-group-item">뉴스 타이틀 three</li>
							<li class="list-group-item">뉴스 타이틀 four</li>
							<li class="list-group-item">뉴스 타이틀 five</li>

						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="row mb-2">
				<div class="col-md-12">

					<h3>화제성</h3>
					<div id="chartdiv11" style="width:100%; height:350px;"></div>
					<script src="resource/js/core.js"></script>
					<script src="resource/js/charts.js"></script>
					<script src="resource/themes/animated.js"></script>
					<script src="resource/js/pie.js"></script>
					<h3 style="font-size:18px">이 뉴스와 유사한 문맥의 뉴스는 <br><i style="font-size:40px; text-align:center;"><t><u>02개</u></t></i>입니다.</h3>
					<!-- <div id="donut-chart2" class="height-360"></div> -->
					<div class="card">
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="card-body">
										<h5>Categories</h5>
									</div>
								</div>
							</div>
						</div>
						<div class="list-group">
							<ol>
								<!--  이 뉴스와 관련된것 -->
								관련된 키워드
								<li><a href="#">애플</a></li>
								<li><a href="#">아이패드</a></li>
								<li><a href="#">아이폰</a></li>
								<li><a href="#">구글</a></li>
								<li><a href="#">MS</a></li>
							</ol>

							<ol>
								관련된 기업
								<li><a href="#">애플</a></li>
								<li><a href="#">삼성</a></li>
								<li><a href="#">구글</a></li>
								<li><a href="#">MS</a></li>
								<li><a href="#">화웨이</a></li>
							</ol>

						</div>
					</div>
				</div>
			</div>

		</div>

	</div>
	</div>


	<hr />
	<!-- 푸터 들어가는 부분 -->
	<jsp:include page="../main/footer.jsp"></jsp:include>

</body>
</html>
