<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.BounsOrder.model.*" %>

<%
	BOVO boVO = (BOVO) request.getAttribute("boVO");
%>

<jsp:useBean id="memSvc" scope="page" class="com.member.model.MemberService" />
<jsp:useBean id="bmSvc" scope="page" class="com.BounsMall.model.BMService" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>新增紅利訂單</title>

	<title>全部訂單查詢</title>
	<%@ include file="/back-end/css/BackHeaderCssLink" %> 
	
</head>
<body bgcolor='white'>
	
	<!-- header -->
	<%@ include file="/back-end/css/header.jsp" %>
	<!-- header -->
	    <div class="content d-md-flex">
	<!-- aside -->
		<%@ include file="/back-end/css/aside.jsp" %>
	<!-- aside -->
	
<!-- 	錯誤列表 -->
	<c:if test="">
		<font style="color:red">請修正以下錯誤：</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
	<form method="post" action="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do" >
		<table>
			<tr>
				<td>選擇會員：</td>
				<td>
					<select size="1" name="mem_id">
						<c:forEach var="memVO" items="${memSvc.all}" >
							<option value="${memVO.mem_id}"
								${(boVO.mem_id==memVO.mem_id)? 'select':'' } >${memVO.mem_name}
						</c:forEach>
					</select>
				</td>
			</tr>
			
			<tr>
				<td>選擇商品：</td>
				<td>
					<select size="1" name="bon_id">
						<c:forEach var="bmVO" items="${bmSvc.all}">
							<option value="${bmVO.bon_id}"
								${(boVO.bon_id==bmVO.bon_id)? 'select':''} >${bmVO.bon_name}
						</c:forEach>
					</select>
				</td>
			</tr>
			
		</table>
		<br>
		<input type="hidden" name="action" value="insert">
		<input type="submit" value="送出新增" >
	</form>
	
</body>
</html>