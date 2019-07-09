<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.news.news, java.util.List"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->

<title>3뉴스 결과+검색 com:path</title>

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
<script
	src="https://pixinvent.com/bootstrap-admin-template/robust/app-assets/vendors/js/charts/raphael-min.js">
 </script>
<script
	src="https://pixinvent.com/bootstrap-admin-template/robust/app-assets/vendors/js/charts/morris.min.js">
 </script>
<script src="resource/js/donut-script2.js">
 </script>

<script>
	function newsnumfind(number) {
		location.href = "news_body.do?news_number=" + number;
	};

	function newspaging(page,title) {
		/* $.ajax({
		   url : "news_all.do",
		   async : false,
		   success :function(data) {
		      list = data;
		      // res는 페이징 처리할 리스트입니다
		   }
		}); */
		// 페이지 네비게이션의 숫자(value) 를 클릭하여 페이지가 넘어가는 상황입니다
		if(!title){
			loadpage(page);
		}else{
			loadpageandtitle(page,title);	
		}
		
		
	};

	function pageover(lastpage,title) {
		if(!title){
			location.href="news_list.do?page=" + lastpage + "&title=" + "";
		}else{
			location.href="news_list.do?page=" + lastpage + "&title=" + title;
		}
	};
	function pagepre(prepage,title) {
		if(!title){
			if(prepage < 5){
				alert("첫 페이지입니다")
				location.href="#"
			}else{
				location.href="news_pre.do?page=" + (prepage -5) + "&title=" + "";
			}
		}else{
			if(prepage < 5){
				alert("첫 페이지입니다")
				location.href="#"
			}else{
				location.href="news_pre.do?page=" + (prepage -5)+ "&title=" + title;
			}
		}
		
	};
</script>
<script>
	function loadpage(page){
		location.href = "news_list.do?page=" + page + "&title=" + "";
	}
	
	
	function loadpageandtitle(cnt,title) {
		/*  $.ajax({
		   type : "GET",
		   url : "news_list.do?page=" + cnt,
		   dataType : "text",
		   success : function(data) {
		      var res = data;
		   },
		   errer : function() {
		      alert("asas");
		   }
		});  */
		location.href = "news_list.do?page=" + cnt + "&title=" + title;

	}
</script>
</head>

<body>

	<!-- 헤더 들어가는 부분 -->
	<jsp:include page="../main/menubar.jsp"></jsp:include>
	<!-- 메인컨텐츠 -->
	<div id="cbody">
		<div class="container" id="newsContainer">
			<div id="content">
				<div class="contentBoxArea">

					<div class="contentBox">

						<div class="container">
							<div class="row">
								<div class="col-md-12">
									<h4>뉴스 보기</h4>
									<p>최신 뉴스를 확인하세요</p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-9">

									<!-- 뉴스 목록 나오는 부분 -->
									<div id="news1">


										<%
											List<news> newss = (List<news>) request.getAttribute("newslist");
											int length = 0;
										%>
										<%
											if (newss.size() < 10) {
										%>
										<%
											length = newss.size();
										%>
										<%
											} else {
										%>
										<%
											length = 10;
										%>
										<%
											}
										%>

										<%
											for (int j = 0; j < length; j++) {
										%>
										<div class="row mb-2">
											<div class="col-md-12">
												<div class="card">
													<div class="card-body">
														<div class="row">
															<div class="col-md-4">
																<img src="">
															</div>
															<div class="col-md-8">
																<div class="news_title">
																	<h5>
																		<a
																			href="news_body.do?news_number=<%=newss.get(j).getNews_number()%>">
																			<%=newss.get(j).getTitle()%>
																		</a>
																	</h5>
																</div>
																<div class="news-cats">
																	<ul class="list-unstyled list-inline mb-1">
																		<li class="list-inline-item"><i
																			class="fa fa-folder-o text-danger"></i> <a href="#"><small>
																					<%=newss.get(j).getCategory()%>
																			</small></a></li>
																		<li class="list-inline-item"><i
																			class="fa fa-folder-o text-danger"></i> <a href="#"><small>
																					<%=newss.get(j).getAuthor()%>
																			</small></a></li>
																		<li class="list-inline-item"><i
																			class="fa fa-folder-o text-danger"></i> <a href="#"><small>
																					<%=newss.get(j).getPostTime()%>
																			</small></a></li>
																	</ul>
																</div>
																<div class="news-content">
																	<p>
																		<%-- <%=newss.get(j).getContents().substring(40,60)%> --%>
																	</p>
																</div>
																<div class="news-buttons">
																	<input type="button"
																		class="btn btn-outline-danger btn-sm"
																		value="go detail"
																		onclick="newsnumfind(<%=newss.get(j).getNews_number()%>);" />
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>

										<%
											}
										%>


									</div>

									<%
										int cpage = 1;
									%>
									<%
										if ((Integer) request.getAttribute("cpage") == null) {
									%>
									<%
										cpage = 1;
									%>
									<%
										} else {
									%>
									<%
										if ((Integer) request.getAttribute("cpage") % 5 == 1) {
									%>

									<%
										cpage = (Integer) request.getAttribute("cpage");
									%>

									<%
										} else if ((Integer) request.getAttribute("cpage") % 5 == 0) {
									%>


									<%
										cpage = (Integer) request.getAttribute("cpage") - 4;
									%>


									<%
										} else if ((Integer) request.getAttribute("cpage") % 5 == 2) {
									%>

									<%
										cpage = (Integer) request.getAttribute("cpage") - 1;
									%>

									<%
										} else if ((Integer) request.getAttribute("cpage") % 5 == 3) {
									%>

									<%
										cpage = (Integer) request.getAttribute("cpage") - 2;
									%>


									<%
										} else if ((Integer) request.getAttribute("cpage") % 5 == 4) {
									%>

									<%
										cpage = (Integer) request.getAttribute("cpage") - 3;
									%>

									<%
										}
									%>
									<%
										}
									%>

									<div class="row mb-2">
										<div class="col-md-12">
											<nav aria-label="Page navigation example">
												<ul class="pagination justify-content-center" id="pagelist">
													<li class="page-item"><span aria-hidden="true"><a
															class="page-link" href="javascript:void(0);"
															onclick="pagepre(<%=cpage%>,'${title}');"
															aria-label="Previous">«</a></span> <span class="sr-only">Previous</span></li>

													<%
														for (int k = cpage; k < cpage + 5; k++) {
													%>
													<li class="page-item"><a class="page-link"
														href="javascript:void(0);"
														onclick="newspaging(<%=k%>,'${title}');" id="page1"><%=k%></a></li>
													<%
														}
													%>
													<!-- 리스트로 처리할거임 -->
													<!-- <li class="page-item"><a class="page-link"
													href="javascript:void(0);" onclick="newspaging();"
													id="page1">1</a></li>
												<li class="page-item"><a class="page-link"
													href="javascript:void(0);" onclick="newspaging();"
													id="page2">2</a></li>
												<li class="page-item"><a class="page-link"
													href="javascript:void(0);" onclick="newspaging();"
													id="page3">3</a></li>
												<li class="page-item"><a class="page-link"
													href="javascript:void(0);" onclick="newspaging();"
													id="page4">4</a></li>
												<li class="page-item"><a class="page-link"
													href="javascript:void(0);" onclick="newspaging();"
													id="page5">5</a></li> -->
													<li class="page-item"><span aria-hidden="true"><a
															class="page-link" href="javascript:void(0);"
															onclick="pageover(<%=cpage+5%>,'${title}')"
															aria-label="Next">»</a></span> <span class="sr-only">Next</span></li>
												</ul>
											</nav>
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="row mb-2">
										<div class="col-md-12">
											<h3>A keyword</h3>
											<div id="donut-chart1" class="height-360"></div>

											<div class="card">
												<div class="row">
													<div class="col-md-12">
														<div class="card">
															<div class="card-body">
																<h5>조회수 높은 기사 리스트 가지고 올까?</h5>
															</div>
														</div>
													</div>
												</div>
												<div class="list-group">
													<!--  href = "search.do~~~" -->
													
													<ol>
													<!-- 검색한 키워드와 관련된것 -->
														관련된 키워드
														<li><a href="#" >하나</a></li>
														<li><a href="#" >둘</a></li>
														<li><a href="#" >셋</a></li>
														<li><a href="#" >야</a></li>
														<li><a href="#" >!</a></li>
													</ol>
													
													<ol>관련된 기업
														<li><a href="#" >하나</a></li>
														<li><a href="#" >둘</a></li>
														<li><a href="#" >셋</a></li>
														<li><a href="#" >야</a></li>
														<li><a href="#" >!</a></li>
													</ol>
													
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="card">
												<div class="card-body">
													<img
														src="http://www.3forty.media/cannix/wp-content/uploads/2018/04/clem-onojeghuo-228522-unsplash-1-768x1153.jpg">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- mainContent -->
					<!-- contentBox -->
				</div>
				<!--container-->
			</div>
			<!-- contentBoxArea -->
		</div>
	</div>
	<!-- 메인컨텐츠 -->
	<hr />
	<!-- 푸터 들어가는 부분 -->
	<jsp:include page="../main/footer.jsp"></jsp:include>
	<!--// 푸터 들어가는 부분 -->

</body>
</html>