<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.user.UserEntity"%>
<%
	String idsearch = (String) request.getAttribute("idsearch");
	String pwsearch = (String) request.getAttribute("pwsearch");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->

<title>ID/PW 찾기</title>

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
<link rel="stylesheet" type="text/css" href="resource/css/main.css">
<link rel="stylesheet" type="text/css"
	href="resource/css/searchmain.css">

</head>
<script type="text/javascript">
	function findid(email){
		$.ajax({
			url : "useridsearch.do",
			data : {"email" : email},
			type : "GET",
			async : false,
			success : function(data) {
				if (data == "no user") {
					alert("존재하는 아이디가 없습니다.");
				} else {
					alert("아이디는 "+ data+" 입니다.");
				}
			}
		});
	};
	
	function findpw(id,email){
		$.ajax({
			url : "usersearch.do",
			type : "GET",
			data : {"id" : id , "email" : email},
			async : false,
			success : function(data) {
				if (data == "no user") {
					alert("존재하는 아이디가 없습니다.");
				} else {
					alert("비밀번호는 "+ data+" 입니다.");
				}
			}
		});
	};
		
	
	</script>
<body>
	<!-- 헤더 들어가는 부분 -->
	<jsp:include page="../main/menubar.jsp"></jsp:include>
	<hr />
	<br />
	<br />
	<div class="container">
		<h1 class="text-center">Forgot ID/PW?</h1>

		<!------ Include the above in your HEAD tag ---------->
		<!-- 아이디찾기비밀번호찾기아이디찾기비밀번호찾기아이디찾기비밀번호찾기아이디찾기비밀번호찾기 -->
		<nav class="nav nav-tabs" id="myTab" role="tablist">
			<a class="nav-item nav-link" id="nav-id-tab" data-toggle="tab"
				href="#nav-id" role="tab" aria-controls="nav-id"
				aria-selected="true">아이디 찾기</a> <a class="nav-item nav-link"
				id="nav-pw-tab" data-toggle="tab" href="#nav-pw" role="tab"
				aria-controls="nav-pw" aria-selected="false">비밀번호 찾기</a>
		</nav>
		<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show" id="nav-id" role="tabpanel"
				aria-labelledby="nav-id-tab">
				<div class="container">
					<form action="" >
						<div class="form-group">
							<label for="username">Email</label> <input type="" placeholder=""
								name="email" class="form-control" id="useremail1"
								placeholder="Your userEmail" />
						</div>
						<div class="row">
							<div class="col-lg-12" style="text-align: center">
								<!-- <button id="sign" type="submit"
									class="btn btn-outline-info btn-light " data-toggle="modal"
									data-target="#FindIDModal">아이디 찾기</button> -->
								<button id="sign" type="button"
									class="btn btn-outline-info btn-light "
									onclick="findid($('#useremail1').val());">아이디 찾기</button>
							</div>
						</div>
					</form>
				</div>
			</div>


			<div class="tab-pane fade show" id="nav-pw" role="tabpanel"
				aria-labelledby="nav-pw-tab">
				<div class="container">
					<form action="">
						<div class="form-group">
							<label for="username">ID 입력</label> <input type="" placeholder=""
								name="id" class="form-control" id="userid"
								placeholder="Your userID" />
						</div>
						<div class="form-group">
							<label for="username">Email</label> <input type="" placeholder=""
								name="email" class="form-control" id="useremail2"
								placeholder="Your userEmail" />
						</div>
						<div class="row">
							<div class="col-lg-12" style="text-align: center">
								<!-- <button id="sign" type="submit"
									class="btn btn-outline-info btn-light " data-toggle="modal"
									data-target="#FindPWModal">비밀번호 찾기</button> -->
								<button id="sign" type="button"
									class="btn btn-outline-info btn-light "
									onclick="findpw($('#userid').val(),$('#useremail2').val());">비밀번호
									찾기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>




	<!-- Find Modal-->
	<div class="modal fade" id="FindIDModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<!-- class="modal-dialog"에 modal-lg추가하면 큰모달,  modal-sm추가하면 작은모달, 아무것도 안쓰면 중간크기의 모달이 만들어진다. -->
			<div class="modal-content">
				<div class="modal-header">

					<h4 class="modal-title" id="myModalLabel">Find ID</h4>
				</div>
				<!-- 모달창 영역에 버튼태그의 data-dismiss 속성을 적용하면 모달을 닫게하는 기능을 적용하겠다라는 의미 
      class="modal fade"에서 fade없으면 부드럽게 창이 뜨지 않는다.
      -->

				<div class="modal-body">
					<p>
						<!-- OOO님의 ID는 #### 입니다. -->
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>

				</div>
				<!-- data-dismiss="modal" : 모달을 닫는 기능을 갖고있다. -->

			</div>
			<!-- 모달 콘텐츠 -->
		</div>
		<!-- 모달 다이얼로그 -->
	</div>
	<!-- 모달 전체 윈도우 -->

	<!-- PW Modal-->
	<div class="modal fade" id="FindPWModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<!-- class="modal-dialog"에 modal-lg추가하면 큰모달,  modal-sm추가하면 작은모달, 아무것도 안쓰면 중간크기의 모달이 만들어진다. -->
			<div class="modal-content">
				<div class="modal-header">

					<h4 class="modal-title" id="myModalLabel">Find PW</h4>
				</div>
				<!-- 모달창 영역에 버튼태그의 data-dismiss 속성을 적용하면 모달을 닫게하는 기능을 적용하겠다라는 의미 
      class="modal fade"에서 fade없으면 부드럽게 창이 뜨지 않는다.
      -->

				<div class="modal-body">
					<p>
						<!-- OOO님의 PW는 #### 입니다. -->
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>

				</div>
				<!-- data-dismiss="modal" : 모달을 닫는 기능을 갖고있다. -->

			</div>
			<!-- 모달 콘텐츠 -->
		</div>
		<!-- 모달 다이얼로그 -->
	</div>
	<!-- 모달 전체 윈도우 -->




	<hr />
	<!-- 푸터 들어가는 부분 -->
	<jsp:include page="../main/footer.jsp"></jsp:include>
	<!--// 푸터 들어가는 부분 -->



</body>

</html>