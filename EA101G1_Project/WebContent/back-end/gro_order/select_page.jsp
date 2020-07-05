<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li><a href='<%=request.getContextPath()%>/back-end/gro_order/listAll.jsp'>Gro_order</a> all Gro_order. <br>
		<br></li>




		<jsp:useBean id="g_orderSvc" scope="page" class="com.gro_order.model.Gro_orderService" />

		<li>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/gro_order/Gro_order.do">
				<b>選擇團購訂單編號:</b> <select size="1" name="ord_Id">
					<c:forEach var="g_orderVO" items="${g_orderSvc.all}">
						<option value="${g_orderVO.ord_Id}">${g_orderVO.ord_Id}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>


	</ul>


	<h3>團購訂單管理</h3>

	<ul>
		<li><a href='<%=request.getContextPath()%>/back-end/gro_order/addG_order.jsp'>團購訂單新增</a> a new Gro_order.</li>
	</ul>
</body>
</html>