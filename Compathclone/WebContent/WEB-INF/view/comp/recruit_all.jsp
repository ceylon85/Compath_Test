<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.comp.recruit.*,java.util.*"%>
<%
	List<RecruitEntity> recruitinfo = (List<RecruitEntity>) request.getAttribute("recruitlist");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->

<title>6.공채결과+검색 com:path</title>

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
<script>
function recpaging(page,empBusiNm) {
      /* $.ajax({
         url : "news_all.do",
         async : false,
         success :function(data) {
            list = data;
            // res는 페이징 처리할 리스트입니다
         }
      }); */
      // 페이지 네비게이션의 숫자(value) 를 클릭하여 페이지가 넘어가는 상황입니다
      if(!empBusiNm){
         loadpage(page);
      }else{
         loadpageandtitle(page,empBusiNm);   
      }
      
      
   };

   function pageover(lastpage,empBusiNm) {
      if(!empBusiNm){
         location.href="recruit_list.do?page=" + lastpage + "&empBusiNm=" + "";
      }else{
         location.href="recruit_list.do?page=" + lastpage + "&empBusiNm=" + empBusiNm;
      }
   };
   function pagepre(prepage,empBusiNm) {
      if(!empBusiNm){
         if(prepage < 5){
            alert("첫 페이지입니다")
            location.href="#"
         }else{
            location.href="recruit_pre.do?page=" + (prepage -5) + "&empBusiNm=" + "";
         }
      }else{
         if(prepage < 5){
            alert("첫 페이지입니다")
            location.href="#"
         }else{
            location.href="recruit_pre.do?page=" + (prepage -5)+ "&empBusiNm=" + empBusiNm;
         }
      }
      
   };
</script>
<script>
   function loadpage(page){
      location.href = "recruit_list.do?page=" + page + "&empBusiNm=" + "";
   }
   
   
   function loadpageandtitle(cnt,empBusiNm) {
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
      location.href = "recruit_list.do?page=" + cnt + "&empBusiNm=" + empBusiNm;

   }
</script>
</head>

<body>
	<!-- 헤더 들어가는 부분 -->
	<jsp:include page="../main/menubar.jsp"></jsp:include>
	<div class="container">
		<br />
		<section style="text-align: center;">
			<h1>공채 정보</h1>
		</section>
		<br />
		<!-- 메인컨텐츠 -->
		<section>
			<script>
    
    
			
			
	function gorecruitdetail(data) {  
       location.href = "recruit_detail.do?empSeqno=" + data;

        };
    </script>
			<div class="row">
				<%
					int length = 0;
				%>
				<%
					if (recruitinfo.size() < 40) {
				%>
				<%
					length = recruitinfo.size();
				%>
				<%
					} else {
				%>
				<%
					length = 40;
				%>
				<%
					}
				%>

				<%
					for (int i = 0; i < length; i++) {
				%>
				<div class="col-sm-3">
					<div class="blog-box" style="text-align: center;">
						<div class="blog-box-image">
							<img src=<%=recruitinfo.get(i).getRegLogImgNm()%>
								style="width: 100" height="100px" alt="">
						</div>
						<hr />
						<!--Why Not Put a Picture To Celebrate Your 404-->
						<strong><%=recruitinfo.get(i).getEmpBusiNm()%></strong><br />
						<p
							style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
							<%=recruitinfo.get(i).getEmpWantedTitle()%></p>
						<a href="javascript:void(0);"
							onclick="gorecruitdetail(<%=recruitinfo.get(i).getEmpSeqno()%>);"
							class="btn btn-outline-success btn-large"> <i
							class="icon-share icon-white">Read More</i></a>
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
									onclick="pagepre(<%=cpage%>,'${empBusiNm}');"
									aria-label="Previous">«</a></span> <span class="sr-only">Previous</span></li>

							<%
									for (int k = cpage; k < cpage + 5; k++) {
								%>
							<li class="page-item"><a class="page-link"
								href="javascript:void(0);"
								onclick="recpaging(<%=k%>,'${empBusiNm}');" id="page1"><%=k%></a></li>
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
									onclick="pageover(<%=cpage+5%>,'${empBusiNm}')" aria-label="Next">»</a></span>
								<span class="sr-only">Next</span></li>
						</ul>
					</nav>
				</div>
			</div>

		</section>
		<br /> <br />
		<hr />
		<!-- 푸터 들어가는 부분 -->
		<jsp:include page="../main/footer.jsp"></jsp:include>
		<!--// 푸터 들어가는 부분 -->
	</div>

</body>

</html>