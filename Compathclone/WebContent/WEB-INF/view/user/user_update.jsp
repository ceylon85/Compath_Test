<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->

<title>로그인수정 com:path</title>

<!-- 부트스트랩 -->
<!-- 합쳐지고 최소화된 최신 CSS -->
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

<body>
	<!-- 헤더 들어가는 부분 include 할거니까 터져도 됩니다 -->

	<jsp:include page="../main/menubar.jsp"></jsp:include>

	<hr />
	<!-- 본문 들어가는 부분 -->


	<div class="container">

		<h1 style="text-align: left">회원정보 수정</h1>
		<div>
			<hr>
		</div>
		<form class="form-vertical" method="get" action="userupdate.do">
			<!-- 여기부터 -->

			<div class="row form-group" id="divId">
				<div class="col-sm-2">
					<label for="inputId" class="control-label">아이디</label>
				</div>
				<div class="col-sm-8">
					<input type="" class="form-control onlyAlphabetAndNumber" name="id"
						data-rule-required="true"
						placeholder="20자이내의 알파벳 소문자와 숫자 조합을 입력해주세요." readonly="readonly"
						maxlength="20">
				</div>
				<!-- <div class="col-sm-2">
					<button type="submit" class="btn btn-outline-info btn-light">중복확인</button>
				</div> -->
			</div>

			<div class="row form-group" id="divPassword">
				<div class="col-md-2">
					<label for="inputPassword" class="control-label">패스워드</label>
				</div>
				<div class="col-sm-8">
					<input type="password" class="form-control" name="pw"
						name="excludeHangul" data-rule-required="true"
						placeholder="영문 대소문자와 특수문자 포함 10자이상 20자이내로 입력해주세요 " maxlength="20">
				</div>
			</div>

			<div class="row form-group" id="divPasswordCheck">
				<div class="col-md-2">
					<label for="inputPasswordCheck" class="control-label">패스워드
						확인</label>
				</div>
				<div class="col-sm-8">
					<input type="password" class="form-control" id="passwordCheck"
						data-rule-required="true" placeholder="패스워드 확인" maxlength="20">
				</div>
			</div>

			<div class="row form-group" id="divAddress">
				<div class="col-md-2">
					<label for="inputAddress" class="control-label">주소</label>
				</div>
				<div class="col-sm-8">
					<input type="" class="form-control" name="address" id="addr"
						data-rule-required="true" placeholder="주소" maxlength="20">
				</div>
				<div class="col-2">
					<input type="button" class="btn btn-outline-info btn-light"
						onclick="execDaumPostcode()" value="우편번호 찾기">
				</div>
			</div>

			<div class="row form-group" id="divEmail">
				<div class="col-md-2">
					<label for="inputEmail" class="control-label">메일 주소</label>
				</div>
				<div class="col-sm-8">
					<input type="email" class="form-control" name="email"
						data-rule-required="true" placeholder="이메일" maxlength="20">
				</div>
				<div class="col-sm-2">
					<button type="button" class="btn btn-outline-info btn-light"
						id="emailchecker">중복확인</button>
				</div>
			</div>

			<div class="row form-group">
				<div class="col-md-2">
					<label for="inputEmailReceiveYn" class="control-label">이메일<br>수신여부
					</label>
				</div>
				<div class="col-sm-3">
					<!--BORDER 오른쪽 선에 색상을 줘서 구분선을 표현해보자-->
					<label class="radio-inline"><input type="radio"
						name="email_accept" value=1>동의</label>
					<div class="col-sm-1"></div>
					<label class="radio-inline"><input type="radio"
						name="email_accept" value=0>미동의</label>
				</div>

				<div class="col-md-2">
					<label for="inputGender" class="control-label">성별</label>
				</div>
				<div class="col-sm-3 form-group ">
					<label class="radio-inline"><input type="radio"
						name="gender" value="남">남성</label>
					<div class="col-sm-1"></div>
					<label class="radio-inline"><input type="radio"
						name="gender" value="여">여성</label>
				</div>
			</div>


			<div class="row form-group" id="divAge">
				<div class="col-md-2">
					<label for="inputAge" class="control-label">생년월일</label>
				</div>
				<div class="col-sm-8 form-group">
					<input type="date" class="form-control" name="birth"
						readonly="readonly">
				</div>
			</div>

			<div class="row form-group">
				<div class="col-sm-2">
					<label for="inputFinaleducation" class="control-label">최종학력</label>
				</div>
				<div class="col-sm-8">
					<select class="custom-select" name="final_education">
						<option selected>----------------최종학력을
							선택해주세요----------------</option>
						<option value="1">고졸</option>
						<option value="2">전문대졸(2,3년)</option>
						<option value="3">학사(4년)</option>
						<option value="3">대학원(석,박사)</option>
					</select>
				</div>
			</div>

			<div class="form-group row">
				<div class="col-sm-2 form-group">
					<label for="inputCareerduration" class="control-label">경력선택</label>
				</div>
				<div class="col-sm-8 form-group">
					<select class="custom-select" name="career_duration">
						<option selected>-------------------경력을
							선택해주세요-------------------</option>
						<option value="1">경력없음</option>
						<option value="2">1년이내</option>
						<option value="3">3년이내</option>
						<option value="3">3년이상</option>
					</select>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-lg-10" style="text-align: center">
					<button id="sign" type="submit"
						class="btn btn-outline-info btn-light ">정보 수정</button>
				</div>
			</div>
		</form>
	</div>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}
							WW

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('addr').value = data.zonecode;
							document.getElementById("addr").value += roadAddr;
							document.getElementById("addr").value += data.jibunAddress;

							// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							if (roadAddr !== '') {
								document.getElementById("extraAddress").value = extraRoadAddr;
							} else {
								document.getElementById("extraAddress").value = '';
							}

							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open();
			new daum.Postcode({
				oncomplete : function(data) {
					//data는 사용자가 선택한 주소 정보를 담고 있는 객체이며, 상세 설명은 아래 목록에서 확인하실 수 있습니다.
				}
			});
			new daum.Postcode({
				onclose : function(state) {
					//state는 우편번호 찾기 화면이 어떻게 닫혔는지에 대한 상태 변수 이며, 상세 설명은 아래 목록에서 확인하실 수 있습니다.
					if (state === 'FORCE_CLOSE') {
						//사용자가 브라우저 닫기 버튼을 통해 팝업창을 닫았을 경우, 실행될 코드를 작성하는 부분입니다.

					} else if (state === 'COMPLETE_CLOSE') {
						//사용자가 검색결과를 선택하여 팝업창이 닫혔을 경우, 실행될 코드를 작성하는 부분입니다.
						//oncomplete 콜백 함수가 실행 완료된 후에 실행됩니다.
					}
				}
			});
		}
	</script>
	<br>
	<!--// 본문 들어가는 부분 -->


	<hr />
	<!-- 푸터 들어가는 부분 -->
	<jsp:include page="../main/footer.jsp"></jsp:include>
	<!--// 푸터 들어가는 부분 -->

	<!-- Modal -->


</body>