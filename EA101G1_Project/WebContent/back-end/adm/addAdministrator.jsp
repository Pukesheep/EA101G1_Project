<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    
    <title>S.F.G 後台管理</title>
    <%@ include file="/back-end/css/BackHeaderCssLink" %> 
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
    		background-color:#446688;;	
    	}
    	
    	div#button{
    		margin-top:10px;
    		text-align: center;
    	}
    	
    </style>
    
    
</head>

<body>
<!-- header -->
	
	<%@ include file="../css/header.jsp" %>
<!-- header -->

    <div class="content d-md-flex">

<!-- aside -->
	<%@ include file="../css/aside.jsp" %>
<!-- aside -->

 <main>
<div class="container">
	<div class="row justify-content-center">
			<div class="col-10">
			
			<h3>員工註冊系統</h3>
			
			
   <%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs }">
<%
	java.util.List<String> errorMsgs = (java.util.List<String>) request.getAttribute("errorMsgs");
	String message = "";
	for (String msg : errorMsgs) {
		message += msg;
		message += "\\n";
	}
%>
<script>
	Swal.fire({
		  icon: 'error',
		  title: '<%=message%>'
		});

</script>


</c:if>
<%-- 錯誤表列 --%>



<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/adm/adm.do">


<div class="container">
	<div class="row justify-content-center">
			<div class="col-8">
<div class="input">
名稱: <input type="text" name="adm_name" value="" placeholder="請輸入會員名稱">
</div>
<div class="input">
信箱: <input type="text" name="adm_acco" value="" placeholder="請輸入電子信箱">
</div>
<div id="button">
<input type="hidden" name="action" value="register">
<input type="submit" class="btn btn-warning" value="登入">
</div>
</div>
</div>
</div>
</FORM>
        </main>
    </div>

</body>

</html>