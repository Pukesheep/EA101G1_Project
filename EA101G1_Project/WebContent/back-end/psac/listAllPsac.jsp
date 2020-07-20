<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.psac.model.*"%>
<%@ page import="com.adm.model.*"%>
<%
	PsacService psacSvc = new PsacService();
	List<PsacVO> list = psacSvc.getAll();
	pageContext.setAttribute("list", list);
	AdmVO admVO = (AdmVO) session.getAttribute("admVO");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<title>S.F.G 後台管理</title>
<%@ include file="/back-end/css/BackHeaderCssLink"%>
<style>
h1, h3 {
	padding: 10px;
	text-align: center;
	background-color: #22AA99;
}

div.container {
	margin-top: 20px;
}

div.input {
	padding: 5px;
}

body {
	background-color: #446688;
}

div#button {
	margin-top: 10px;
	text-align: center;
}

a.btn btn-primary {
	padding: 50px;
	margin-top: 90%;
}

th{
	color: yellow;
}

td{
	color: white;
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
		<div class="container">
			<main>
<!-- 				<div class="container"> -->
<!-- 					<div class="row justify-content-center"> -->
<!-- 						<div class="col-12"> -->

							<h3>所有文章檢舉案資料</h3>


							<%-- 錯誤表列 --%>
							<c:if test="${not empty errorMsgs}">
								<font style="color: red">請修正以下錯誤:</font>
								<ul>
									<c:forEach var="message" items="${errorMsgs}">
										<li style="color: red">${message}</li>
									</c:forEach>
								</ul>
							</c:if>

							<table class="table table-striped">
								<tr>
									<th>檢舉案編號</th>
									<th>檢舉者編號</th>
									<th>檢舉文章編號</th>
									<th>管理員編號</th>
									<th>檢舉案內容</th>
									<th>檢舉案狀態</th>
<!-- 									<th>檢舉成立</th> -->
<!-- 									<th>檢舉不成立</th> -->
								</tr>
								<%@ include file="../../files/page1B.file"%>
								<c:forEach var="psacVO" items="${list}" begin="<%=pageIndex%>"
									end="<%=pageIndex+rowsPerPage-1%>">

									<tr>
										<td>${psacVO.psac_no}</td>
										<td>${psacVO.mem_id}</td>
										<td><a href="<%=request.getContextPath()%>/front-end/post/listAllPost.jsp" ">${psacVO.post_id}</a></td>
										<td>${psacVO.adm_no}</td>
										<td>${psacVO.psac_content}</td>
										<td><c:choose>
								<c:when test="${psacVO.psac_state eq 0}">
									未處理
								</c:when>
								<c:when test="${psacVO.psac_state eq 1}">
									已成立
								</c:when>
								<c:when test="${psacVO.psac_state eq 2}">
									不成立
								</c:when>
								<c:when test="${psacVO.psac_state eq 3}">
									未處理
								</c:when>
							</c:choose></td>
<!-- 										<td> -->
<!-- 											<FORM METHOD="post" -->
<%-- 												ACTION="<%=request.getContextPath()%>/psac/psac.do" --%>
<!-- 												style="margin-bottom: 0px;"> -->
<!-- 												<input type="submit" class="btn btn-warning" value="成立"> -->
<!-- 												<input type="hidden" name="psac_no" -->
<%-- 													value="${psacVO.psac_no}"> <input type="hidden" --%>
<%-- 													name="mem_id" value="${psacVO.mem_id}"> <input --%>
<%-- 													type="hidden" name="post_id" value="${psacVO.post_id}"> --%>
<%-- 												<input type="hidden" name="adm_no" value="${admVO.adm_no}"> --%>
<!-- 												<input type="hidden" name="psac_content" -->
<%-- 													value="${psacVO.psac_content}"> <input --%>
<!-- 													type="hidden" name="psac_state" -->
<!-- 													value="1"> <input type="hidden" -->
<!-- 													name="action" value="psacConfirm"> -->
<!-- 											</FORM> -->
<!-- 										</td> -->
<!-- 										<td> -->
<!-- 											<FORM METHOD="post" -->
<%-- 												ACTION="<%=request.getContextPath()%>/psac/psac.do" --%>
<!-- 												style="margin-bottom: 0px;"> -->
<!-- 												<input type="submit" class="btn btn-info" value="不成立"> -->
<!-- 												<input type="hidden" name="psac_no" -->
<%-- 													value="${psacVO.psac_no}"> <input type="hidden" --%>
<%-- 													name="mem_id" value="${psacVO.mem_id}"> <input --%>
<%-- 													type="hidden" name="post_id" value="${psacVO.post_id}"> --%>
<%-- 												<input type="hidden" name="adm_no" value="${admVO.adm_no}"> --%>
<!-- 												<input type="hidden" name="psac_content" -->
<%-- 													value="${psacVO.psac_content}"> <input --%>
<!-- 													type="hidden" name="psac_state" -->
<!-- 													value="2"> <input type="hidden" -->
<!-- 													name="action" value="psacConfirm"> -->
<!-- 											</FORM> -->
											
<!-- 										</td> -->
									</tr>
							
								</c:forEach>
							</table>

							
							
							
			</main>
		</div>
	</div>
	
</body>

</html>