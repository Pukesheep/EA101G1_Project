<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.adm.model.*"%>
<%@ page import="java.util.*"%>
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
 <link rel="stylesheet" href="<%=request.getContextPath()%>/back-end/css/bootstrap.min.css">
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
        integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
        integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
        crossorigin="anonymous"></script>  
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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
  h1,h3{
    		padding: 10px;
    		text-align: center;
    		background-color:#22AA99;
    		
    	}
  body{
    		background-color:#446688;	
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

		 <h3>員工新增 </h3>
		 
<%-- 錯誤訊息 --%>
<c:if test="${not empty errorMsgs }">
<%
	List<String> errorMsgs = (List<String>) request.getAttribute("errorMsgs");
	String error = "";
	for (String er : errorMsgs) {
		error += er+"\\n";	
	}
%>
<script>
	Swal.fire({
		icon: 'error',
		title: '<%=error%>'
	});
</script>
</c:if>
<%-- 錯誤訊息 --%>	

<%-- 成功訊息 --%>
<c:if test="${not empty successMsgs }">
<%
	List<String> successMsgs = (List<String>) request.getAttribute("successMsgs");
	String success = "";
	for (String su : successMsgs) {
		success += su+"\\n";
	}
%>
<script>
	Swal.fire({
		icon: 'success',
		title: '<%=success%>'
	});
</script>
</c:if>
<%-- 成功訊息 --%>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/adm/adm.do" name="form1">

<div class="container">
	<div class="row justify-content-center">
			<div class="col-6">

<table class="table table-striped">

	<tr>
		<td>員工帳號:</td>
		<td><input type="TEXT" name="adm_acco" size="45"
			 value="" placeholder="請輸入員工信箱"/></td>
	</tr>
	
	<tr>
		<td>員工姓名:</td>
		<td><input type="TEXT" name="adm_name" size="45"
			 value="" placeholder="請輸入員工姓名"/></td>
	</tr>

</table>
<br>

<div id="button">
<input type="hidden" name="action" value="register">
<input type="submit" class="btn btn-warning" id="add" value="新增">

</FORM>
</div>
   
        </main>
    </div>
</div>
</div>
</div>

<%-- 成功表列 --%>

	<c:if test="${not empty successMsgs }">
	<%
		java.util.List<String> successMsgs = (java.util.List<String>) request.getAttribute("successMsgs");
		String message = "";
		for (String msg : successMsgs) {
			message += msg;
			message += "\\n";
		}
	%>
	<script>
	$('add').click(function(){
		 var shop=$(this).closest('form');
		 
		 var timer = setTimeout(function(){
			 shop.submit();
			}, 800);	
	Swal.fire({
			icon: 'success',
			title: '<%=message%>'
		})
	</script>
	
	</c:if>
	<%-- 成功表列 --%>
</body>

</html>