<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.gro_mem.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    Gro_memService gromemSvc = new Gro_memService();
    List<Gro_memVO> list = gromemSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有團購成員 - listAllGro.jsp</title>

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

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>所有團購成員資料 - listAllGromem.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/gromem/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>團購案</th>
		<th>會員</th>
		

	</tr>
	<%@ include file="../../files/page1.file" %> 
	<c:forEach var="Gro_memVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${Gro_memVO.gro_Id}</td>
            <td>${Gro_memVO.mem_Id}</td>
           
		<%-- 	<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/gro_mem/gro_mem.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="gro_Id" value="${Gro_memVO.gro_Id}"> <input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
			</td>--%>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/gro_mem/gro_mem.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="gro_Id" value="${Gro_memVO.gro_Id}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="../../files/page2.file" %>

</body>
</html>