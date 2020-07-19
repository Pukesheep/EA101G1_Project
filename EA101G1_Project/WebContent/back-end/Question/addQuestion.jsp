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

</style>
</head>
<body style="background-color: #17a2b8">
	<!-- header -->

	<%@ include file="/back-end/css/header.jsp"%>
	<!-- header -->

	<div class="content d-md-flex">

		<!-- aside -->
		<%@ include file="/back-end/css/aside.jsp"%>
		<!-- aside -->

		<div class="container" >

			<!-- 	錯誤表列 -->
			<c:if test="${not empty errorMsgs}">
				<font style="color: red">請修正以下錯誤:</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color: red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>
			<div class="container-fluid" style="text-align: center; font-size: 30px;">

				<form action="<%=request.getContextPath()%>/Question/Question.do"
					method="post">
					<h3 class="alert alert-success">新 增 Q & A</h3>
					<div class="form-group">
						<label for="Q">問題</label>
						<textarea class="form-control" id="Q" placeholder="輸入問題"
							name="que" cols="3" rows="5"></textarea>
					</div>

					<div class="form-group">
						<label for="A">答案</label>
						<textarea class="form-control" id="A" name="ans" id="" cols="30"
							rows="10" placeholder="對應的回答" style="height: 20%"></textarea>
					</div>
					<input type="hidden" name="action" value="insert">
					 <input class="btn btn-secondary" type="submit" value="送出新增">
				</form>
			</div>
		</div>
		
</body>
</html>