<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.auct.model.*"%>
<%@ page import="com.member.model.*"%>


<%    
    MemberVO memVO=null;
	if(session.getAttribute("memberVO")!=null){
		memVO = (MemberVO) session.getAttribute("memberVO");
	}else{
		memVO = new MemberVO();
		memVO.setMem_id("guest");
	}
    
    AuctService auctSvc = new AuctService();
    List<AuctVO> list = auctSvc.getAllFront();
    pageContext.setAttribute("list",list);
%>
<jsp:useBean id="PtSvc" scope="page" class="com.productType.model.PtService" />
<jsp:useBean id="MemberSvc" scope="page" class="com.member.model.MemberService" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BID�v�бM��</title>
    <!-- TODO: ��title ��icon -->
    <link rel="icon shortcut" href="images/ICON(yellow).ico">
    <!-- Bootstrap�x����� https://getbootstrap.com/ -->
    <!-- �s��Bootstrap.min.css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- �ϥ�font awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
        integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    <!-- �ϥ�google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Sedgwick+Ave+Display&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lakki+Reddy&display=swap" rel="stylesheet">

    <!-- �ϥ�style.css -->
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/Auct_index.css">

    <!-- �s��Bootstrap�һݭn��js -->
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
        

</head>

<body>
    <!-- navbar -->
    <nav class="navbar navbar-expand-md navbar-dark fixed-top">
        <a class="navbar-brand" href="All_index.jsp">
            <span class="logo"><i class="fas fa-bomb"></i></span>
            <span class="logo2">S.F.G</span>
            <span class="logo3">{{{</span>
            </a>
            <!-- ��������s -->
            <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId"
                aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- ���e -->
            <div class="navbar2 navbar-dark">
                <div class="row">
                    <div class="item col-md-2"><a href="#">�ӫ� </a></div>
                    <div class="item col-md-2"><a href="#">���� </a></div> 
                    <div class="item col-md-2"><a href="<%=request.getContextPath()%>/front-end/auct/Auct_index.jsp">�v�а� </a></div> 
                    <div class="item col-md-2"><a href="#">���ʰ� </a></div> 
                    <div class="item col-md-2"><a href="<%=request.getContextPath()%>/front-end/post/listAllPost.jsp">�Q�װ� </a></div> 
                    <div class="item col-md-2"><a href="#">���Q </a></div> 
                </div>
            </div>
    
            <div class="collapse navbar-collapse" id="collapsibleNavId">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">�n�X</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">���U</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">�|������</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">�ڪ��̷R</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">�ʪ���</a>
                    </li>
    
                </ul>
            </div>
        </nav>
        <!-- navbar end -->
        <section class="blank0"></section>

        <section class="nav-auct container">
            <ul class="text-right">
                <li class="auct-navbtn">
                    <a href="">�v�бM��</a>
                </li>
                <li class="auct-navbtn">
                    <a href="">���бM��</a>
                </li>
                <li class="auct-navbtn">
                    <a href="">�X���O��</a>
                </li>
                <li class="auct-navbtn">
                    <a href="">�ԧQ�~</a>
                </li>
                <li class="auct-navbtn">
                    <a href="<%=request.getContextPath()%>/front-end/auct/2_listAllAuct.jsp">�ڪ�����</a>
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
                                            <a href="bid_product.jsp">
                                            	<img src="<%=request.getContextPath()%>/auct/pic.do?auct_id=${auctVO.auct_id}" height="200px">
                                            </a>
                                        </li>
                                        
                                        
                                        <li id="bid_state">${auctVO.auct_start}
<%--                                         	<% --%>
// 											for (AuctVO auctVO : list) {
// 													java.util.GregorianCalendar time = new java.util.GregorianCalendar();
// 													long now_ms = time.getTimeInMillis();
// 													out.println(now_ms);
// 													java.sql.Timestamp startTime = auctVO.getAuct_start();
// 													long a = startTime.getTime();
// 													out.println(a);
// 													java.sql.Timestamp endTime = auctVO.getAuct_end();
// 													long b = endTime.getTime();
// 													out.println(b);
// 													if (now_ms < a) {
// 														out.println("��楼�}�l");
// 													} else if (now_ms >= a && now_ms<=b) {
// 														out.println("���i�椤");
// 													} 
// 												}
<%-- 											%> --%>
                                        </li>
                                        
                                        <li>���}�l�ɶ�:</li>
                                        <li class="" id="bid_start">
                                        	<fmt:formatDate value="${auctVO.auct_start}" pattern="yyyy-MM-dd HH:mm:ss" />
                                        </li>  
<!--                                         <li id="bid_state"></li> -->
                                        
                                        <li>NTD  ��</li>
                                        <li>�ثe:��</li>
                                        <li>
	                                        <a href="bid_product.jsp">
	                                        	<button type="submit" class="bid-btn">�ڭn�v��</button>
	                                        </a>
                                        </li>
                                    </ul>
                                </div>                  
                            </div>
                        </div>
                    </div>            
                 
                 
</c:forEach>


<script type="text/javascript">
	function bidstate(){
		
		var now = new Date(); //�{�b�ɶ�
/* 		var now_ms = now.getTime(); //�নlong */
		
		var	timer = setInterval(function(){
			$('li.bid_start').each(function(){
				if(now<this){
					var bid_state = "��楼�}�l";
				(bid_state).innerText = document.getElementById('bid_state');
				}
			}); 
		}, 3000);//�C3�� ,����1��
	
			if (tick > think.length - 1) {
				tick = 0;
			}		
	}
</script>

<!-- JSTL for-each   end-->
<%@ include file="page4.file" %>

                </div>
            </div>
        </section>


        <!-- ��ѫ� -->
        <button id="chatBtn" class="bg-primary">
            <i class="fas fa-comments"></i>
        </button>


</body>
</html>