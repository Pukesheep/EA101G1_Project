<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.auct.model.*"%>
<%@ page import="com.member.model.*"%>


<%    
    AuctService auctSvc = new AuctService();
    List<AuctVO> list = auctSvc.getAllFront();
    pageContext.setAttribute("list",list);
%>

<%
	java.util.GregorianCalendar time = new java.util.GregorianCalendar();
	long now_ms = time.getTimeInMillis();
	pageContext.setAttribute("now_ms", now_ms);
%>
<jsp:useBean id="PtSvc" scope="page" class="com.productType.model.PtService" />
<jsp:useBean id="MemberSvc" scope="page" class="com.member.model.MemberService" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BID�v�бM��</title>
    <%@ include file="/files/HeaderCssLink" %>
    <!-- �ϥ�style.css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/Auct_index.css">

   
</head>

<body>
     <!-- navbar -->
    	<%@ include file="/files/header.jsp" %>
    <!-- navbar end -->
    <section class="blank0"></section>
    <!-- ���e -->

        <section class="nav-auct container">
            <ul class="text-right">
                <li class="auct-navbtn">
                    <a href="<%=request.getContextPath()%>/front-end/protected/auct/Auct_index.jsp">�v�бM��</a>
                </li>
                <li class="auct-navbtn">
                    <a href="<%=request.getContextPath()%>/front-end/protected/auct/Results_all.jsp">���бM��</a>
                </li>
                <li class="auct-navbtn">
                    <a href="">�X���O��</a>
                </li>
                <li class="auct-navbtn">
                    <a href="<%=request.getContextPath()%>/front-end/protected/auct/buy_order.jsp">�ԧQ�~</a>
                </li>
                <li class="auct-navbtn">
                    <a href="<%=request.getContextPath()%>/front-end/protected/auct/listAllAuct.jsp">�ڪ�����</a>
                </li>
            </ul>
            <h6 class="h6"> <a class="a-index" href="All_index.jsp">����</a> > �v�а�</h6>

        </section>

        <header class="container">
            <!-- �Ϥ� -->
            <div>
                <a href="   "><img src="images/ps5-0001.jpg" alt=""></a>
            </div>
            <!-- �Ϥ� end -->
        </header>

        <section class="auct-all container">
            <div class="">
                <div class="auct-title py-2">
                    <span class="span1">&nbsp&nbsp&nbsp&nbsp<i class="far fa-clock"></i></span>
                    <span class="span2"> &nbsp���ɩ��</span>
                </div>
                <div class="auct-list bg-white row">
 
<%@ include file="page3.file" %>                
<!-- JSTL for-each -->
<c:forEach var="auctVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
    <%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">��楼�}�l:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
     <div class="product col-md-4 mb-5">
                        <div class="product-rel">
                            <div class="auct-title  py-3">
                                <h6 class="text-center">${auctVO.auct_name}</h6>
                            </div>
                            <div class="auct-list">
                                <div>
                                    <ul>
                                    	<li>���� : ${auctVO.marketPrice}��</li>
                                        <li>
                                            <img src="<%=request.getContextPath()%>/front-end/auct/pic.do?auct_id=${auctVO.auct_id}" height="200px">
                                        </li>
                                        
                                       <jsp:useBean id="auctVO" scope="page" class="com.auct.model.AuctVO" />
                                        
                                        <li id="bid_state" style="color:red;font-weight:bolder;">
											<%
												Timestamp startTime = auctVO.getAuct_start();
													long a = startTime.getTime();
													Timestamp endTime = auctVO.getAuct_end();
													long b = endTime.getTime();
													if (now_ms < a) {
														out.println("��楼�}�l");
													} else if (now_ms >= a && now_ms <=b) {
														out.println("���i�椤");
													} else {
														out.println("���w����");
													}
											%>
										</li>
                                        
                                        <li>���}�l�ɶ�:</li>
										<li class="${auctVO.auct_id} bid_start" id="bid_start1" onclick="bidstate()" value="${auctVO.auct_start}">
											<fmt:formatDate value="${auctVO.auct_start}" pattern="yyyy-MM-dd HH:mm:ss" />
										</li>
										<li>��浲���ɶ�:</li>
										<li class="${auctVO.auct_id} bid_end" id="bid_end1" onclick="bidstate()" value="${auctVO.auct_end}">
											<fmt:formatDate value="${auctVO.auct_end}" pattern="yyyy-MM-dd HH:mm:ss" />
										</li>
                                        
                                        <li>NTD  ��</li>
                                        <li>�ثe:��</li>
                                        
                                        <li>
												<form METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/auct/auct.do">
													<input type="hidden" name="auct_id" value="${auctVO.auct_id}">
													<input type="hidden" name="auct_start" value="${auctVO.auct_start}">
													<input type="hidden" name="action" value="bid_info">
													<button type="submit" class="bid-btn">�ڭn�v��</button>
												</form>
										</li>
										
                                    </ul>
                                </div>                  
                            </div>
                        </div>
                    </div>            
                 
</c:forEach>
<!-- JSTL for-each   end-->

<%@ include file="page4.file" %>

<script type="text/javascript">
// 	function bidstate(){
		
// 		var now = new Date(); //�{�b�ɶ�
// /* 		var now_ms = now.getTime(); //�নlong */
		
// 		var	timer = setInterval(function(){
// 			$('li.bid_start').each(function(){
// 				if(now<this){
// 					var bid_state = "��楼�}�l";
// 				(bid_state).innerText = document.getElementById('bid_state');
// 				}
// 			}); 
// 		}, 3000);//�C3�� ,����1��
	
// 			if (tick > think.length - 1) {
// 				tick = 0;
// 			}		
// 	}
	
// 	$('.bid-btn').click(function(){
// 		if (${sessionScope.memberVO != null}){
// 			console.log('123');
// 		} else {
<%-- 			<% --%>
// 				session.setAttribute("location", request.getRequestURI());
<%-- 			%> --%>
<%-- 			document.location.href = '<%=request.getContextPath()%>/front-end/member/login.jsp'; --%>
// 		}
// 	})
</script>


                </div>
            </div>
        </section>


        <!-- ��ѫ� -->
        <button id="chatBtn" class="bg-primary">
            <i class="fas fa-comments"></i>
        </button>


</body>
</html>