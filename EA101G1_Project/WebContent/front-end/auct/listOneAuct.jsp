<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.auct.model.*"%>

<%
  AuctVO auctVO = (AuctVO) request.getAttribute("auctVO"); //AuctServlet.java(Controller), �s�Jreq��auctVO����
%>

<jsp:useBean id="PtSvc" scope="page" class="com.productType.model.PtService" />
<jsp:useBean id="MemberSvc" scope="page" class="com.member.model.MemberService" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>�v�аӫ~��� - listOneAuct.jsp</title>

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
	width: 600px;
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
<body  bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>�v�аӫ~��T - ListOneAuct.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

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
	
	
		</tr>
				
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
			
			<td><fmt:formatDate value="${auctVO.auct_start}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			<td><fmt:formatDate value="${auctVO.auct_end}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			
			<td>${auctVO.marketPrice}</td>
			<td>${auctVO.initPrice}</td>
			<td>${auctVO.auct_inc}</td>
			
			<td>
				<img src="<%=request.getContextPath()%>/front-end/auct/pic.do?auct_id=${auctVO.auct_id}" style="width:100px;">
			</td>
			
			<td>${auctVO.auct_desc}</td>
			
		</tr>
	</table>


</body>
</html>