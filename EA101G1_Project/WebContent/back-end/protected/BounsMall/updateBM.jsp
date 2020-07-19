<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.BounsMall.model.*"%>
<%@ page import="com.productType.model.*"%>

<%
	BMVO bmVO = (BMVO) request.getAttribute("bmVO");
%>

<jsp:useBean id="ptSvc" scope="page"
	class="com.productType.model.PtService" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>修改紅利商品訊息</title>
<%@ include file="/back-end/css/BackHeaderCssLink"%>

<style>
img#display {
	width: 200px;
}
</style>


</head>
<body bgcolor='white'>

	<%@ include file="/back-end/css/header.jsp"%>
	<!-- header -->

	<div class="content d-md-flex">

		<!-- aside -->
		<%@ include file="/back-end/css/aside.jsp"%>
		<!-- aside -->

		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>

		<main>
			<form method="post"
				action="<%=request.getContextPath()%>/BounsMall/BounsMall.do"
				name="form1" enctype="multipart/form-data">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item active" aria-current="page">修改紅利商品訊息</li>
					</ol>
				</nav>

				<div class="container-fluid">
					<div class="row justify-content-center">
						<div class="col-10">
							<div class="card alert alert-info">
								<div class="card-header">
									<h1>修改紅利商品訊息</h1>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-12">
											<div class="card alert alert-light mb-6 p-4">
												<div class="media alert alert-success">
													<div class="media-body">
													

																<div align="center">
																	<h5>
																		<form method="post"
																			action="<%=request.getContextPath()%>/BounsMall/BounsMall.do"
																			name="form1" enctype="multipart/form-data">
																			<table>
																				<tr>
																					<td>紅利商品編號：<font color=red><b>*</b></font></td>
																					<td>${bmVO.bon_id}</td>
																				</tr>
																
																	<jsp:useBean id="bmSvc" scope="page"
																		class="com.BounsMall.model.BMService" />
																	<tr>
																		<td>商品分類編號：<font color="red"><b>*</b></font></td>
																		<td><select size="1" name="pt_id">
																				<c:forEach var="ptVO" items="${ptSvc.all}">
																					<option value="${ptVO.pt_id}"
																						${(bmVO.pt_id == ptVO.pt_id) ? 'selected' : '' }>${ptVO.typename}</option>
																				</c:forEach>

																		</select></td>
																	</tr>

																	<tr>
																		<td>紅利商品名稱：</td>
																		<td><input type="text" name="bon_name" size="45"
																			value="${bmVO.bon_name}" /></td>
																	</tr>
																	<tr>
																		<td>所需紅利點數：</td>
																		<td><input type="text" name="bon_price" size="45"
																			value="${bmVO.bon_price}" /></td>
																	</tr>
																	<tr>
																		<td>紅利商品圖片：</td>
																		<td><input type="file" name="bon_image" /> <img
																			src="<%=request.getContextPath()%>/BounsMall/ImageServlet.do?bon_id=${bmVO.bon_id}"
																			id="display"></td>
																	</tr>
																	<tr>
																		<td>紅利商品描述：</td>
																		<td><textarea rows="5" cols="48.5" name="bon_info">${bmVO.bon_info}</textarea></td>
																	</tr>
																	<tr>
																		<td>已兌換數量：</td>
																		<td>${bmVO.bon_exchange}</td>
																	</tr>
																	<tr>
																		<td>現有總庫存：</td>
																		<td><input type="text" name="bon_stock" size="45"
																			value="${bmVO.bon_stock}" /></td>
																	</tr>

																	<tr>
																		<td>上架日期：</td>
																		<td>${bmVO.bon_addDate}</td>
																	</tr>

																	<tr>
																		<td>紅利商品上架狀態：</td>
																		<td><select size="1" name="bon_status">
																				<option value=0 ${(bon_stat==0)? 'selected':''}>上架


																				
																				<option value=1 ${(bon_stat==1)? 'selected':''}>下架


																				</option>
																				
																		</select></td>
																		
																	</tr>
																	
																	</table>
</form></h5>
		<br> <input type="hidden" name="action"
																		value="update"> <input type="hidden"
																		name="bon_id" value="${bmVO.bon_id}"> <input
																		type="hidden" name="bon_exchange"
																		value="${bmVO.bon_exchange}"> <input
																		type="hidden" name="bon_addDate"
																		value="${bmVO.bon_addDate}"> 
																		<button type="submit" class="btn btn-outline-secondary">送出新增</button>
</div>

</div>

</div>

</div>
</div>

</div>
</div>

</div>
</div>
</div>

</div>
				</main>												
		
</body>


<%
	java.sql.Date hiredate = null;
	try {
		hiredate = java.sql.Date.valueOf(request.getParameter("hiredate").trim());
	} catch (Exception e) {
		hiredate = new java.sql.Date(System.currentTimeMillis());
	}
%>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/files/datetimepicker/jquery.datetimepicker.css" />
<script
	src="<%=request.getContextPath()%>/files/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/files/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>
<script>
	        $.datetimepicker.setLocale('zh');
	        $('#f_date1').datetimepicker({
	 	       theme: '',              //theme: 'dark',
		       timepicker:false,       //timepicker:true,
		       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
		       format:'Y-m-d',         //format:'Y-m-d H:i:s',
			   value: '${bmVO.bon_addDate}', // value:   new Date(),
	           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	           //startDate:	            '2017/07/10',  // 起始日
	           //minDate:               '-1970-01-01', // 去除今日(不含)之前
	           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	        });
	</script>
	
	</html>



