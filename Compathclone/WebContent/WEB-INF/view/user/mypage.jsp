<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@page import = "java.util.*" %>
<% String root=request.getContextPath(); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% Object mypage = request.getAttribute("mypage"); %>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->

<title>9.마이페이지 com:path</title>

<!-- 부트스트랩 -->

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

<script type="text/javascript">

/* 뉴스 디테일, 관심목록에서 삭제 function */
	<%-- function newsDetail(news_number) { //.do 이름 확인
		var win = window.open("news_detail.do?news_number=" + news_number, '_blank');
		win.focus();
	}; --%>
	
	function unlikeMyNews(news_number,id){
		var flag=window.confirm(news_number+"번 뉴스를 "+id+"님의 관심 목록에서 제거합니다");
		if(flag){
		$.ajax({
			type: "GET",
			url: "/mynews_unlike.do?news_number="+news_number+"&id="+id,
			dataType : "text",
			error : function() {
				alert("제거 실패");
			},
			success : function(data) {
				alert("관심 목록에서 제거되었습니다");
				$('#mynewslist').load("<%=root%>/mypage.do?id=${id} #mynewslist");
			}
		});
		}
	};
	

	
	/* 기업 디테일, 관심목록에서 삭제 function */
	function compDetail(crp_no) {
		var win = window.open("comp_detail.do?crp_no=" + crp_no, '_blank');
		win.focus();
	};
	function unlikeMyComp(crp_no,id){
		var flag=window.confirm(crp_no+"번 기업을 "+id+"의 관심 목록에서 제거합니다");
		if(flag){
		$.ajax({
			type: "GET",
			url: "/mycomp_unlike.do?crp_no="+crp_no+"&id="+id,
			dataType : "text",
			error : function() {
				alert("제거 실패");
			},
			success : function(data) {
				alert("관심 목록에서 제거되었습니다");
				$('#mycomplist').load("<%=root%>/mypage.do?id=${id} #mycomplist");
			}
		});
		}
	};

	
	
	/* 채용  디테일, 관심목록에서 삭제  function */
/* 	function recDetail(empSeqno) {
		var win = window.open("recruit_detail.do?empSeqno=" + num, '_blank');
		win.focus();
	}; */

	function unlikeMyRec(empSeqno,id){
		var flag=window.confirm(empSeqno+"번 채용공고를 "+id+"의 관심 목록에서 제거합니다");
		if(flag){
		$.ajax({
			type: "GET",
			url: "/mynews_unlike.do?news_number="+empSeqno+"&id="+id,
			dataType : "text",
			error : function() {
				alert("제거 실패");
			},
			success : function(data) {
				alert("관심 목록에서 제거되었습니다");
				$('#myrecruitlist').load("<%=root%>/mypage.do?id=${id} #myrecruitlist");
			}
		});
		}
	};
	
	

	///////나의 스크랩북 부분 function////////
		
	//스크랩북 자세히 보기
	function sbDetail(scrapbook_num){
		var win = window.open("sbook_content.do?scrapbook_num=" + scrapbook_num, '_blank');
		win.focus();
	};
	
	/* 스크랩북 관심목록에서 삭제 */
	function unlikeSbook(sbook_number,id){
		var flag=window.confirm(sbook_number+"번 스크랩북을 "+id+"의 관심 목록에서 제거합니다");
		if(flag>0){
		$.ajax({
			type: "GET",
			url: "/mysbook_unlike.do?sbook_number="
						+ sbook_number + "&id=" + id,
				dataType : "text",
				error : function() {
					alert("제거 실패");
				},
				success : function(data) {
					alert("관심 목록에서 제거되었습니다");
					$('#mysbooklike').load("<%=root%>/mypage.do?id=${id} #mysbooklike");
				}
			});
		}
	};

	function createSbook() {
		var flag = confirm("스크랩북을 새로 만드시겠습니까?");
		if (flag) {
			var win = window.open("sbook_create.do?id=${id}", '_self');
			win.focus();
		}
	};
	function editSbook(num, id) {
		var confirmflag = confirm("수정 페이지로 이동합니다");
		if (confirmflag) {
			var win = window.open("sbook_toedit.do?scrapbook_num=" + num+"&id="+id,'_self');
		}
	};
	function deleteSbook(num,id) {
		var confirmflag = confirm("해당 스크랩북이 삭제됩니다. 삭제하시겠습니까?");
		if (confirmflag) {
			$.ajax({
				type : "GET", //기본이 get
				url : "sbook_delete.do?scrapbook_num=" + num+"&id="+id,
				dataType : "text",
				error : function() {
					window.alert("삭제 실패했습니다.");
				},
				success : function(data) {
					window.alert("삭제 성공했습니다.");
					$('#myownsblist').load("<%=root%>/mypage.do?id=${id} #myownsblist");
				}
			});
		} else {
		}
	};

	function shareSbook(num) {
		var flag = confirm("해당 스크랩북을 공유하시겠습니까?");
		if (flag) {
			$.get( "sbook_share.do?scrapbook_num="+num, function(){
				alert("공유에 성공하였습니다");
				location.href="mypage.do?id="+${id};})
			  .fail(function() {
			    alert( "error" );
			  })
			  .always(function() {
				  location.href="mypage.do?id="+${id};
			  });
            
		} else {
            location.href="mypage.do?id="+${id};
		}
	}
</script>
</head>

<body>
	<!-- 헤더 들어가는 부분 -->
	<jsp:include page="../main/menubar.jsp" />

	<hr />
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<br> <br> <br> <br>
				<!-- 오늘의 키워드 -->
				<div class="container">

					<h1 class="separator">검색 키워드 워드클라우드</h1>
					<!-- protovis로 띄운다 -->
					<div id="chartdiv" style="width:100%; height:350px;"></div>
					<script src="resource/js/core.js"></script>
					<script src="resource/js/charts.js"></script>
					<script src="resource/plugins/wordCloud.js"></script>
					<script src="resource/themes/animated.js"></script>
					<script src="resource/js/word-cloud-changing-data.js"></script>

					<div class="container-fluid text-center">
						<br> <br>
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
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										<span class="sr-only">Next</span>
								</a></li>
							</ul>
						</nav>
					</div>
					<!-- 해당 키워드 언급량 (연관 키워드 ~3위까지 보여줌) -->
					<div id="chartdiv1" style="width:100%; height:350px;"></div>
					<script src="resource/js/core.js"></script>
					<script src="resource/js/charts.js"></script>
					<script src="resource/themes/animated.js"></script>
					<script src="resource/themes/dark.js"></script>
					<script src="resource/js/adding-live-data.js"></script>
					<br> <br>
					<hr>
					<br> <br>
					<h3 align="center">워드클라우트 버블차트 + 조절바</h3>
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">«</span> <span
								class="sr-only">Previous</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item active"><a class="page-link" href="#">2<span
								class="sr-only">(current)</span></a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">»</span> <span
								class="sr-only">Next</span>
						</a></li>
					</ul>

					<br> <br>
					<hr>
					<br> <br>
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
					<br> <br>
					<hr>
					<br> <br>
					<h1 align="center">나의 관심 기업</h1>
					<c:forEach var="comp" items="${requestScope.mycomplist}">
						<div class="card mb-3 mysnews">
							<div class="card-body">
								<h4>${comp.crp_no }</h4>
								<p>contents: ${comp.hm_url }</p>
								<div onclick="compDetail('${comp.crp_no }')"
									style="font-size: small;">자세히보기</div>
								<div onclick="unlikeMyComp('${comp.crp_no}','${id}')">삭제</div>
							</div>
						</div>
					</c:forEach>
					<br> <br>
					<hr>
					<br> <br>
					<div class="col-md-12">
						<jsp:include page="../main/calendar.jsp"></jsp:include>
					</div>
					<br> <br>
					<hr>
					<br> <br>
					<h1 align="center">나의 관심 채용정보</h1>
					<c:forEach var="rec" items="${requestScope.myrecruitlist}">
						<div class="card mb-3 mysnews">
							<div class="card-body">
								<h4>${rec.empSeqno }</h4>
								<p>contents: ${rec.empWantedTitle }</p>
								<div onclick="recDetail('${rec.empSeqno }')"
									style="font-size: small;">자세히보기</div>
								<div onclick="unlikeMyRec('${rec.empSeqno}','${id}')">삭제</div>
							</div>
						</div>
					</c:forEach>
					<br> <br>
					<hr>
					<br> <br>
					<h1 align="center">나의 스크랩북</h1>
					<div onclick="createSbook()" align="right">
						<button>새로만들기</button>
					</div>
					<div class="container">
						<div class="col">
							<c:forEach var="sblike" items="${requestScope.mysbooklike}">
								<div class="card mysnews">
									<div class="card-body">
										<h4>${sblike.title }</h4>
										<p>작성자: ${sblike.id }</p>
										<div onclick="sbDetail('${sblike.scrapbook_num }')"
											style="font-size: small;">자세히보기</div>
										<div onclick="unlikeSbook('${sblike.crp_no}','${id}')">삭제</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="col">
							<div id="myownsblist">
							<c:forEach var="mysb" items="${requestScope.myownsblist }">
								<div class="card mysnews">
									<div class="card-body">
										<div onclick="sbDetail('${mysb.scrapbook_num }')"> <h4>${mysb.title } </h4></div>
										<p>작성자: ${mysb.id }</p>
										<div onclick="sbDetail('${mysb.scrapbook_num }')"
											style="font-size: small;"><button>자세히보기</button></div>
										<div onclick="deleteSbook('${mysb.scrapbook_num}')"><button>삭제</button></div>
										<div onclick="editSbook('${mysb.scrapbook_num}','${id}')"><button>수정</button></div>
										<div onclick="shareSbook('${mysb.scrapbook_num}')"><button>공유하기</button></div>
									</div>
								</div>
							</c:forEach>
							</div>
						</div>
					</div>


					<!-- row end -->
				</div>
				<!-- container end -->
			</div>
			<br> <br>
			<hr>
			<br> <br>

			<!-- 푸터 들어가는 부분 -->
			<hr />
			<jsp:include page="../main/footer.jsp"></jsp:include>
			<!-- Modal -->

		</div>
	</div>
</body>

</html>