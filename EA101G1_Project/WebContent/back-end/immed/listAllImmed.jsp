<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.immed.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
	ImmedService immedSvc = new ImmedService();
	List<ImmedVO> list = immedSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">



<title>S.F.G ��x�޲z</title>
<%@ include file="/back-end/css/BackHeaderCssLink"%>
<style>
table {
	border-collapse: collapse;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}

table#table-1 {
	width: 100%;
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

table#table-2 tr {
	max-width: 100%;
}

table#table-2 img.immed_pic {
	width: 100px;
}

table#table-2 p.immed_name {
	width: 130px;
}

table#table-2 p.immed_desc {
	width: 250px;
	height: 200px;
	overflow: auto;
	text-align: justify;
}

table#table-2 p.rcpt_add {
	width: 100px;
}

h4 {
	color: blue;
	display: inline;
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
		<div class="table-responsive">
			<main>

				<div class="container-fluid">
					<div class="row">

						<table id="table-1" class="table">
							<tr>
								<td>
									<h3>�Ҧ��ӫ~��� - listAllImmed.jsp</h3>
									<h4>
										<a href="select_page.jsp"><img src="images/back1.gif"
											width="100" height="32" border="0">�^����</a>
									</h4>
								</td>
							</tr>
						</table>

						<%-- ���~��C --%>
						<c:if test="${not empty errorMsgs}">
							<font style="color: red">�Эץ��H�U���~:</font>
							<ul>
								<c:forEach var="message" items="${errorMsgs}">
									<li style="color: red">${message}</li>
								</c:forEach>
							</ul>
						</c:if>

						<div class="table-responsive">
							<table id="table-2" class="table">
								<tr>
									<th>�ӫ~�s��</th>
									<th>��a�s��</th>
									<th>�R�a�s��</th>
									<th>�ӫ~�����s��</th>
									<th>�ӫ~�W��</th>
									<th>�ӫ~�W�[�ɶ�</th>
									<th>�ӫ~����</th>
									<th>�ӫ~�Ϥ�</th>
									<th>�ӫ~�y�z</th>
									<th>�ӫ~��X���A</th>
									<th>�ӫ~�U�[���A</th>
									<th>�q��ɶ�</th>
									<th>�q�檬�A�s��</th>
									<th>����H�m�W</th>
									<th>����H�q��</th>
									<th>����H�a�}</th>
									<th>�ק�</th>
									<th>�R��</th>
								</tr>

								<%@ include file="page1.file"%>
								<c:forEach var="immedVO" items="${list}" begin="<%=pageIndex%>"
									end="<%=pageIndex+rowsPerPage-1%>">
									<tr>
										<td>${immedVO.immed_id}</td>
										<td>${immedVO.sale_id}</td>
										<td>${immedVO.buy_id}</td>
										<td>${immedVO.pt_id}</td>
										<td><p class="immed_name">${immedVO.immed_name}</p></td>
										<td><fmt:formatDate value="${immedVO.immed_start}"
												pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td>$${immedVO.immed_prc}</td>
										<td><img class="immed_pic"
											src="<%=request.getContextPath()%>/immed/ImmedPicRead?ID=${immedVO.immed_id}"></td>
										<td><p class="immed_desc">${immedVO.immed_desc}</p></td>
										<td>${(immedVO.immed_sold eq 1) ? '�w��X' : '����X'}</td>
										<td>${(immedVO.immed_down eq 1) ? "�w�U�[" : "���U�["}</td>
										<td><fmt:formatDate value="${immedVO.ord_time}"
												pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td>${immedVO.ordstat_id}</td>
										<td>${immedVO.rcpt_name}</td>
										<td>${immedVO.rcpt_cell}</td>
										<td><p class="rcpt_add">${immedVO.rcpt_add}</p></td>
										<td>
											<FORM METHOD="post"
												ACTION="<%=request.getContextPath()%>/immed/immed.do"
												style="margin-bottom: 0px;">
												<input type="hidden" name="from" value="back-end"> <input
													type="submit" value="�ק�"> <input type="hidden"
													name="immed_id" value="${immedVO.immed_id}"> <input
													type="hidden" name="action" value="getOne_For_Update">
											</FORM>
										</td>
										<td>
											<FORM METHOD="post"
												ACTION="<%=request.getContextPath()%>/immed/immed.do"
												style="margin-bottom: 0px;">
												<input type="hidden" name="from" value="back-end"> <input
													type="submit" value="�R��"> <input type="hidden"
													name="immed_id" value="${immedVO.immed_id}"> <input
													type="hidden" name="action" value="delete">
											</FORM>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>

						<%@ include file="page2.file"%>
					</div>
				</div>


			</main>

		</div>
</body>
</html>
