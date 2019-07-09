<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.comp.CompanyEntity,java.util.*,com.comp.recruit.RecruitEntity"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	List<CompanyEntity> compinfo = (List<CompanyEntity>) request.getAttribute("compinfo");
	List<RecruitEntity> comprecruit = (List<RecruitEntity>) request.getAttribute("comprecruit");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->

<title>7.기업정보+검색</title>

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



</head>
<script>
function comppaging(page,crp_nm_i) {
      /* $.ajax({
         url : "news_all.do",
         async : false,
         success :function(data) {
            list = data;
            // res는 페이징 처리할 리스트입니다
         }
      }); */
      // 페이지 네비게이션의 숫자(value) 를 클릭하여 페이지가 넘어가는 상황입니다
      if(!crp_nm_i){
         loadpage(page);
      }else{
         loadpageandtitle(page,crp_nm_i);   
      }
      
      
   };

   function pageover(lastpage,title) {
      if(!title){
         location.href="comp_list.do?page=" + lastpage + "&crp_nm_i=" + "";
      }else{
         location.href="comp_list.do?page=" + lastpage + "&crp_nm_i=" + title;
      }
   };
   function pagepre(prepage,title) {
      if(!title){
         if(prepage < 5){
            alert("첫 페이지입니다")
            location.href="#"
         }else{
            location.href="comp_pre.do?page=" + (prepage -5) + "&crp_nm_i=" + "";
         }
      }else{
         if(prepage < 5){
            alert("첫 페이지입니다")
            location.href="#"
         }else{
            location.href="comp_pre.do?page=" + (prepage -5)+ "&crp_nm_i=" + title;
         }
      }
      
   };
</script>
<script>
   function loadpage(page){
      location.href = "comp_list.do?page=" + page + "&crp_nm_i=" + "";
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
      location.href = "comp_list.do?page=" + cnt + "&crp_nm_i=" + title;

   }
</script>


<body>
	<!-- 헤더 들어가는 부분 -->

	<jsp:include page="../main/menubar.jsp"></jsp:include>
	<!--          /*         function go_comp_info(a){   // readMore 버튼을 누르면 comp_detail로 crp_no와 함께 넘어간다.
    $.ajax({
    url:"comp_detail.do?crp_no="+a,
    data : $(this).value, 
    async : false,
    success : function(data){
   
    }
   
    });

    }
    */

   /*     function gocompdetail(crp_no){
    var flag = confirm("기업 정보로 이동하시겠습니까?");
    if(flag == true){
    window.open("/comp_info.do?crp_no="+crp_no,'_self');
    }
    }
    */
   function gocompdetail(crp_no) { //  crp_no를 들고 comp_info.do로 가는 기능
      location.href = "comp_info.do?crp_no=" + crp_no;

   }
   ;

}; -->

	<!-- 메인컨텐츠 -->

	<div class="blog-section paddingTB60 ">
		<div class="container">
			<div class="row">
				<div class="site-heading text-center">
					<h3>Company Information</h3>
					<p>검색키워드와 유사한 기업들 중 가장 많은 조회수의 기업순대로 나오는건?</p>
					<div class="border"></div>
				</div>
			</div>
			<script type="text/javascript">
            function compdetail(compname) {
               location.href = "comp_info.do?crp_nm_i=" + compname;
            };
            /* function findcomp(comp_name) {
               $.ajax({
                  url : "comp_find.do",
                  method : "GET",
                  data : "comp_name=" + comp_name,
                  success : new function(crpno) {
                     return crpno;
                  }
               });
            }; */
            </script>
			<%
				int length = 0;
			%>

			<%
				if (compinfo.size() < 9) {
			%>

			<%
				length = compinfo.size();
			%>

			<%
				} else {
			%>

			<%
				length = 9;
			%>

			<%
				}
			%>
			<div class="row">

				<%
					for (int i = 0; i < length; i++) {
				%>



				<div class="flex col-md-4 ">
					<div>
						<div class="blog-box">
							<div class="blog-box-image">
								<!--   /*  String image = null;
				 if(comprecruit[i].getRegLogImgNm == null){
				image = "만든 이미지 링크";
				 }else{
				   image = "${comprecruit[i].regLogImgNm}";
				 } */    %> -->
								<img style="width: 250px; height: 200px" src=""
									<%--<%=image%>--%>
                           class="img-responsive"
									alt="">
							</div>
							<div class="blog-box-content">
								<h4>

									<a
										href="comp_info.do?crp_nm_i=<%=compinfo.get(i).getCrp_nm_i()%>">
										<%=compinfo.get(i).getCrp_nm()%></a>
								</h4>
								<button
									onclick="compdetail('<%=compinfo.get(i).getCrp_nm_i()%>')"
									class="btn btn-dsssefault site-btn">Read More</button>

								<!-- sample -->
							</div>
						</div>
					</div>
					<!-- End Col -->
				</div>

				<%
					}
				%>

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
			</div>
			<div class="row mb-2">
				<div class="col-md-12">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center" id="pagelist">
							<li class="page-item"><span aria-hidden="true"><a
									class="page-link" href="javascript:void(0);"
									onclick="pagepre(<%=cpage%>,'${crp_nm_i}');"
									aria-label="Previous">«</a></span> <span class="sr-only">Previous</span></li>

							<%
								for (int k = cpage; k < cpage + 5; k++) {
							%>
							<li class="page-item"><a class="page-link"
								href="javascript:void(0);"
								onclick="comppaging(<%=k%>,'${crp_nm_i}');" id="page1"><%=k%></a></li>
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
									onclick="pageover(<%=cpage+5%>,'${crp_nm_i}')"
									aria-label="Next">»</a></span> <span class="sr-only">Next</span></li>
						</ul>
					</nav>
				</div>

			</div>
		</div>
	</div>

	<hr />
	<!-- 푸터 들어가는 부분 -->
	<jsp:include page="../main/footer.jsp"></jsp:include>

</body>

</html>
