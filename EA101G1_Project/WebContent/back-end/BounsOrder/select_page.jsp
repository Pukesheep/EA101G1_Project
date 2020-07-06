<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="boSvc" scope="page" class="com.BounsOrder.model.BOService" />
<jsp:useBean id="bmSvc" scope="page" class="com.BounsMall.model.BMService" />
<jsp:useBean id="memSvc" scope="page" class="com.member.model.MemberService" />

<html>
<head>
<title>���Q�q��d��</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>���Q�q��d�� - /back-end/BounsOrder/select_page.jsp</h3>
			</td>
		</tr>
	</table>
	
<!-- 	���~�C�� -->
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">�Эץ��H�U���~�G</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
	<table>
		<ul>
			<li><a href="<%=request.getContextPath()%>/back-end/BounsOrder/ListAll.jsp">List</a> all BounsOrder.</li>
			
			<li>
				<form method="post" action="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do">
					<b>��ܭq��s���G</b>
					<select size="1" name="ord_id">
						<c:forEach var="boVO" items="${boSvc.all}">
							<option value="${boVO.ord_id}">${boVO.ord_id}
						</c:forEach>
					</select>
					<input type="hidden" name="action" value="getOneForDisplay">
					<input type="submit" value="�e�X" >
				</form>
			</li>
			
			<li>
				<form method="post" action="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do">
					<b>��ܰӫ~�W�١G</b>
					<select size="1" name="bon_id">
						<c:forEach var="bmVO" items="${bmSvc.all}">
							<option value="${bmVO.bon_id}">${bmVO.bon_name}
						</c:forEach>
					</select>
					<input type="hidden" name="action" value="getAllByName">
					<input type="submit" value="�e�X" >
				</form>
			</li>
			
			<li>
				<form method="post" action="<%=request.getContextPath()%>/BounsOrder/BounsOrder.do">
					<b>��ܷ|���W�١G</b>
					<select size="1" name="mem_id">
						<c:forEach var="memVO" items="${memSvc.all}">
							<option value="${memVO.mem_id}">${memVO.mem_name}
						</c:forEach>
					</select>
					<input type="hidden" name="action" value="getAllByMember">
					<input type="submit" value="�e�X" >
				</form>
			</li>
		</ul>
		
		<form method="post" action="<%=request.getContextPath()%>/back-end/BounsOrder/addBO.jsp">
			<input type="hidden" name="action" value="insert">
			<input type="submit" value="�s�W�q��" >
		</form>
	</table>
</body>
</html>