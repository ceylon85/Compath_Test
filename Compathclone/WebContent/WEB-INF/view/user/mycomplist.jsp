<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<h1>complist.jsp</h1>
	<c:forEach var="comp" items="${requestScope.mycomplist}">
		<div class="card mb-3 mysnews">
			<div class="card-body">
				<h4>${comp.crp_no }</h4>
				<p>contents: ${comp.hm_url }</p>
				<div onclick="compDetail('${comp.crp_no }')"
					style="font-size: small;">자세히보기</div>
				<div onclick="unlikeMyComp('${comp.crp_no}','${id})">삭제</div>
			</div>
		</div>
	</c:forEach>
