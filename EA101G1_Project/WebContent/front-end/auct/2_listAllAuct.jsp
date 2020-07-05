<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.auct.model.*"%>

<%
    AuctService auctSvc = new AuctService();
    List<AuctVO> list = auctSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<jsp:useBean id="PtSvc" scope="page" class="com.productType.model.PtService" />
<jsp:useBean id="MemberSvc" scope="page" class="com.member.model.MemberService" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>�Ҧ��ӫ~��� - listAllAuct.jsp</title>

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
  table {
	width: 800px;
	background-color: white;
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
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr><td>
			 <h3>�Ҧ��v�аӫ~��� - listAllAuct.jsp</h3>
			 <h4><a href="<%=request.getContextPath()%>/front-end/auct/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
		</td></tr>
	</table>
	
	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

<table>
	<tr>
		<th>�v�аӫ~�s��</th>
		<th>�v�аӫ~�W��</th>
		<th>�ӫ~���O</th>
		<th>��aID</th>
		<th>��a�W��</th>
		<th>�v�ж}�l�ɶ�</th>
		<th>�v�е����ɶ�</th>
		<th>����</th>
		<th>�_���</th>
		<th>�X���W�B</th>
		<th>�ӫ~�Ϥ�</th>
		<th>�ӫ~�y�z</th>
		<th>�ӫ~��X���A</th>
		<th>�W�U�[���A</th>
		
		
	</tr>
	<%@ include file="../../files/page1.file" %> 
	<c:forEach var="auctVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${auctVO.auct_id}</td>
			<td>${auctVO.auct_name}</td>
			
			<td>
				${PtSvc.getOneProductType(auctVO.pt_id).typename} 
			</td>
			
			<td>${auctVO.sale_id}</td>
			
			<td>
				${MemberSvc.getOneMember(auctVO.sale_id).mem_name} 
			</td>
			
			<td><fmt:formatDate value="${auctVO.auct_start}" pattern="yyyy-MM-dd HH:mm:ss" /> </td>
			
			<td><fmt:formatDate value="${auctVO.auct_end}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			
			<td>${auctVO.marketPrice}</td>
			<td>${auctVO.initPrice}</td>
			<td>${auctVO.auct_inc}</td>
			
			<td>
				<img src="<%=request.getContextPath()%>/auct/pic.do?auct_id=${auctVO.auct_id}" width="100px">
			</td>
			
			<td>${auctVO.auct_desc}</td>
			<td>
				<c:if test="${auctVO.auct_sold == 0}">
					<c:out value="����X"></c:out>
				</c:if>
				<c:if test="${auctVO.auct_sold == 1}">
					<c:out value="��X"></c:out>
				</c:if>
			</td>
			<td>
				<c:if test="${auctVO.auct_down == 0}">
					<c:out value="�W�["></c:out>
				</c:if>
				<c:if test="${auctVO.auct_down == 1}">
					<c:out value="�U�["></c:out>
				</c:if>
			</td>
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/auct/auct.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="auct_id"  value="${auctVO.auct_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/auct/auct.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�U�[">
			     <input type="hidden" name="auct_id"  value="${auctVO.auct_id}">
			     <input type="hidden" name="action" value="update_down"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/auct/auct.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�W�[">
			     <input type="hidden" name="auct_id"  value="${auctVO.auct_id}">
			     <input type="hidden" name="action" value="update_up"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="../../files/page2.file" %>




</body>
</html>