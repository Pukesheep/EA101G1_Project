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
<%@ include file="../../files/HeaderCssLink"%>

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
</style>

</head>
<body bgcolor='white'>
	<!-- navbar -->
	<%@ include file="../../files/header.jsp"%>
	<!-- navbar end -->
	<section class="blank0"></section>
	<!-- 內容 -->
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a
				href="<%=request.getContextPath()%>/front-end/index.jsp">首頁</a></li>
			<li class="breadcrumb-item active" aria-current="page">Q&A</li>
		</ol>
	</nav>

	<div>

		<c:forEach var="queVO" items="${list}">
			<div class="accordion" id="accordionExample">
				<div class="card">
					<div class="card-header" id="heading${queVO.qa_id}">
						<h2 class="mb-0">
							<button class="btn btn-link collapsed" type="button"
								data-toggle="collapse" data-target="#collapse${queVO.qa_id}"
								aria-expanded="false" aria-controls="collapse${queVO.qa_id}">
								${queVO.que}</button>
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
	</div>
	<%-- <%@ include file="page2.file" %> --%>

</body>

</html>