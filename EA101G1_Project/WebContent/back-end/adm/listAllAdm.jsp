<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adm.model.*"%>
<%
    AdmService admSvc = new AdmService();
    List<AdmVO> list = admSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <%@ include file="/back-end/css/BackHeaderCssLink" %>   
    
    

    <title>S.F.G 後台管理</title>
    
    <style>
    
    	h1,h3{
    		padding: 10px;
    		text-align: center;
    		background-color:#22AA99;
    		
    	}
    	
    	div.container{
    		margin-top:20px;
    	}
    	
    	div.input{
    		padding:5px;
    	}
    	
    	body{
    		background-color:#446688;	
    	}
    	
    	div#button{
    		margin-top:10px;
    		text-align: center;
    	}
    	
    	a.btn btn-primary{
    		padding:50px;
    		margin-top:90%;
    	}
    </style>
    
    
</head>

<body>
<!-- header -->
	
	<%@ include file="/back-end/css/header.jsp" %>
<!-- header -->

    <div class="content d-md-flex">

<!-- aside -->
	<%@ include file="/back-end/css/aside.jsp" %>
<!-- aside -->

 <main>
<div class="container">
	<div class="row justify-content-center">
			<div class="col-10">
  
		 <h3>所有員工資料 </h3>
	

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table class="table table-striped">
	<tr>
		<th>員工編號</th>
		<th>員工帳號</th>
		<th>員工密碼</th>
		<th>員工姓名</th>
		<th>員工狀態</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="/files/page1B.file" %> 
	<c:forEach var="admVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${admVO.adm_no}</td>
			<td>${admVO.adm_acco}</td>
			<td>${admVO.adm_pass}</td>
			<td>${admVO.adm_name}</td>
			<td>${admVO.adm_state}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/adm/adm.do" style="margin-bottom: 0px;">
			     <input type="submit" class="btn btn-warning" value="修改">
			     <input type="hidden" name="adm_no"  value="${admVO.adm_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/adm/adm.do" style="margin-bottom: 0px;">
			     <input type="submit" class="btn btn-danger" value="刪除">
			     <input type="hidden" name="adm_no"  value="${admVO.adm_no}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>

<%@ include file="/files/page2B.file" %>
<a href="<%=request.getContextPath()%>/back-end/adm/select_page.jsp" class="btn btn-primary">回首頁</a>
        </main>
    </div>
</div>
</div>
</div>
</body>

</html>