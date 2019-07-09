<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<h1>recruitlist.jsp</h1>
	<c:forEach var="rec" items="${requestScope.myrecruitlist}">
		<div class="card mb-3 mysnews">
			<div class="card-body">
				<h4>${rec.empSeqno }</h4>
				<p>contents: ${rec.empWantedTitle }</p>
				<div onclick="recDetail('${rec.empSeqno }')"
					style="font-size: small;">자세히보기</div>
				<div onclick="unlikeMyRec('${rec.empSeqno}','${id})">삭제</div>
			</div>

		</div>
	</c:forEach>
