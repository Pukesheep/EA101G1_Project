	<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
    	img.magnifier {
    		width: 30px;
    		height: 30px;
    	}
    	
    	h2{
    		padding: 10px;
    		text-align: center;
    		background-color:#886655;
    		
    	}
    	
    	h3{
    		padding: 30px;
    		text-align: center;
    	}
    	
    	table, th, td {
    		padding: 10px;
    		background-color:#5588DD;
    	}
    	
    	div.container{
    	margin-top:30px;
    	}
    	
    	body{
    		background-color:#448888;	
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

   <h2>文章檢舉管理</h2>
<table id="a">
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

<div class="container">
	<div class="row justify-content-center">
			<div class="col-8">


 

 <input type="button" class="btn btn-primary" value="查詢全部檢舉案" onclick="location.href='listAllPsac.jsp'">
 
 <input type="button" class="btn btn-primary" value="新增檢舉案" onclick="location.href='<%=request.getContextPath()%>/back-end/psac/addPsac.jsp'">
 
 </div>
</div>
</div>


<div class="container">
		<div class="row justify-content-center">
			<div class="col-8">
				<div class="media">
				<div class="media-body">
    	    		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/psac/psac.do" >
				<div class="input-group mb-3">
					<input type="text" class="form-control" name="psac_no" id="inlineFormInputGroup" placeholder="請輸入檢舉案編號 ex: p000001">
						<div class="input-group-append">
						<input type="hidden" name="action" value="select_One_Psac">
						<button class="btn btn-outline-warning" type="submit">查詢</button>
						</div>
				</div>
    				</FORM>
  				</div>
				</div> 

 			<jsp:useBean id="psacSvc" scope="page" class="com.psac.model.PsacService"/>
 
  				<div class="media">
				  <div class="media-body">
				     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/psac/psac.do" >
				       <b>選擇檢舉案編號:</b>
				       	<select size="1" name="psac_no">
				         <c:forEach var="psacVO" items="${psacSvc.all}" > 
				          <option value="${psacVO.psac_no}">${psacVO.psac_no}
				         </c:forEach>  
				       </select>
				       <input type="hidden" name="action" value="select_One_Psac">
				       <input type="submit" class="btn btn-warning" value="查詢">
				    </FORM>
				  </div>
				</div>
			</div>
		</div>


        </main>
 	</div>

</body>



</html>