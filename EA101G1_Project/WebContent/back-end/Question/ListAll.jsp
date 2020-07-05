<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.question.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	QuestionService queSvc = new QuestionService();
	List<QuestionVO> list = queSvc.getAll();
	pageContext.setAttribute("list", list);
%>


<html>
<head>
<title>所有員工資料 - listAllQue.jsp</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
.dbpic {
	width: 400px;
	height: 200px;
}

table {
	border: 1px solid #CCCCFF;
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
	width: 800px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}
.deletebutton{
display: inline-block;
}
</style>

</head>
<body bgcolor='white'>

	<h4>此頁練習採用 EL 的寫法取值:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>所有員工資料 - listAllEmp.jsp</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/back-end/Question/select_page.jsp"><img
						src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>



	<table>
		<!-- 		<tr> -->
		<!-- 			<th>訊息編號</th> -->
		<!-- 			<th>問題</th> -->
		<!-- 			<th>答案</th> -->

		<!-- 		</tr> -->
		<%-- 	<%@ include file="page1.file" %>  --%>

		<%-- 
			<tr>
				<td>${queVO.qa_id}</td>
				<td class="que">${queVO.que}</td>
				<td class="ans" id="${queVO.qa_id}">${queVO.ans}</td>
			</tr>
			--%>
		<c:forEach var="queVO" items="${list}">
			<div class="accordion" id="accordionExample">
				<div class="card">
					<div class="card-header" id="heading${queVO.qa_id}">
						<h2 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapse${queVO.qa_id}"
								aria-expanded="false" aria-controls="collapse${queVO.qa_id}">
								${queVO.que}</button>
							<FORM class="deletebutton" METHOD="post"
								ACTION="<%=request.getContextPath() %>/Question/Question.do"
								style="margin-bottom: 0px;">
								<input type="submit" value="刪除"> <input type="hidden"
									name="qa_id" value="${queVO.qa_id}"> <input
									type="hidden" name="action" value="delete">
							</FORM>
						</h2>
					</div>
				</div>
				<div id="collapse${queVO.qa_id}" class="collapse"
					aria-labelledby="heading${queVO.qa_id}"
					data-parent="#accordionExample">
					<div class="card-body">${queVO.ans}</div>
				</div>
			</div>

		</c:forEach>
	</table>
	<%-- <%@ include file="page2.file" %> --%>

</body>

</html>