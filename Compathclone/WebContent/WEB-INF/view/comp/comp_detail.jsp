<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.comp.recruit.* ,java.util.*,com.comp.CompanyEntity"%>

<%
	List<CompanyEntity> compinfo = (List<CompanyEntity>) request.getAttribute("compinfo");

	List<RecruitEntity> comprecruit = (List<RecruitEntity>) request.getAttribute("comprecruit");
%>

<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->

<title>8.각기업정보</title>

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
<link rel="stylesheet" type="text/css" href="/resource/css/main.css">
<!-- Bootstrap core CSS -->
<link href="/resource/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resource/css/login.css">
<link href="resource/css/searchmain.css" rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,900|Poppins:700"
	rel="stylesheet" />

</head>

<body>
	<!-- 헤더 들어가는 부분 -->
	<jsp:include page="../main/menubar.jsp"></jsp:include>
	<hr />
	<br>
	<div class="container" align="center">
		<div class="comdiv1" align="center">
			<img style="width: 250px; height: 200px"
				src="${comprecruit[0].regLogImgNm}" alt="기업로고가 없습니다" />
			<h1 class="separator"><%=compinfo.get(0).getCrp_nm()%></h1>
		</div>
		<br> <br>
		<h2>
			CEO :
			<%=compinfo.get(0).getCeo_nm()%>
			<br> TEL :
			<%=compinfo.get(0).getPhn_no()%>
			<br> ADR :
			<%=compinfo.get(0).getAdr()%>
			<br> <a href="http://<%=compinfo.get(0).getHm_url()%>"><%=compinfo.get(0).getHm_url()%></a>
		</h2>

		<hr>
		<br>
		<div class="comdiv2 row">
			<div class="col-sm">
				시각화 제목
				<div class="card-body">
					<h4 class="card-title">시각화</h4>
					<p class="card-text"></p>
				</div>
			</div>
			<div class="col-sm">
				시각화 제목
				<div class="card-body">
					<h4 class="card-title">시각화</h4>
					<p class="card-text"></p>
				</div>
			</div>
			<div class="col-sm">
				시각화 제목
				<div class="card-body">
					<h4 class="card-title">시각화</h4>
					<p class="card-text"></p>
				</div>
			</div>
			<div class="col-sm">
				시각화 제목
				<div class="card-body">
					<h4 class="card-title">시각화</h4>
					<p class="card-text"></p>
				</div>
			</div>
		</div>
		<hr>
		<br> <br>
		<h2 class="separator" align="center">해당 기업의 Dart 정보</h2>
		<br>
		<h6 align="right">
			<a
				href="http://dart.fss.or.kr/dsaf001/main.do?rcpNo=<%=compinfo.get(0).getRcp_no()%>">재무재표
				보기 </a>
		</h6>
		<br>
		<div>
			
            /* function gorecruitdetail(empSeqno){
               
               location.href="recruit_detail.jsp?empSeqno="+${empSeqno};
               
            } */
           
            
            function gorecruitdetail(empSeqno) {  //  empSeqno를 들고 recruit_detail.jsp 로 간다. 
               location.href = "recruit_detail.do?empSeqno="+empSeqno;
                 };
            
            
         </script>
		</div>
		<div>aa</div>
		<br> <br>
		<hr />
		<br /> <br /> <br /> <br />


		<div>
			<h3 class="separator" align="center">해당 기업의 관계도 차트</h3>
			<div class="container-fluid">
			<div id="chartdiv" style="width:100%; height:500px;">
			<script src="js/core.js"></script>
			<script src="js/charts.js"></script>
			<script src="plugins/forceDirected.js"></script>
			<script src="themes/animated.js"></script>
			<script src="js/forceDirected.js"></script></div>
			
			<div class="AdjustBar">
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
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
								class="sr-only">Next</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
		<br> <br>
		<div align="center">
			<h4 class="separator">함께 언급되는 기업 목록</h4>
			<div id="chartdiv3" style="width:100%; height:500px;">
			<script src="js/core.js"></script>
			<script src="js/charts.js"></script>
			<script src="plugins/forceDirected.js"></script>
			<script src="themes/animated.js"></script>
			<script src="js/forceDirected-tree.js"></script></div>
			<div class="card-body">
				<p class="card-text">With supporting text below as a natural
					lead-in to additional content.</p>
			</div>
		</div>
		<br> <br> <br> <br>
		<hr>
		<br> <br> <br> <br>
		<div class="row">
			<div class="col-sm">
				<h1 class="separator">해당 기업 관련 뉴스 리스트</h1>
				<div class="bd-example" align="left">
					<ul class="list-unstyled">
						<li class="media">
							<div class="media-body">
								<h5 class="mt-0 mb-1">뉴스 1</h5>
								동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려 강산 대한사람 대한으로 길이
								보전하세 남산 위에 저 소나무 철갑을 두른듯 바람서리 불변함은 우리 기상일세 무궁화 삼천리 화려 강산 대한사람
								대한으로 길이 보전하세.
							</div> <a href="#" class="card-link">Read More</a>
						</li>
						<li class="media my-4">
							<div class="media-body">
								<h5 class="mt-0 mb-1">뉴스 2</h5>
								동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려 강산 대한사람 대한으로 길이
								보전하세 남산 위에 저 소나무 철갑을 두른듯 바람서리 불변함은 우리 기상일세 무궁화 삼천리 화려 강산 대한사람
								대한으로 길이 보전하세.
							</div>
						</li>
						<li class="media">
							<div class="media-body">
								<h5 class="mt-0 mb-1">뉴스 3</h5>
								동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려 강산 대한사람 대한으로 길이
								보전하세 남산 위에 저 소나무 철갑을 두른듯 바람서리 불변함은 우리 기상일세 무궁화 삼천리 화려 강산 대한사람
								대한으로 길이 보전하세.
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-sm">
				<h1 class="separator">연관기업 뉴스 리스트</h1>
				<div class="bd-example" align="left">
					<ul class="list-unstyled">
						<li class="media">
							<div class="media-body">
								<h5 class="mt-0 mb-1">뉴스 1</h5>
								동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려 강산 대한사람 대한으로 길이
								보전하세 남산 위에 저 소나무 철갑을 두른듯 바람서리 불변함은 우리 기상일세 무궁화 삼천리 화려 강산 대한사람

							</div>
						</li>
						<li class="media my-4">
							<div class="media-body">
								<h5 class="mt-0 mb-1">뉴스 2</h5>
								동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려 강산 대한사람 대한으로 길이
								보전하세 남산 위에 저 소나무 철갑을 두른듯 바람서리 불변함은 우리 기상일세 무궁화 삼천리 화려 강산 대한사람
								대한으로 길이 보전하세.
							</div>
						</li>
						<li class="media">
							<div class="media-body">
								<h5 class="mt-0 mb-1">뉴스 3</h5>
								동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려 강산 대한사람 대한으로 길이
								보전하세 남산 위에 저 소나무 철갑을 두른듯 바람서리 불변함은 우리 기상일세 무궁화 삼천리 화려 강산 대한사람
								대한으로 길이 보전하세.
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<br> <br> <br>
		<hr>
		<br> <br> <br>


		<!-- 최신 채용공고 -->
		<h1 class="separator ">해당 기업 채용공고</h1>
		<br>
		<div class="card-group card-columns">

			<%
				int length = comprecruit.size();
			%>

			<%
				for (int i = 0; i < length; i++) {
			%>
			<div class="card" style="width: 20rem;">
				<div class="card-body">
					<h4 class="card-title"><%=comprecruit.get(i).getEmpBusiNm()%></h4>
					<h6 class="card-subtitle mb-2 text-muted"><%=comprecruit.get(i).getCoClcdNm()%></h6>
					<p class="card-text"><%=comprecruit.get(i).getEmpWantedTitle()%>}
					</p>
					<a href="javascript:void(0);"
						onclick="gorecruitdetail(<%=comprecruit.get(i).getEmpSeqno()%>)"
						class="card-link">Read More</a>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
	</div>
	<hr />
	<!-- 푸터 들어가는 부분 -->
	<jsp:include page="../main/footer.jsp"></jsp:include>
	<!--// 푸터 들어가는 부분 -->
</body>

</html>