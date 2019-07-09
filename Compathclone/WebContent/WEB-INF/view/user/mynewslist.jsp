<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<h1>newslist.jsp</h1>
	<c:forEach var="news" items="${requestScope.mynewslist}">
		<div class="card mb-3 mysnews">
			<div class="card-body">
				<h4>${news.title }</h4>
				<p>contents: ${news.contents }</p>
				<div onclick="newsDetail('${news.news_number }')"
					style="font-size: small;">자세히보기</div>
				<div onclick="unlikeMyNews('${news.news_number}','${id })">삭제</div>
			</div>

		</div>
	</c:forEach>
