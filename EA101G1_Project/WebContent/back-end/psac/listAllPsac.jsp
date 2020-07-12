<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.psac.model.*"%>
<%@ page import="com.adm.model.*"%>
<%
		PsacService psacSvc = new PsacService();
		List<PsacVO> list = psacSvc.getStateEq0();
		pageContext.setAttribute("list",list);
		AdmVO admVO  = (AdmVO) session.getAttribute("admVO");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/back-end/css/bootstrap.min.css">
    <!-- Include Favicon ico-->
    <link rel="shortcut icon" href="./img/ICON.ico">
    <!-- Font-awesome CSS -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.13.0/css/all.css">
    <!--GoogleFont-->
    <link href="https://fonts.googleapis.com/css2?family=Sedgwick+Ave+Display&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lakki+Reddy&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
    <!-- Include style.css-->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/back-end/css/style.css">
    
     <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
        integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
        integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
        crossorigin="anonymous"></script>   
    
    

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
	
	<%@ include file="../css/header.jsp" %>
<!-- header -->

    <div class="content d-md-flex">

<!-- aside -->
	<%@ include file="../css/aside.jsp" %>
<!-- aside -->

 <main>
<div class="container">
	<div class="row justify-content-center">
			<div class="col-12">
  
		 <h3>所有文章檢舉案資料 </h3>
	

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
		<th>檢舉案編號</th>
		<th>檢舉者編號</th>
		<th>檢舉文章編號</th>
		<th>管理員編號</th>
		<th>檢舉案內容</th>
		<th>檢舉案狀態</th>
		<th>檢舉成立</th>
		<th>檢舉不成立</th>
	</tr>
	<%@ include file="../../files/page1.file" %> 
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
			     <input type="submit" class="btn btn-warning" value="確認">
			     <input type="hidden" name="psac_no"  value="${psacVO.psac_no}">
			     <input type="hidden" name="mem_id"  value="${psacVO.mem_id}">
			     <input type="hidden" name="post_id"  value="${psacVO.post_id}">
			     <input type="hidden" name="adm_no"  value="${admVO.adm_no}">
			     <input type="hidden" name="psac_content"  value="${psacVO.psac_content}">
			     <input type="hidden" name="psac_state"  value="${psacVO.psac_state}">
			     <input type="hidden" name="action"	value="psacConfirm">
		    </FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/psac/psac.do" style="margin-bottom: 0px;">
			     <input type="submit" class="btn btn-info" value="確認">
			     <input type="hidden" name="psac_no"  value="${psacVO.psac_no}">
			     <input type="hidden" name="mem_id"  value="${psacVO.mem_id}">
			     <input type="hidden" name="post_id"  value="${psacVO.post_id}">
			     <input type="hidden" name="adm_no"  value="${admVO.adm_no}">
			     <input type="hidden" name="psac_content"  value="${psacVO.psac_content}">
			     <input type="hidden" name="psac_state"  value="${psacVO.psac_state}">
			     <input type="hidden" name="action" value="psacDenied"></FORM>	  
			  </FORM>
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