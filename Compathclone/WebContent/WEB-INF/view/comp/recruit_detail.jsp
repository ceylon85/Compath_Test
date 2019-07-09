<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.comp.recruit.*"%>
<%
	List<RecruitEntity> recruitdetail = (List<RecruitEntity>)request.getAttribute("recruit_detail");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->

<title>5.공채페이지 com:path</title>

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
	<link rel="stylesheet" type="text/css"
	href="resource/css/jobk.css">
</head>


<body>
	<!-- 헤더 들어가는 부분 -->
	<jsp:include page="../main/menubar.jsp"></jsp:include>
	<hr />
	<br>

	<br>


	<div class="container">
	<section class="secReadSummary  ">
			<h2 class="hd_2 blind">요약정보</h2>
			<div class="readSumWrap clear">
				<article class="artReadJobSum">
					<div class="sumTit">
						<h3 class="hd_3">
							<span class="coName">
								${recruit_detail[0].empBusiNm}
								<!-- 삼성화재해상보험㈜ -->
							</span>${recruit_detail[0].empWantedTitle}
							<!-- 2019년 사무직군 채용 -->
						</h3>
					</div>
					<div class="tbRow clear">
						<div class="tbCol ">

							<h4 class="hd_4">지원자격</h4>
							<dl class="tbList">
								<dt>경력</dt>
								<dd>
									<strong class="col_1">${recruit_detail[0].empWantedEduNm1}</strong>
								</dd>
								<dt>학력</dt>
								<dd>
								<!-- 특수문자 날아가면서 텍스트가 상당히 어색해짐, mongo에서 가져올때는 값 그대로 오거나
								특문 기준으로 파싱 -->
									<strong class="col_1">${recruit_detail[0].sptCertEtc1}</strong></dd>
							</dl>
						</div>
						<div class="tbCol ">
							<!-- 현재 구할 수 없는 값입니다, 공채상세의 기타란에 적히는 경우도 있긴 합니다 -->
							<h4 class="hd_4">근무조건</h4>
							<dl class="tbList">

								<dt>급여</dt>
								<!-- 재무재표에서 가져올수 있습니다 -->
								<dd><!-- 현재 구할 수 없는 값입니다 -->
									<em class="dotum"></em> 회사내규에 따름
								</dd>
								<dt>지역</dt>
								<dd>
									<a>전국</a>
								</dd>
							</dl>
						</div>
						
						<div class="tbCol tbCoInfo">
							<h4 class="hd_4">기업정보</h4>

							<div class="tbLogo">
								<div class="logo">
									<p><!-- /Company/1873552/?C_IDX=30 ??? -->
										<a title="새창" href="/Company/1873552/?C_IDX=30" target="_blank">
											<img name="cologo"width="100" height="40" 
												alt="기업 로고가 없습니다" src="${recruit_detail[0].regLogImgNm}"></a>
									</p>
								</div>
							</div>
							<dl class="tbList">

								<dt>산업(업종)</dt>
								<dd>
									<!-- api 한칸 밀려서 가라로 했습니다 나중에 수정해야합니다 -->
									${recruit_detail[0].jobsCd2}
								</dd>
								<dt>사원수</dt>
								<dd><!-- 현재 구할 수 없는 값입니다 -->
									<span class="tahoma">5,581</span>명
								</dd><!-- 현재 구할 수 없는 값입니다 -->
								<dt>설립년도</dt>
								<dd>
									<text>
										<span class="tahoma">1952</span>년 (<span class="tahoma">67</span>년차)
									</text>
								</dd>
								<dt>기업형태</dt>
								<dd>
									${recruit_detail[0].coClcdNm}
								</dd>
								<dt>홈페이지</dt>
								<dd>

									<span class="tahoma"><a class="devCoHomepageLink"
											onclick="javascript:void(0);"
											href="${recruit_detail[0].empWantedHomepg}">${recruit_detail[0].empWantedHomepg}</a></span>
								</dd>

							</dl>
						</div>
					</div>
				</article>
			</div>


			<p class="sumBtn">
<%-- http://${empWantedHomepg}
'/List_GI/GIB_Read_homepage_Link.asp?GI_NO=32319792','win_home');GI_Click_Cnt('','E05'); --%>
				<button  class="btn-primary"
					onclick="window.open('${recruit_detail[0].empWantedHomepg}');"
					type="button"><span>홈페이지 지원</span></button>
				<button class="btn-primary"
					onclick="" type="button"
					><span>스크랩</span></button>
			</p>

			<p class="deadlineInfo" id="devTimeGuide"></p>

		</section>
		<div class="row">

			<table class="table table-bordered success">
				<thead>
				<c:forEach begin="1" end="214">
				<th>기업이름</th>
				<td>${recruit_detail[0].empBusiNm}</td></tr>
				</c:forEach>
					<tr>
						<th>기업이름</th>
						<td>${recruit_detail[0].empBusiNm}</td>
						<%-- <td><%=recruitdetail.get(0).getEmpBusiNm()%></td> --%>
					</tr>
					<tr>
						<th class="info">기업규모</th>
						<td>${recruit_detail[0].coClcdNm}</td>
						<%-- <td><%=recruitdetail.get(0).getCoClcdNm()%></td> --%>
					</tr>
					<tr>
						<th class="info">공고내용</th>
						<td>${recruit_detail[0].empWantedTitle}</td>
						<%-- <td><%=recruitdetail.get(0).getEmpWantedTitle()%></td> --%>
					</tr>
					<tr>
						<th class="info">모집분야</th>
						<td>${recruit_detail[0].empWantedTypeNm}</td>
						<%-- <td><%=recruitdetail.get(0).getEmpWantedTypeNm()%></td> --%>
					</tr>

					<tr>
						<th class="info">공고시작일</th>
						<td>${recruit_detail[0].empWantedStdt}</td>
						<%-- <td><%=recruitdetail.get(0).getEmpWantedStdt()%></td> --%>
					</tr>
					<tr>
						<th class="info">공고마감일</th>
						<td>${recruit_detail[0].empWantedEndt}</td>
						<%-- <td><%=recruitdetail.get(0).getEmpWantedEndt()%></td> --%>
					</tr>
					<tr>
						<th class="info">기업 홈페이지</th>
						<td>${recruit_detail[0].empWantedHomepg}</td>
						<%-- <td><%=recruitdetail.get(0).getEmpWantedHomepg()%></td> --%>
					</tr>
					
					<tr>
						<th valign="top" class="info">Machine</th>
						<td>Machine1 , Machine2 , Machine3</td>
					</tr>
					<tr>
						<th class="info">Brand</th>
						<td>Audi</td>
					</tr>
					<tr>
						<th class="info">Specialization</th>
						<td>Lorem Ipsum that is dollor sign to write</td>
					</tr>

					<tr>
						<th class="info">Approval Status</th>
						<td><b>Active</b></td>
					</tr>

					<tr>
						<th class="info">Brand</th>
						<td>Audi</td>
					</tr>
					<tr>
						<th class="info">Specialization</th>
						<td>Lorem Ipsum that is dollor sign to write</td>
					</tr>

					<tr>
						<th class="info">Approval Status</th>
						<td><b>Active</b></td>
					</tr>

					<tr>
						<th class="info">Brand</th>
						<td>Audi</td>
					</tr>
					<tr>
						<th class="info">Specialization</th>
						<td>Lorem Ipsum that is dollor sign to write</td>
					</tr>

					<tr>
						<th class="info">Approval Status</th>
						<td><b>Active</b></td>
					</tr>

					<tr>
						<th class="info">Brand</th>
						<td>Audi</td>
					</tr>
					<tr>
						<th class="info">Specialization</th>
						<td>Lorem Ipsum that is dollor sign to write</td>
					</tr>

					<tr>
						<th class="info">Approval Status</th>
						<td><b>Active</b></td>
					</tr>

					<tr>
						<th class="info">Brand</th>
						<td>Audi</td>
					</tr>
					<tr>
						<th class="info">Specialization</th>
						<td>Lorem Ipsum that is dollor sign to write</td>
					</tr>

					<tr>
						<th class="info">Approval Status</th>
						<td><b>Active</b></td>
					</tr>
				</thead>

			</table>
		</div>
	</div>





	<!-- 푸터 들어가는 부분 -->
	<jsp:include page="../main/footer.jsp"></jsp:include>
	<!--// 푸터 들어가는 부분 -->

</body>

</html>