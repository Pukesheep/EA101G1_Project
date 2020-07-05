<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.psac.model.*"%>
<%
    PsacService psacSvc = new PsacService();
    List<PsacVO> list = psacSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
<style>
  table#a {
	width: 100%;
	background-color: #5588DD;
	margin-top: 20px;
	margin-bottom: 20px;
    border: 5px solid Gray;
    height: 50px;
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

<table id="a">
	<tr><td>
		 <h3>所有文章檢舉案資料 - listAllPsac.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/psac/select_page.jsp">回首頁</a></h4>
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
		<th>檢舉案編號</th>
		<th>檢舉者編號</th>
		<th>檢舉文章編號</th>
		<th>管理員編號</th>
		<th>檢舉案內容</th>
		<th>檢舉案狀態</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="psacVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${psacVO.psac_no}</td>
			<td>${psacVO.mem_id}</td>
			<td>${psacVO.post_id}</td>
			<td>${psacVO.adm_no}</td>
			<td>${psacVO.psac_content}</td>
			<td>${psacVO.psac_state}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/psac/psac.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="psac_no"  value="${psacVO.psac_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/psac/psac.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="psac_no"  value="${psacVO.psac_no}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>