<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.immed.model.*"%>
<%@ page import="com.productType.model.*"%>

<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
	ImmedService immedSvc = new ImmedService();
	List<ImmedVO> list = immedSvc.getAll();
	pageContext.setAttribute("list", list);
%>


<jsp:useBean id="ordSvc" class="com.ordstat.model.OrdstatService" />
<%-- <jsp:useBean id="ordststVO" class="com.ordstat.model.OrdstatVO" /> --%>
<jsp:useBean id="ptSvc" class="com.productType.model.PtService" />


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
main {
	background-color: #FCFCFC;
}

td>img {
	width: 150px;
	height: 200px;
}

td:nth-of-type(5) {
	max-width: 200px;
}

table#table-1 {
	margin-bottom: 0;
}
/* td:nth-of-type(8) pre{ */
/* 	max-width: 200px; */
/* } */
/* table { */
/* 	border-collapse: collapse; */
/* 	margin-top: 5px; */
/* 	margin-bottom: 5px; */
/* } */

/* table, th, td { */
/* 	border: 1px solid #CCCCFF; */
/* } */

/* th, td { */
/* 	padding: 5px; */
/* 	text-align: center; */
/* } */

/* table#table-1 { */
/* 	width: 100%; */
/* 	background-color: #CCCCFF; */
/* 	border: 2px solid black; */
/* 	text-align: center; */
/* } */

/* table#table-1 h4 { */
/* 	color: red; */
/* 	display: block; */
/* 	margin-bottom: 1px; */
/* } */

/* table#table-2 tr { */
/* 	max-width: 100%; */
/* } */

/* table#table-2 img.immed_pic { */
/* 	width: 100px; */
/* } */

/* table#table-2 p.immed_name { */
/* 	width: 130px; */
/* } */

/* table#table-2 p.immed_desc { */
/* 	width: 250px; */
/* 	height: 200px; */
/* 	overflow: auto; */
/* 	text-align: justify; */
/* } */

/* table#table-2 p.rcpt_add { */
/* 	width: 100px; */
/* } */

/* h4 { */
/* 	color: blue; */
/* 	display: inline; */
/* } */
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

		<main>
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<table id="table-1" class="table">
							<tr>
								<td>
									<h3 class="text-center">[ ���ʰӫ~�޲z ]</h3>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<%-- ���~��C --%>
						<c:if test="${not empty errorMsgs}">
							<font style="color: red">�Эץ��H�U���~:</font>
							<ul>
								<c:forEach var="message" items="${errorMsgs}">
									<li style="color: red">${message}</li>
								</c:forEach>
							</ul>
						</c:if>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="table-responsive">
							<table id="table-2" class="table table-striped">
								<tr>
									<th>�ӫ~�s��</th>
									<th>��a�s��</th>
									<th>�R�a�s��</th>
									<th>�ӫ~����</th>
									<th>�ӫ~�W��</th>
									<th>�ӫ~�W�[�ɶ�</th>
									<!-- 									<th>�ӫ~����</th> -->
									<th>�ӫ~�Ϥ�</th>
									<!-- 									<th>�ӫ~�y�z</th> -->
									<th>�ӫ~��X���A</th>
									<th>�ӫ~�U�[���A</th>
									<th>�q��ɶ�</th>
									<th>�q�檬�A</th>
									<!-- 									<th>����H�m�W</th> -->
									<!-- 									<th>����H�q��</th> -->
									<!-- 									<th>����H�a�}</th> -->
									<!-- 									<th>�ק�</th> -->
									<th>�W/�U�[</th>
								</tr>

								<%@ include file="/files/immed/immedPage7.file"%>
								<c:forEach var="immedVO" items="${list}" begin="<%=pageIndex%>"
									end="<%=pageIndex+rowsPerPage-1%>">
									<jsp:useBean id="immedVO" class="com.immed.model.ImmedVO" />
									<tr>
										<td>${immedVO.immed_id}</td>
										<td>${immedVO.sale_id}</td>
										<td>${immedVO.buy_id}</td>
										<td>${ptSvc.getOneProductType(immedVO.pt_id).typename}</td>
										<td><a
											href="<%=request.getContextPath()%>/immed/immed.do?action=getOne_For_Display&immed_id=${immedVO.immed_id}">
												${immedVO.immed_name}</a></td>
										<td><fmt:formatDate value="${immedVO.immed_start}"
												pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<!-- 										<td>$${immedVO.immed_prc}</td> -->
										<td><img class="immed_pic"
											src="<%=request.getContextPath()%>/immed/ImmedPic.do?immed_id=${immedVO.immed_id}"></td>
										<%-- 										<td><pre class="immed_desc">${immedVO.immed_desc}</pre></td> --%>
										<td>${(immedVO.immed_sold eq 1) ? '�w��X' : '����X'}</td>
										<td>${(immedVO.immed_down eq 1) ? "�w�U�[" : "���U�["}</td>
										<td><fmt:formatDate value="${immedVO.ord_time}"
												pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td>${ordSvc.listOneOrdstat(immedVO.ordstat_id).ordstat}
										</td>
										<%-- 										<td>${immedVO.rcpt_name}</td> --%>
										<%-- 										<td>${immedVO.rcpt_cell}</td> --%>
										<%-- 										<td><p class="rcpt_add">${immedVO.rcpt_add}</p></td> --%>
										<!-- 										<td> -->
										<!-- 											<FORM METHOD="post" -->
										<%-- 												ACTION="<%=request.getContextPath()%>/immed/immed.do" --%>
										<!-- 												style="margin-bottom: 0px;"> -->
										<!-- 												<input type="hidden" name="from" value="back-end"> <input -->
										<!-- 													type="submit" value="�ק�"> <input type="hidden" -->
										<%-- 													name="immed_id" value="${immedVO.immed_id}"> <input --%>
										<!-- 													type="hidden" name="action" value="getOne_For_Update"> -->
										<!-- 											</FORM> -->
										<!-- 										</td> -->
										<td>
											<FORM METHOD="post"
												ACTION="<%=request.getContextPath()%>/immed/immed.do"
												style="margin-bottom: 0px;">
												<c:if test="${immedVO.immed_down==0}">
													<input type="submit" value="�U�[">
													<input type="hidden" name="immed_id"
														value="${immedVO.immed_id}">
													<input type="hidden" name="action"
														value="backend_update_down">
												</c:if>
												<c:if test="${immedVO.immed_down==1}">
													<input type="submit" value="�W�[">
													<input type="hidden" name="immed_id"
														value="${immedVO.immed_id}">
													<input type="hidden" name="action"
														value="backend_update_up">
												</c:if>
											</FORM>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div class="col-12">
							<%@ include file="/files/immed/immedPage8.file"%>
						</div>
					</div>
				</div>
			</div>

		</main>

	</div>
</body>
</html>
