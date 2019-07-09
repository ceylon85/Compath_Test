<%@page import="com.user.UserEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<link rel="stylesheet" type="text/css" href="resource/css/login.css">
<header>
	<nav class="navbar navbar-expand-md navbar-light sticky-top bg-white">
		<a class="navbar-brand" href="search_main.do"> <img
			src="<%=application.getContextPath()%>/resource/img/N_compath.png"
			alt="com:path" style="width:190px">
		</a>
		<button class="navbar-toggler d-lg-none" type="button"
			data-toggle="collapse" data-target="#navbarsExampleDefault"
			aria-controls="navbarsExampleDefault" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-end"
			id="navbarsExampleDefault">
			<ul class="col-8 navbar-nav mr-auto">

				<!-- <ul class="col-8 navbar-nav mr-auto"> -->

				<%
					if (session.getAttribute("userinfo") == null) {
				%>
				<li class="nav-item active"><a class="nav-link"
					href="search_main.do" class="nav-link">트렌드</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="news_all.do" class="nav-link">뉴스</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="comp_all.do">기업정보</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="recruit_all.do">채용정보</a></li>
				<%
					} else {
				%>
				<li class="nav-item active"><a class="nav-link"
					href="search_main.do" class="nav-link">트렌드</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="news_all.do" class="nav-link">뉴스</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="comp_all.do">기업정보</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="recruit_all.do">채용정보</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="scrapbook_all.do">스크랩북</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="mypage.do?id=${sessionScope.userinfo.id}">마이페이지</a></li>
				<%
					}
				%>


			</ul>
			<!-- </ul> -->
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					data-toggle="collapse" href="#colsearch" aria-expanded="true"
					aria-controls="colsearch"> 상세검색 </a></li>
				<li>
					<form class="form-inline" action="news_search.do">
						<input class="form-control mr-sm-2" title="검색어 입력" type="search"
							name="title" placeholder="찾기" aria-label="Search">
						<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
					</form>
				</li>
			</ul>
		</div>
		<div class="login" style="padding-right: 5%;">
			<%
				if (session.getAttribute("userinfo") == null) {
			%>
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#myModal">Log-in</button>
		</div>
		<%
			} else {
		%>
		<div class="dropdown" style="padding-right: 5%;">

			<button class="btn btn-default dropdown-toggle" id="mystatus"
				value="title" type="button" data-toggle="dropdown"
				aria-expanded="true">
				<span class="caret"><i class="fas fa-user-astronaut"
					style="font-size: 2em;"></i></span>
			</button>
			<ul id="mytype" class="dropdown-menu" role="menu"
				aria-labelledby="searchType">
				<li role="presentation"><a
					href="userinfoupdate.do?id=${sessionScope.userinfo.id}"
					role="menuitem" tabindex="-1">회원정보 수정</a></li>
				<li role="presentation"><a role="menuitem" tabindex="-1"
					onclick="logout();"> Log-out</a></li>
			</ul>

		</div>
		<div class="blind"
			placeholder="<%=((UserEntity) session.getAttribute("userinfo")).getId() + "님"%>">
		</div>
		<%
			}
		%>
	</nav>
</header>
<hr />
<script type="text/javascript">
	function logout() {
		location.href = "logout.do";
	}

	$('#keywordsearchswitch').click(function() {
		/* $.ajax({
		   url : 'news_all.do',
		   type : 'GET',
		   success : function(data){
		      $('#cbody').html(data.$("#cbody"));
		   }
		}); */
		$("#keywordsearchswitch").prop("selected", true);
	});
	$('#newssearchswitch').click(function() {
		/* $.ajax({
		   url : 'recruit_all.do',
		   type : 'GET',
		   success : function(data){
		      $('#cbody').html(data);
		   }
		}); */
		$("#keywordsearchswitch").prop("selected", true);
	});

	$('#compsearchswitch').click(function() {
		/* $.ajax({
		   url : 'comp_all.do',
		   type : 'GET',
		   success : function(data){
		      $('#cbody').html(data);
		   }
		}); */
		$("#keywordsearchswitch").prop("selected", true);
	});
	$('#recruitsearchswitch').click(function() {
		/* $.ajax({
		   url : 'recruit_all.do',
		   type : 'GET',
		   success : function(data){
		      $('#cbody').html(data);
		   }
		}); */
		$("#keywordsearchswitch").prop("selected", true);
	});
</script>
<div class="s011 collapse" id="colsearch">
	<form>
		<fieldset>
			<legend>어떤 정보를 찾고 계세요?</legend>
		</fieldset>
		<div class="inner-form">
			<header>
				<!-- 언젠가 만들것입니다 -->
				<!-- <div class="travel-type-wrap btn-group" role="group">
               <button type="button" class="item btn check" id="keywordsearchswitch">
                  <span>키워드검색</span>
               </button>
               <button type="button" class="item btn" id="newssearchswitch">
                  <span>뉴스</span>
               </button>
               <button type="button" class="item btn" id="compsearchswitch">
                  <span>기업정보검색</span>
               </button>
               <button type="button" class="item btn" id="recruitsearchswitch">
                  <span>채용정보검색</span>
               </button>
            </div> -->
			</header>
			<script type="text/javascript">
				function ksearch() {
					/* $.ajax({
					   url : 'search.do',
					   type : 'GET',
					   async : false,
					   data : "searchword=${searchword}&startdate=${startdate}&enddate=${enddate}&includekeyword=${includekeyword}&excludekeyword=${excludekeyword}",
					   success : function(data) {
					      var res = data;
					   },
					   error : function() {
					      alert('검색 실패했다');
					   }
					}) */
					location.href = "search.do?keyword=" + $("#sword").val();
				};
				function nsearch() {
					location.href = "news_search.do?title=" + $("#sword").val();
				}
				function csearch() {
					location.href = "comp_search.do?crp_nm_i="
							+ $("#sword").val();
				}
				function rsearch() {
					location.href = "recruit_search.do?empBusiNm="
							+ $("#sword").val();
				}
			</script>
			<div class="main-form" id="main-form">
				<div class="roww">
					<div class="input-wrap">
						<div class="input-field underlineHover">
							<label>검색어</label> <input type="text"
								placeholder="검색하고 싶은 키워드를 입력하세요" name="searchword" id="sword" />
						</div>
					</div>
				</div>
				<div class="roww second">
					<div class="input-wrap">
						<div class="input-field underlineHover">
							<label>시작날짜</label> <input class="datepicker" type="text"
								placeholder="mm/dd/yy" name="startdate" id="stdt" />
						</div>
					</div>
					<div class="input-wrap">
						<div class="input-field underlineHover">
							<label>종료날짜</label> <input class="datepicker" type="text"
								placeholder="mm/dd/yy" name="enddate" id="eddt" />
						</div>
					</div>
				</div>
				<div class="roww second">
					<div class="input-wrap">
						<div class="input-field underlineHover">
							<label>포함할 검색어</label> <input type="text" name="includekeyword"
								id="inkey" />
						</div>
					</div>
					<div class="input-wrap">
						<div class="input-field underlineHover">
							<label>제외할 검색어</label> <input type="text" name="excludekeyword"
								id="exkey" />
						</div>
					</div>
				</div>

				<div class="searchbtn text-center" id="btnsch">
					<button class="col-sm-2 btn-search" type="button"
						onclick="ksearch();">키워드검색</button>
					<button class="col-sm-2 btn-search" type="button"
						onclick="nsearch();">뉴스검색</button>
					<button class="col-sm-2 btn-search" type="button"
						onclick="csearch();">기업검색</button>
					<button class="col-sm-2 btn-search" type="button"
						onclick="rsearch();">공채검색</button>
					<button class="col-sm-2 btn-outline-success" type="button"
						onclick="rsearch();">추천</button>
				</div>
			</div>
		</div>
	</form>
</div>

<script
	src="<%=application.getContextPath()%>/resource/js/extention/choices.js"></script>
<script>
	const choices = new Choices('[data-trigger]', {
		searchEnabled : false,
		itemSelectText : '',
	});
</script>
<script
	src="<%=application.getContextPath()%>/resource/js/extention/flatpickr.js"></script>
<script>
	flatpickr(".datepicker", {
		dateFormat : "m/d/y"
	});
	var btnTypes = document.querySelectorAll('.travel-type-wrap.item')
	var mainForm = document.getElementById('main-form')
	for (let i = 0; i < btnTypes.length; i++) {
		btnTypes[i].addEventListener('click', function() {
			for (let i = 0; i < btnTypes.length; i++) {
				btnTypes[i].classList.remove('active')
			}
			btnTypes[i].classList.add('active')
			let className = 'type' + i
			mainForm.className = `${className} main-form`
		})
	}
</script>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<!--왜인지 얘가 있어야 닫기 버튼이 닫힘-->
	</div>
	<div class="wrapper fadeInDown" id="myModal">
		<div id="formContent">
			<!-- Tabs Titles -->

			<!-- Icon -->
			<div class="fadeIn first">
				<img
					src="<%=application.getContextPath()%>/resource/img/com_path.png"
					id="icon" alt="User Icon" />
				<h1>로그인 하세요.</h1>
			</div>

			<!-- Login Form -->
			<!-- password에 css 적용 -->
			<form action="login.do">
				<input type="text" id="login" class="fadeIn second" name="id"
					placeholder="username"> <input type="text" id="password"
					class="fadeIn third text" name="pw" placeholder="password">
				<input type="submit" class="fadeIn fourth" value="Log In">
			</form>

			<!-- Remind Passowrd -->
			<div id="formFooter">
				<a class="underlineHover" href="user_register.do">회원가입</a> <a
					class="underlineHover" href="user_idsearch.do">ID/PW찾기</a>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>