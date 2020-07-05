<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<a href='<%=request.getContextPath()%>/back-end/CustomerMessage/listALL.jsp'>List</a> <br>


<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/CustomerMessage/CustomerMessage.do" >
<jsp:useBean id="cumSvc" scope="page" class="com.CustomerMessage.model.CustomerMessageService" />
       <b>選擇對話編號:</b>
       <select size="1" name="cm_id">
         <c:forEach var="cumVO" items="${cumSvc.all}" > 
          <option value="${cumVO.cm_id}">${cumVO.cm_id}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="get_One">
       <input type="submit" value="送出">
    </FORM>
<br>
<a href='<%=request.getContextPath()%>/back-end/CustomerMessage/addCMessage.jsp'>Add</a>
</body>
</html>