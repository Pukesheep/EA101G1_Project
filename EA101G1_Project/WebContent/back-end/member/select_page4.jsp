<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.member.model.*" %>

<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />

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
</head>

<body>
    <header class="navbar navbar-expand-md navbar-dark fixed-top">
        <a class="navbar-brand" href="#">
            <span class="logo"><i class="fas fa-bomb"></i></span>
            <span class="logo2">S.F.G</span>
            <sub><span class="logo3">Dashboard</span></sub>
        </a>

        <div class="navbar-nav ml-auto  mr-4 mr-md-0">
            <a class="nav-link login_color" href="login.html">
                <i class="fas fa-user-cog"></i> <span class="ml-2">管理員登入</span> 
            </a>
        </div>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </header>

    <div class="content d-md-flex">
        <aside class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ">
                <li class="nav-item">
                    <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl01">
                        <i class="fas fa-user-edit ml-3"></i> 會員管理</div>
                    <ul class="collapse navbar-nav" id="sideNavColl01" data-parent="#navbarNav">
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">會員權限管理</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">會員資料管理</a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl02">
                        <i class="fas fa-home-alt ml-3 mr-2"></i>商城管理</div>
                    <ul class="collapse navbar-nav" id="sideNavColl02" data-parent="#navbarNav">
                        <li class="nav-item ">
                            <a class="nav-link pl-4" href="#">商品上下架</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link pl-4" href="#">商成訂單管理</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link pl-4" href="#">限時專案管理</a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item ">
                    <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl03">
                        <i class="fas fa-gift ml-3 mr-2"></i>紅利商城管理</div>
                    <ul class="collapse navbar-nav" id="sideNavColl03" data-parent="#navbarNav">
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">紅利商品上下架</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">紅利商品訂單管理</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">紅利商品商品管理</a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item ">
                    <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl04">
                        <i class="fas fa-users-class  ml-3 mr-1"></i>團購管理</div>
                    <ul class="collapse navbar-nav pt-2" id="sideNavColl04" data-parent="#navbarNav">
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">團購訂單管理</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">團購商品管理</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">團購商品上下架</a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item ">
                    <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl05">
                        <i class="fas fa-hand-pointer ml-3 mr-2"></i>交易區管理</div>
                    <ul class="collapse navbar-nav" id="sideNavColl05" data-parent="#navbarNav">
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">交易管理</a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item ">
                    <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl06">
                        <i class="fas fa-exclamation-triangle ml-3 mr-1"></i>檢舉管理</div>
                    <ul class="collapse navbar-nav" id="sideNavColl06" data-parent="#navbarNav">
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">商品檢舉管理</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">會員檢舉管理</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">文章檢舉管理</a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item ">
                    <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl07">
                        <i class="far fa-envelope-open-text ml-3 mr-2"></i>客服中心</div>
                    <ul class="collapse navbar-nav" id="sideNavColl07" data-parent="#navbarNav">
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">客服訊息管理</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">Q&A管理</a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item ">
                    <div class="nav-link" data-toggle="collapse" data-target="#sideNavColl08">
                        <i class="fas fa-address-card ml-3 mr-2"></i>員工管理</div>
                    <ul class="collapse navbar-nav" id="sideNavColl08" data-parent="#navbarNav">
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">員工帳號管理</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link pl-4" href="#">員工權限管理</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </aside>

        <main>
            		
            		         <%-- 內容 --%>


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
<%-- 錯誤表列 --%>

</c:if>

<div class="container">
	<div class="row justify-content-between">
		<div class="col-12">
		<div class="card text-white back-end-form">
				<div class="card-body">
					<h2 class="card-title">會員查詢</h2>
					<form action="<%=request.getContextPath()%>/member/member.do" method="post">
						<div class="input-group mb-3">
							<input type="text" class="form-control" id="inlineFormInputGroup" placeholder="請輸入會員編號 ex: M000001">
							<div class="input-group-append">
								<button class="btn btn-outline-warning" type="submit">單筆查詢</button>
							</div>
						</div>
					</form>

					<form action="<%=request.getContextPath()%>/member/member.do" method="post">
						<div class="input-group mb-3">
							<select class="custom-select" id="mem_idQuery" name="mem_id">
								<c:forEach var="memberVO" items="${memberSvc.all}">
									<option value="${memberVO.mem_id}">${memberVO.mem_id}</option>
								</c:forEach>
							</select>
							<div class="input-group-append">
								<input type="hidden" name="action" value="getOne_For_Display-back">
								<button class="btn btn-outline-warning" type="submit">單筆查詢</button>
							</div>
						</div>
					</form>				
				<br>
				
					<form action="<%=request.getContextPath()%>/member/member.do" method="post">
					
						<div class="form-group">
<!-- 							<label for="mem_id">會員編號</label> -->
							<input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="請輸入會員編號 ex: M000001" autocomplete="off">
						</div>
						
						<div class="form-group">
<!-- 							<label for="mem_name">會員名稱</label> -->
							<input type="text" class="form-control" id="mem_name" name="mem_name" placeholder="請輸入會員名稱 ex: 早餐店大冰奶" autocomplete="off">
						</div>
						
						<div class="form-group">
<!-- 							<label for="mem_email">會員信箱</label> -->
							<input type="text" class="form-control" id="mem_email" name="mem_email" placeholder="請輸入會員信箱 ex: servereDiarrhea@gmail.com" autocomplete="off">
							
							<label for="mem_autho">會員權限</label>
							<div class="input-group mb-3">
								<select class="custom-select" id="mem_autho" name="mem_autho">
									<option></option>
									<option value="0">停權會員</option>
									<option value="1">一般會員</option>
									<option value="2">賣家資格會員</option>
									<option value="99">平台管理員</option>
								</select>
							</div>	
						</div>
						<input type="hidden" name="action" value="listMembers_ByCompositeQuery">
						<button type="submit" class="btn btn-outline-warning float-right">複合查詢</button>
						
					</form>

				</div>
		</div>
</div>
</div>
</div>		
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <%-- 內容 --%>   
	

            
        </main>
    </div>


</body>

</html>