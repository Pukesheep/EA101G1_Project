<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.adm.model.*"%>
<%
AdmVO admVO = (AdmVO) request.getAttribute("admVO");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>員工新增 - addAdm.jsp</title>
    <%@ include file="/back-end/css/BackHeaderCssLink" %>
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

  table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
  h3{
  	 padding: 10px;
  	 text-align: center;
  	 background-color: #BB6655;
  }
  body{
     background-color:#448888;	
    	}
  
  p{
  	padding: 10px;
  	margin-left:80%;
  }
  
  div#button{
    		margin-top:1px;
    		text-align: center;
    	}
  div.container{
    		margin-top:20px;
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

		 <h3>員工新增 </h3></td><td>
		 
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/adm/adm.do" name="form1">

<div class="container">
	<div class="row justify-content-center">
			<div class="col-6">

<table class="table table-striped">

	<tr>
		<td>員工帳號:</td>
		<td><input type="TEXT" name="adm_acco" size="45"
			 value="<%= (admVO==null)? "anthoney" : admVO.getAdm_acco()%>" /></td>
	</tr>
	
	<tr>
		<td>員工姓名:</td>
		<td><input type="TEXT" name="adm_name" size="45"
			 value="<%= (admVO==null)? "anthoney" : admVO.getAdm_name()%>" /></td>
	</tr>
	<tr>
		<td>員工狀態:</td>
		<td><input type="TEXT" name="adm_state" size="45"
			 value="<%= (admVO==null)? "" : admVO.getAdm_state()%>" /></td>
	</tr>
</table>
<br>

<div id="button">
<input type="hidden" name="action" value="insert">
<input type="submit" class="btn btn-warning" value="新增">

</FORM>
</div>

<p><a href="<%=request.getContextPath()%>/back-end/protected/adm/select_page.jsp" class="btn btn-primary">回首頁</a></p>
   
        </main>
    </div>
</div>
</div>
</div>
</body>

</html>