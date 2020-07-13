<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.productOrder.model.*"%>
<%@ page import="com.member.model.*"%>

<%
    PoService poSvc = new PoService();
	MemberVO memVO = (MemberVO) session.getAttribute("memberVO");
	String mem_id = memVO.getMem_id();
    List<PoVO> listAll = poSvc.getAll();
    List<PoVO> list = poSvc.getOrderByMemId(mem_id, listAll);
    pageContext.setAttribute("list",list);
%>
<jsp:useBean id="polSvc" scope="page" class="com.productOrderList.model.PolService" />
<jsp:useBean id="ordSvc" scope="page" class="com.ordstat.model.OrdstatService" />
<jsp:useBean id="proSvc" scope="page" class="com.product.model.ProService" />
<html>
<head>
<title>所有訂單資料</title>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
 <!-- TODO: 換title 的icon -->
    <link rel="icon shortcut" href="./img/ICON.ico">
    <!-- Bootstrap官方網站 https://getbootstrap.com/ -->
    <!-- 連結Bootstrap.min.css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- 使用font awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
        integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    <!-- 使用google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Sedgwick+Ave+Display&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lakki+Reddy&display=swap" rel="stylesheet">

    <!-- 使用style.css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <!-- 連結Bootstrap所需要的js -->
    <!-- jquery.min.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- popper.min.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <!-- bootstrap.min.js -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
        
    <!-- SweetAlert2 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
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
</style>

<style>
  table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
  td>img{
  width:200px;
  }
</style>

<style>
div.row{
  border-bottom:2px solid #305d8a;
}
div.container{
margin-bottom:4px;
}
</style>

</head>
<body bgcolor='white'>


<table style:"margin:0px auto">

<div style="margin-left:300px"><%@ include file="pages/page1.file" %></div> 
	<!--測試開始-->
	<c:forEach var="poVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	<div class="container">
  <div class="row">
    <!--頭-->
    <div class="col-md-12" >
      <div class="row"style="height:35px;" >
        <div class="col-4 ord_id" style="background-color:#007bff;">訂單編號:${poVO.po_id}</div>
        <div class="col-4 ord_date" style="background-color:#007bff">訂單日期:${poVO.add_date}</div>
        <div class="col-2 ord_stat" style="background-color:#007bff">狀態:${ordSvc.listOneOrdstat(poVO.ordstat_id).ordstat}</div>
       <div class="col-2 ord_change" style="background-color:#007bff">
       <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/productOrder/Po.do" style="margin-bottom: 0px;">
			  	<c:if test="${poVO.ordstat_id == '003'}">
			     <input type="submit" value="取消">
			     <input type="hidden" name="ordstat_id"  value="007">
			    </c:if> 
			    <c:if test="${poVO.ordstat_id == '006'}">
			     <input type="submit" value="完成">
			     <input type="hidden" name="ordstat_id"  value="014">
			    </c:if> 
			     <input type="hidden" name="url" value="<%=request.getServletPath()%>?<%=request.getQueryString()%>">
			     <input type="hidden" name="po_id"  value="${poVO.po_id}">
			     <input type="hidden" name="action"	value="updateOrdStat"></FORM>
       </div>
        </div>
      <!--頭-->
      
      <!--商品區-->
      <c:forEach var="polVO" items="${polSvc.getPolbyPoId(poVO.po_id)}">
      <div class="row"style="height:35px">
          <div class="col-4 p_name" style="background-color:white">${proSvc.getOnePro(polVO.p_id).p_name}</div>
          <div class="col-4 p_qua" style="background-color:white">X${polVO.order_qua}</div>
            <div class="col-4 p_price" style="background-color:white">$${polVO.p_price}</div>
      </div>
      </c:forEach>
       <!--商品區-->
      
      <div class="row"style="height:35px">
        <div class="col-md-10" style="background-color:#c6d4df"><div class="empty"></div></div>
        <div class="col-md-2" style="background-color:#c6d4df"><div class="p_amont">總金額:${poVO.amount}</div></div>
      </div>
      
    </div>
    
  </div>
  </div>
  </c:forEach>
 <!--測試結束-->
</table>
<div style="margin-left:300px"><%@ include file="../../../files/page2.file" %></div> 
</body>
</html>