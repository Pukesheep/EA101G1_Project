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

<!DOCTYPE html>
<html>
<head>
<title>所有員工資料 - listAllQue.jsp</title>
<%@ include file="/back-end/css/BackHeaderCssLink"%>
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

.deletebutton {
	display: inline-block;
}
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
		<div class="container">
			<div class="alert alert-secondary"  style="text-align:center;font-size:30px;letter-spacing:20px;">
				疑難解答</div>

			<a
				href='<%=request.getContextPath()%>/back-end/Question/addQuestion.jsp'
				class="btn btn-secondary">新增一則QA</a>

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
									ACTION="<%=request.getContextPath()%>/Question/Question.do"
									style="margin-bottom: 0px;">
									<input type="submit" value="刪除" class="btn btn-primary">
									<input type="hidden" name="qa_id" value="${queVO.qa_id}">
									<input type="hidden" name="action" value="delete">
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

			<%-- <%@ include file="page2.file" %> --%>
		</div>
</body>

</html>