<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.question.model.*"%>
<%
	QuestionVO queVO = (QuestionVO) request.getAttribute("queVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/back-end/css/BackHeaderCssLink"%>
<style type="text/css" media="screen">
table {
	border: 1px solid black;
	width: 100%;
	border-radius: 20px;
	background-color: #FFFF37;
}

tr {
	height: 100px;
}

.tital {
	
}

.button {
	text-align: left;
}

.content {
	width: 80%;
}

.content:focus {
	background-color: #84C1FF
}
</style>
</head>
<body>
	<!-- header -->

	<%@ include file="/back-end/css/header.jsp"%>
	<!-- header -->

	<div class="content d-md-flex">

		<!-- aside -->
		<%@ include file="/back-end/css/aside.jsp"%>
		<!-- aside -->
		<div class="container" style="background-color:#17a2b8">

			<!-- 	錯誤表列 -->
			<c:if test="${not empty errorMsgs}">
				<font style="color: red">請修正以下錯誤:</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color: red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>
			<div>
				<form action="<%=request.getContextPath()%>/Question/Question.do"
					method="post">
					<table>
						<tr>
							<th class="tital">問題</th>
							<td><input class="content" type="text" name="que"
								placeholder="輸入問題"></td>
						</tr>
						<tr>
							<th class="tital">答案</th>
							<td><textarea class="content" name="ans" id="" cols="30"
									rows="10" placeholder="對應的回答"></textarea></td>
						</tr>
						<tr>
							<td class="tital"></td>
							<th class="button"><input type="hidden" name="action"
								value="insert"> <input type="submit" value="送出新增">
							</th>
						</tr>
					</table>

				</form>
			</div>
		</div>
</body>
</html>