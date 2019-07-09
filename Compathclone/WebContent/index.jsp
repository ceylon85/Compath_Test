<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<!-- 브라우저에서 음성 tts 읽어주는 서비스에서 사용할 언어 -->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->

<title>welcome com:path</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
<link rel="stylesheet" type="text/css" href="resource/css/main.css">
<link rel="stylesheet" type="text/css"
	href="resource/css/searchmain.css">


<title>Hi! This is your first test.</title>
</head>

<body>
	<!-- 헤더 들어가는 부분 -->
	<jsp:include page="/WEB-INF/view/main/menubar.jsp"></jsp:include>
	<!-- carousel meaning = merry-go-round -->
	<hr/>
	<div class="container">
	<h1 class="separator" id="carousel">Compath</h1>
	<div class="row center">
		<div class="col-md-8">
			<!-- bootstrap 표준으로, 하나의 row를 다 차지한다는 의미라고 생각하면 됨-->

			<div class="carousel slide" id="myCarousel" data-ride="carousel">
				<ul class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<!-- data-slide-to 배열과 같은 개념, 0이면 첫 화면 -->
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ul>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<!-- active option은 페이지 들어가자마자 처음으로 뜨는 캐러셀-->
						<img src="resource/img/img1.jpg" class="w-100" alt="job">
						<!-- w-100은 width의 100퍼센트를 다 차지한다는 의미, 없으면 사진 본연의 크기가 나옴 -->
						<div class="carousel-caption">
							<h1></h1>
							<p></p>
						</div>
					</div>
					<div class="carousel-item">
						<img src="resource/img/dog_carousel.jpg" class="w-100" alt="dog">
						<div class="carousel-caption">
							<h1>멍</h1>
							<p>멍멍멍</p>
						</div>
					</div>
					<div class="carousel-item">
						<img src="resource/img/dog_cat_carousel.jpg" class="w-100"
							alt="dog_cat">
						<div class="carousel-caption">
							<h1>멍냥</h1>
							<p>멍냥멍냥</p>
							<!-- 사진 위에 캡션으로 들어감 -->
						</div>
					</div>
				</div>

				<a href="#myCarousel" class="carousel-control-prev"
					data-slide="prev"> <span class="carousel-control-prev-icon"></span>
					<!-- 옆으로 생기는 <> 아이콘워낙 많이 쓰는 아이콘이라 클래스로 Bootstrap이 제공하고 있음-->
				</a> <a href="#myCarousel" class="carousel-control-next"
					data-slide="next"> <span class="carousel-control-next-icon"></span>
				</a>
			</div>
		</div>

		<div class="col-md-4">
			<h2>로그인</h2>
			<form action="login.do">
				<div class="form-group">
					<label for="exampleInputEmail1">Email address</label> <input
						type="email" class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" name="id" placeholder="Enter email">

				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Password</label> <input
						type="password" class="form-control" id="exampleInputPassword1"
						name="pw" placeholder="Password">
				</div>
				<div class="form-check">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input"> 아이디 저장
					</label>
				</div>
				<!-- modal 구동 버튼 (trigger) -->
				<!-- <button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#myModal">Log-in</button> -->
				<button type="submit" class="btn btn-primary">Log-in</button>
			</form>
			<br />

			<div class="btn-group" role="group">
				<button type="button" class="btn btn-secondary"
					onclick="location.href = 'user_find.do' ">아이디찾기</button>
				<button type="button" class="btn btn-secondary"
					onclick="location.href = 'user_find.do' ">비밀번호찾기</button>
				<button type="button" class="btn btn-secondary"
					onclick="location.href = 'user_register.do' ">회원가입</button>
			</div>
			<br /> <br />
			<h3>소셜로그인</h3>
			<button type="button" class="btn btn-outline-primary">네이버</button>
			<button type="button" class="btn btn-outline-secondary">페이스북</button>
			<button type="button" class="btn btn-outline-success">다음</button>
			<br /> <br /> <br /> <br />
			<h2>한 번 둘러보기만 할게요.</h2>
			<br />
			<h3>
				<a href="search_main.do">클릭하여 둘러보기 >></a>
			</h3>

		</div>
	</div>
</div>
	<hr />
	<!-- 푸터 들어가는 부분 -->
	<jsp:include page="WEB-INF/view/main/footer.jsp" />
	<!--// 푸터 들어가는 부분 -->
</body>

</html>