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
<title>�ק���Q�ӫ~�T��</title>
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
			<font style="color: red">�Эץ��H�U���~:</font>
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
						<li class="breadcrumb-item active" aria-current="page">�ק���Q�ӫ~�T��</li>
					</ol>
				</nav>

				<div class="container-fluid">
					<div class="row justify-content-center">
						<div class="col-10">
							<div class="card alert alert-info">
								<div class="card-header">
									<h1>�ק���Q�ӫ~�T��</h1>
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
																					<td>���Q�ӫ~�s���G<font color=red><b>*</b></font></td>
																					<td>${bmVO.bon_id}</td>
																				</tr>
																
																	<jsp:useBean id="bmSvc" scope="page"
																		class="com.BounsMall.model.BMService" />
																	<tr>
																		<td>�ӫ~�����s���G<font color="red"><b>*</b></font></td>
																		<td><select size="1" name="pt_id">
																				<c:forEach var="ptVO" items="${ptSvc.all}">
																					<option value="${ptVO.pt_id}"
																						${(bmVO.pt_id == ptVO.pt_id) ? 'selected' : '' }>${ptVO.typename}</option>
																				</c:forEach>

																		</select></td>
																	</tr>

																	<tr>
																		<td>���Q�ӫ~�W�١G</td>
																		<td><input type="text" name="bon_name" size="45"
																			value="${bmVO.bon_name}" /></td>
																	</tr>
																	<tr>
																		<td>�һݬ��Q�I�ơG</td>
																		<td><input type="text" name="bon_price" size="45"
																			value="${bmVO.bon_price}" /></td>
																	</tr>
																	<tr>
																		<td>���Q�ӫ~�Ϥ��G</td>
																		<td><input type="file" name="bon_image" /> <img
																			src="<%=request.getContextPath()%>/BounsMall/ImageServlet.do?bon_id=${bmVO.bon_id}"
																			id="display"></td>
																	</tr>
																	<tr>
																		<td>���Q�ӫ~�y�z�G</td>
																		<td><textarea rows="5" cols="48.5" name="bon_info">${bmVO.bon_info}</textarea></td>
																	</tr>
																	<tr>
																		<td>�w�I���ƶq�G</td>
																		<td>${bmVO.bon_exchange}</td>
																	</tr>
																	<tr>
																		<td>�{���`�w�s�G</td>
																		<td><input type="text" name="bon_stock" size="45"
																			value="${bmVO.bon_stock}" /></td>
																	</tr>

																	<tr>
																		<td>�W�[����G</td>
																		<td>${bmVO.bon_addDate}</td>
																	</tr>

																	<tr>
																		<td>���Q�ӫ~�W�[���A�G</td>
																		<td><select size="1" name="bon_status">
																				<option value=0 ${(bon_stat==0)? 'selected':''}>�W�[


																				
																				<option value=1 ${(bon_stat==1)? 'selected':''}>�U�[


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
																		<button type="submit" class="btn btn-outline-secondary">�e�X�s�W</button>
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
		       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
		       format:'Y-m-d',         //format:'Y-m-d H:i:s',
			   value: '${bmVO.bon_addDate}', // value:   new Date(),
	           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
	           //startDate:	            '2017/07/10',  // �_�l��
	           //minDate:               '-1970-01-01', // �h������(���t)���e
	           //maxDate:               '+1970-01-01'  // �h������(���t)����
	        });
	</script>
	
	</html>



