<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="com.post.model.*" %>
<%@ page import="com.member.model.*" %>
<%@ page import="com.favpost.model.*" %>

<%
	PostService postSvc = new PostService();
	java.util.List<PostVO> list = postSvc.getAll();
	pageContext.setAttribute("list", list);
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
	PostVO postVO = (PostVO) request.getAttribute("postVO");
	
%>
<jsp:useBean id="ptypeSvc" scope="page" class="com.ptype.model.PtypeService" />
<jsp:useBean id="favpostSvc" scope="page" class="com.favpost.model.FavpostService" />
<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />
<jsp:useBean id="commSvc" scope="page" class="com.comm.model.CommService" />

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>討論區</title>
    <!-- TODO: 換title 的icon -->
    <link rel="icon shortcut" href="<%=request.getContextPath()%>/front-end/img/ICON.ico">
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/style.css">

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
	<!-- CKEditor -->
	<script src="<%=request.getContextPath()%>/files/ckeditor/ckeditor.js"></script>
	<!-- post.css -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/post.css">
	
	
</head>
<body>
    <!-- navbar -->
    <!-- 使用Boostrap Navbar -->
    <!-- 設定Navbar緊貼畫面上緣 -->
    <!-- b4-navbar-default 安裝Bootstrap外掛,可以使用快捷指令 -->
    <nav class="navbar navbar-expand-md navbar-dark fixed-top">
        <a class="navbar-brand" href="<%=request.getContextPath()%>/front-end/index.jsp">
            <span class="logo"><i class="fas fa-bomb"></i></span>
            <span class="logo2">S.F.G</span>
            <span class="logo3">{{{</span>
        </a>
        <!-- 手機選單按鈕 -->
        <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId"
            aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="navbar2 navbar-dark">
            <div class="row">
                <div class="item col-md-2"><a href="#"></a>商城</div>
                <div class="item col-md-2"><a href="#"></a>團購</div>
                <div class="item col-md-2"><a href="#"></a>交易</div>
                <div class="item col-md-2"><a href="<%=request.getContextPath()%>/front-end/post/listAllPost.jsp">討論區</a></div>
                <div class="item col-md-2"><a href="#"></a>紅利</div>
                <div class="item col-md-2"><a href="#"></a>Q&A</div>
            </div>
        </div>

        <div class="collapse navbar-collapse" id="collapsibleNavId">
            <ul class="navbar-nav ml-auto">
                <c:if test="${memberVO == null}">
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/front-end/member/login.jsp">登入</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/front-end/member/addMember.jsp">註冊</a>
                </li>
            </c:if>
            <c:if test="${sessionScope.memberVO ne null}">
            	
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/member/member.do?action=getOne_For_Update-front&mem_id=${sessionScope.memberVO.mem_id}">會員中心</a>
                </li>
                <li class="nav-item">
                	<a class="nav-link" href="<%=request.getContextPath()%>/member/login.do?action=logout">登出</a>
                </li>
          	</c:if>
                <li class="nav-item">
                    <a class="nav-link" href="#">我的最愛</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">購物車</a>
                </li>

            </ul>
        </div>


    </nav>
    <!-- navbar end -->
    <section class="blank0"></section>
    <!-- 內容 -->

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
</c:if>
<%-- 錯誤表列 --%>

<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/front-end/index.jsp">首頁</a></li>
		<li class="breadcrumb-item active" aria-current="page">討論區</li>
	</ol>
</nav>

<div class="container">
	<div class="row">
	
		<%-- 新增文章區塊 --%>
		<div class="col-md-12">
			<form action="<%=request.getContextPath()%>/post/post.do" method="post" enctype="multipart/form-data" id="form-insert">
				<div class="row">
					<div class="col-md-8 offset-md-2">
						<div class="form-group">
							<input type="text" class="form-control insert-head" name="p_title" placeholder="Hi ${sessionScope.memberVO.mem_name}, 在想什麼嗎？" autocomplete="off" id="p_title" >
						</div>
						<div class="collapse insert-body" id="collapseExample">
							<div class="form-group">
								<select class="form-control" name="ptype_id" id="ptype_id">
									<optgroup label="文章分類">
										<c:forEach var="ptypeVO" items="${ptypeSvc.all}" varStatus="s">
											<c:if test="${s.count < 5}">
												<option value="${ptypeVO.ptype_id}">${ptypeVO.type}</option>
											</c:if>
											<c:if test="${sessionScope.memberVO.mem_id eq 'M000012' and s.count >= 5}">
												<option value="${ptypeVO.ptype_id}">${ptypeVO.type}</option>
											</c:if>
										</c:forEach>
									</optgroup>
								</select>
								<div class="card pp_image" style=" height: 8rem;">
									<label for="upload">
										<img class="card-img-top" alt="" src="<%=request.getContextPath()%>/images/post/toupload.png" id="p_image" style=" height: 7.8rem;">
									</label>
								</div>
								<input class="d-none" type="file" name="image" id="upload">	
								<textarea name="text" id="p_text"></textarea>
								<script>
									CKEDITOR.replace('p_text', {
										language: 'zh'
									});
			                	</script>
							</div>
							<script>
								var ptype_id = document.getElementById('ptype_id').value;
								$('#ptype_id').change(function(){
									
// 									$('this:last-child').val();
									console.log($('select#ptype_id > select').val());
								});
							</script>
			                <div class="d-flex justify-content-between">
								<button type="button" class="btn btn-danger btn-lg canceledit">取消</button>
								<button type="button" class="btn btn-secondary btn-lg cleanedit">清除</button>
								<input type="hidden" name="action" value="insert">
								<input type="hidden" name="mem_id" value="${sessionScope.memberVO.mem_id}">
								<input type="hidden" name="p_status" value="1">
								<button type="submit" class="btn btn-primary btn-lg submitedit">完成</button>
							</div>
						</div>
					</div>
					<div class="col-1">
								<%-- 
<!-- 			                <div class="d-flex justify-content-between"> -->
				                <div class="row">
				                	<button type="button" class="btn btn-danger btn-lg canceledit">取消</button>
				                </div>
				                <div class="row ">
									<button type="button" class="btn btn-secondary btn-lg cleanedit">清除</button>
				                </div>
				                <div class="row ">
									<button type="submit" class="btn btn-primary btn-lg">完成</button>
				                </div>
								<input type="hidden" name="action" value="insert">
								<input type="hidden" name="mem_id" value="${sessionScope.memberVO.mem_id}">
								<input type="hidden" name="p_status" value="1">
<!-- 							</div> -->
								--%>
					</div>
				</div>
			</form>
		</div>
		<%-- 新增文章區塊 --%>
		
		
		<div class="row">
		<%-- 文章呈現區塊 --%>
		<c:forEach var="postVO" items="${list}">
			<c:if test="${postVO.p_status eq 1}">
				<div class="col-4 justify-content-around">
					<div class="accordion" id="accordionExample">
						<div class="row">
							<div class="card w-100 border-dark" id="card${postVO.post_id}">
								<label for="${postVO.post_id}">
									<img alt="" src="<%=request.getContextPath()%>/post/ShowPostPic.do?post_id=${postVO.post_id}" class="card-img">
								</label>
							<div class="card-header text-center" id="heading${postVO.post_id}">
								<h5 class="card-title">
								<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse${postVO.post_id}" aria-expanded="false" aria-controls="collapse${postVO.post_id}" id="${postVO.post_id}">
									<c:forEach var="ptypeVO" items="${ptypeSvc.all}">
				      					<c:if test="${postVO.ptype_id == ptypeVO.ptype_id}">
				      						[${ptypeVO.type}] ${postVO.p_title}
				      					</c:if>
			      					</c:forEach>
								</button>
								</h5>
								<c:forEach var="memberVOpost" items="${memberSvc.all}">
									<c:if test="${memberVOpost.mem_id == postVO.mem_id}">
										<small class="text-muted">
											文章作者 ：<a href="<%=request.getContextPath()%>/member/member.do?action=getOne_For_Display-front&mem_id=${postVO.mem_id}">${memberVOpost.mem_name}<img class="postBy" alt="" src="<%=request.getContextPath()%>/member/ShowMemberPic.do?mem_id=${postVO.mem_id}"></a>
											<br>
											<br>
										</small>
										<c:if test="${sessionScope.memberVO ne null}">
								      		<c:if test="${favpostSvc.getOneFavpost(memberVO.mem_id, postVO.post_id).mem_id eq null}">
								      			<img class="img-icon" alt="" src="<%=request.getContextPath()%>/images/icons/empty.png" id="${postVO.post_id}${memberVO.mem_id}" title="收藏文章">
								      		</c:if>
					      					<c:forEach var="favpostVO" items="${favpostSvc.all}">
									      		<c:if test="${favpostVO.mem_id == memberVO.mem_id and favpostVO.post_id == postVO.post_id}">
									      			<img class="float-right img-icon" alt="" src="<%=request.getContextPath()%>/images/icons/full.png" id="${postVO.post_id}${memberVO.mem_id}" title="取消收藏">
									      		</c:if>
					      					</c:forEach>
					      					<img class="img-icon" alt="" src="<%=request.getContextPath()%>/images/icons/comm.png" id="${postVO.post_id}${memberVO.mem_id}" title="回覆文章">
					      					<img class="img-icon" alt="" src="<%=request.getContextPath()%>/images/icons/reportmember.png" id="${postVO.post_id}${memberVO.mem_id}" title="檢舉會員">
					      					<img class="img-icon" alt="" src="<%=request.getContextPath()%>/images/icons/reportpost.png" id="${postVO.post_id}${memberVO.mem_id}" title="檢舉文章">
											<c:if test="${sessionScope.memberVO.mem_id == postVO.mem_id}">
												<img class="img-icon" alt="" src="<%=request.getContextPath()%>/images/icons/remove.png" id="${postVO.post_id}${memberVO.mem_id}" title="移除文章">
												<img class="img-icon ${postVO.post_id}" alt="" src="<%=request.getContextPath()%>/images/icons/update.png" id="${postVO.post_id}${memberVO.mem_id}" title="修改文章">
											</c:if>
			      						</c:if>
									</c:if>
								</c:forEach>
							</div>
							<div class="collapse reply" id="reply${postVO.post_id}">
								<div class="card card-body bg-secondary">
									<div class="row">
										<div class="col">
											<input type="text" class="form-control c_text" name="c_text" placeholder="請輸入留言...." id="${postVO.post_id}">
											<br>
											<img class="img-icon float-left d-inline-block" id="${postVO.post_id}" alt="" src="<%=request.getContextPath()%>/images/icons/cross.png" title="取消">
											<img class="img-icon float-right d-inline-block" id="${postVO.post_id}${sessionScope.memberVO.mem_id}" alt="" src="<%=request.getContextPath()%>/images/icons/checked.png" title="送出">
										</div>
									</div>
								</div>
							</div>
							<div id="collapse${postVO.post_id}" class="collapse" aria-labelledby="heading${postVO.post_id}" data-parent="#accordionExample">
								<div class="card-body h5 bg-warning">
									<b>
										${postVO.text}
									</b>
								</div>
								<div class="card-header text-center" id="heading${postVO.post_id}">
									<h5 class="card-title">
										<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse${postVO.post_id}" aria-expanded="false" aria-controls="collapse${postVO.post_id}">
											⇈⇈
										</button>
									</h5>
								</div>
							</div>
							
								<c:if test="${commSvc.findComm(postVO.post_id).comm_id ne null}">
								
									<div class="accordion" id="accordionExample">
										<div class="card-header text-center" id="headingOne">
											<h5 class="card-title">
												<button class="btn btn-link" type="button" data-toggle="collapse" data-target=".${postVO.post_id}" aria-expanded="false" aria-controls="collapseOne">
													⇩⇩
												</button>
											</h5>
										</div>
										<c:forEach var="commVO" items="${commSvc.all}">
											<c:if test="${commVO.c_status eq 1}">
												<c:if test="${commVO.post_id == postVO.post_id}">
													<div id="collapseOne" class="collapse ${postVO.post_id}" aria-labelledby="headingOne" data-parent="#accordionExample">
														<c:forEach var="memberVOcomm" items="${memberSvc.all}">
															<c:if test="${memberVOcomm.mem_id == commVO.mem_id}">
																<div class="card-header bg-success">
																	<small class="text-muted">
																		留言會員 ：<a href="<%=request.getContextPath()%>/member/member.do?action=getOne_For_Display-front&mem_id=${commVO.mem_id}">${memberVOcomm.mem_name}<img class="postBy" alt="" src="<%=request.getContextPath()%>/member/ShowMemberPic.do?mem_id=${commVO.mem_id}"></a>
																	</small>
																	<c:if test="${sessionScope.memberVO ne null}">
																		<img class="img-icon" alt="" src="<%=request.getContextPath()%>/images/icons/reportmember.png" id="${commVO.comm_id}${memberVO.mem_id}" title="檢舉會員">
																		<c:if test="${sessionScope.memberVO.mem_id == commVO.mem_id}">
																			<img class="img-icon" alt="" src="<%=request.getContextPath()%>/images/icons/remove.png" id="${commVO.comm_id}${memberVO.mem_id}" title="移除留言">
																			<img class="img-icon" alt="" src="<%=request.getContextPath()%>/images/icons/update.png" id="${postVO.post_id}${commVO.comm_id}${sessionScope.memberVO.mem_id}" title="修改留言">
																			<br>
																		</c:if>
																	</c:if>
																</div>
															</c:if>
														</c:forEach>
														 
														<div class="collapse reply" id="update${commVO.comm_id}">
															<div class="card card-body bg-secondary">
																<div class="row">
																	<div class="col">
																		<input type="text" class="form-control c_text" name="c_text" placeholder="請輸入留言...." id="${postVO.post_id}${commVO.comm_id}${memberVO.mem_id}" value="${commVO.c_text}">
																		<br>
																		<img class="img-icon float-left d-inline-block" id="${commVO.comm_id}" alt="" src="<%=request.getContextPath()%>/images/icons/cross.png" title="取消">
																		<img class="${postVO.post_id} img-icon float-right d-inline-block" id="${commVO.comm_id}${sessionScope.memberVO.mem_id}" alt="" src="<%=request.getContextPath()%>/images/icons/checked.png" title="送出">
																	</div>
																</div>
															</div>
														</div>
														
														<div class="card-body h6 bg-warning">
															<small class="text-muted post_time float-right">留言時間 ： <fmt:formatDate value="${commVO.post_time}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
															<br>
															<small class="text-muted last_time float-right">修改時間 ： <fmt:formatDate value="${commVO.last_edit}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
															<br>
															<br>
															<b>
																${commVO.c_text}
															</b>
															<br>
														</div>
													</div>
												</c:if>
											</c:if>		
										</c:forEach>
										<div id="collapseOne" class="collapse ${postVO.post_id}" aria-labelledby="headingOne" data-parent="#accordionExample">
											<div class="card-header text-center" id="headingOne">
												<h5 class="card-title">
													<button class="btn btn-link" type="button" data-toggle="collapse" data-target=".${postVO.post_id}" aria-expanded="false" aria-controls="collapseOne">
														⇧⇧
													</button>
												</h5>
											</div>
										</div>
									</div>
									
								</c:if>		
								<div class="card-footer">
									<small class="text-muted post_time float-right">張貼時間 ： <fmt:formatDate value="${postVO.post_time}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
									<br>
									<small class="text-muted last_edit float-right">修改時間 ： <fmt:formatDate value="${postVO.last_edit}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
								</div>
							</div>
						
						</div>
					</div>
				</div>
	
	
				
<!-- 修改文章區塊 -->
<div class="modal fade modal-update" id="modal-update${postVO.post_id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form action="<%=request.getContextPath()%>/post/post.do" method="post" enctype="multipart/form-data" id="form-upload${postVO.post_id}">
			<div class="modal-body">
				<div class="container-fluid">
					
						<div class="row">
							<div class="col-12">
								<div class="form-group">
									<input type="text" class="form-control" name="p_title" placeholder="請輸入文章標題..." autocomplete="off" value="${postVO.p_title}" >
									<select class="form-control" name="ptype_id">
										<optgroup label="文章分類">
											<c:forEach var="ptypeVO" items="${ptypeSvc.all}" varStatus="s">
												<c:if test="${s.count < 5}">
													<option value="${ptypeVO.ptype_id}">${ptypeVO.type}</option>
												</c:if>
												<c:if test="${sessionScope.memberVO.mem_id eq 'M000012' and s.count >= 5}">
													<option value="${ptypeVO.ptype_id}" ${(ptypeVO.ptype_id == postVO.ptype_id) ? "selected" : "" }>${ptypeVO.type}</option>
												</c:if>
											</c:forEach>
										</optgroup>
									</select>
									<div class="card pp_image" style=" height: 8rem;">
										<label for="upload${postVO.post_id}">
											<img class="card-img-top" alt="" src="<%=request.getContextPath()%>/post/ShowPostPic.do?post_id=${postVO.post_id}" id="p_image${postVO.post_id}" style=" height: 7.8rem;">
											<input class="d-none" type="file" name="image" id="upload${postVO.post_id}">
										</label>
									</div>
									<textarea name="text" id="p_update${postVO.post_id}">${postVO.text}</textarea>
									<script>
										CKEDITOR.replace('p_update${postVO.post_id}', {
											language: 'zh'
										});
			                		</script>
								</div>
							</div>
						</div>
				</div>
			</div>
				<div class="d-flex justify-content-around">
					<button type="button" class="btn btn-danger btn-lg cancelupdate">取消</button>
					<button type="button" class="btn btn-secondary btn-lg cleanupdate" id="cleanBtn${postVO.post_id}">清除</button>
					<input type="hidden" name="action" value="update">
					<input type="hidden" name="post_id" value="${postVO.post_id}">
					<input type="hidden" name="mem_id" value="${sessionScope.memberVO.mem_id}">
					<input type="hidden" name="p_status" value="1">
					<button type="submit" class="btn btn-primary btn-lg">完成</button>
				</div>
				<br>
				</form>
		</div>
	</div>
</div>
<script>
	$('.cleanupdate').click(function(){
		
		var thisID = this.id;
		var post_id = thisID.substring(8);
		var target = 'form-upload' + post_id;
		var formUpload = document.getElementById(target);
		formUpload.reset();
		
		$('#p_image' + post_id).attr('src', '<%=request.getContextPath()%>/images/post/toupload.png');
		CKEDITOR.instances.p_update${postVO.post_id}.setData('');
	});
    
    upload${postVO.post_id}.addEventListener("change", function(){
    	var qqq = $(this).prevAll('img');
    	
    	var files = this.files;
        if (files && files[0]) {
            for (i = 0; i < files.length; i ++) {
                if (files[i].type.indexOf("image") < 0) {
					Swal.fire({
						icon: 'error',
						title: '上傳的格式不符'
					})
                } else {
                    var file = files[i];
                    var reader = new FileReader();
                    
                    reader.onload = function(e) {
                        var result = e.target.result;
                        qqq.attr('src', result);

                    }
                    reader.readAsDataURL(file);
                }
            }
        }
    })
</script>				
<!-- 修改文章區塊 -->			
				
			</c:if>
		</c:forEach>
	</div>
</div>
<%-- 文章呈現區塊 --%>
</div>
<%-- 顯示收藏文章區塊 --%>
<div class="col-3">
	<div class="toast" role="alert" aria-live="assertive" aria-atomic="true">
		<div class="toast-header">
			<img src="<%=request.getContextPath()%>/images/icons/full.png" class="rounded mr-2 img-icon-mini" alt="">
			<strong class="mr-auto">收藏文章列表</strong>
			<button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="toast-body">
			<c:forEach var="favpostVO" items="${favpostSvc.all}">
				<c:if test="${favpostVO.mem_id == sessionScope.memberVO.mem_id}">
					<c:forEach var="postVO" items="${list}">
						<c:if test="${favpostVO.post_id == postVO.post_id}">
							<c:if test="${postVO.p_status eq 1}">
								<c:forEach var="ptypeVO" items="${ptypeSvc.all}">
									<c:if test="${postVO.ptype_id == ptypeVO.ptype_id}">
										<div class="row">
											<div class="col">
												<p class="text-center" id="listAllFavpost">
													<a href="#card${postVO.post_id}">
														<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse${postVO.post_id}" aria-expanded="false" aria-controls="collapse${postVO.post_id}" id="${postVO.post_id}">
															[${ptypeVO.type}] ${postVO.p_title}
														</button>
													</a>
												</p>	
											</div>	
										</div>
									</c:if>
								</c:forEach>
							</c:if>
						</c:if>
					</c:forEach>
				</c:if>
			</c:forEach>
		</div>
	</div>
</div>
<%-- 顯示收藏文章區塊 --%>




<%-- 開啟收藏文章按鈕 --%>
<c:if test="${sessionScope.memberVO ne null}">
	<button id="btn-toast" class="bg-primary btn-toast-show">
		<img class="icon-toast" alt="" src="<%=request.getContextPath()%>/images/icons/full.png">
	</button>	
	<script>
		$('#btn-toast').click(function(){
			$('.toast').toast({
	            autohide: false
	        });
			$('.toast').toast('show');
		})
		
	</script>
</c:if>
<%-- 開啟收藏文章按鈕 --%>


<a type="button" class="btn btn-secondary" data-container="body" data-toggle="popover${memberVO.mem_id}" data-placement="top" data-content="${memberVO.mem_id}">
  Popover on top
</a>

<script>
	$(function () {
		$('[data-toggle="popover${memberVO.mem_id}"]').popover();
	})
</script>

<script>
	// 處理icon圖片及功能的切換
	$('img.img-icon').click(function(){
		var source = $(this).attr('src');
		if (source.includes('empty')){
			// full 為 實心愛心圖案, 代表收藏文章功能, 按下後置換圖片, 並且以AJAX方式送出請求
			var thisID = this.id;
			var post_id = thisID.substring(0, 10);
			var mem_id = thisID.substring(10, 17);
			$(this).attr('src', '<%=request.getContextPath()%>/images/icons/full.png');
			$(this).attr('title', '取消收藏');
			$.ajax({
				url: '<%=request.getContextPath()%>/favpost/favpost.do',
				type: 'POST',
				data: {
					post_id: post_id,
					mem_id: mem_id,
					action: 'insert'
				},
				success: function(){
					Swal.fire({
						icon: 'info',
						title: '收藏文章成功',
						showConfirmButton: false,
						timer: 750
					})
				}
			});
			
		} else if (source.includes('full')){
			// empty 代表空心愛心圖案, 代表取消收藏功能, 按下後置換圖片, 並且以AJAX方式送出請求
			var thisID = this.id;
			var post_id = thisID.substring(0, 10);
			var mem_id = thisID.substring(10, 17);
			$(this).attr('src', '<%=request.getContextPath()%>/images/icons/empty.png');
			$(this).attr('title', '收藏文章');
			$.ajax({
				url: '<%=request.getContextPath()%>/favpost/favpost.do',
				type: 'POST',
				data: {
					post_id: post_id,
					mem_id: mem_id,
					action: 'delete'
				},
				success: function(){
					Swal.fire({
						icon: 'info',
						title: '取消收藏成功',
						showConfirmButton: false,
						timer: 750
					})
				}
			});
		} else if (source.includes('remove')){
			// remove 為垃圾桶圖案, 代表移除文章或留言
			var thisID = this.id;
			if (thisID.includes('POST')){
				// 每個.img-icon 的 img 標籤的 ID 當中都加入了
				// ${postVO.post_id}${memberVO.mem_id} 或是 ${commVO.comm_id}${memberVO.mem_id}
				// 以此判斷是文章或是留言的移除 icon 被按下
				// 再擷取'POST000000' 或是 'COMM000000' 作為請求參數
				var post_id = thisID.substring(0, 10);
				var post = $(this).parents('div.justify-content-around');
				$.ajax({
					url: '<%=request.getContextPath()%>/post/post.do',
					type: 'POST',
					data: {
						post_id: post_id,
						action: 'remove'
					},
					success: function(){
						post.hide();
						Swal.fire({
							icon: 'info',
							title: '移除文章成功',
							showConfirmButton: false,
							timer: 1200
						});
					},
					error: function(){
						Swal.fire({
							icon: 'error',
							title: '移除文章失敗'
						})
					}
				});
			} else if (thisID.includes('COMM')){
				var comm_id = thisID.substring(0, 10);
				var comm = $(this).parents('div.collapse');
				var commRoot = $(this).parents('div.accordion');
				var commSibling = commRoot.find('div.collapse');
				var oooSibling = comm.siblings();
				
				$.ajax({
					url: '<%=request.getContextPath()%>/comm/comm.do',
					type: 'POST',
					data: {
						comm_id: comm_id,
						action: 'delete'
					},
					success: function(){
						
						if (commSibling.length <= 5){
							oooSibling.remove();
							comm.remove();
						} else {
							comm.remove();
						}
						
						Swal.fire({
							icon: 'info',
							title: '移除留言成功',
							showConfirmButton: false,
							timer: 1200
						});
					},
					error: function(){
						Swal.fire({
							icon: 'error',
							title: '移除文章失敗'
						})
					}
				});
				
			}
			
		} else if (source.includes('update')){
			
			var thisID = this.id;
			var splitID = thisID.substring(10, 14);
			if (splitID === 'COMM'){
				var post_id = thisID.substring(0, 10);
				var comm_id = thisID.substring(10, 20);
				var mem_id = thisID.substring(20, 27);
				$('#update' + comm_id).collapse('toggle');
			} else if (splitID !== 'COMM') {
				
				var thisClass = $(this).attr('class');
				var post_id = thisClass.substring(9);
				//modal-update${postVO.post_id}
				$('#modal-update' + post_id).modal('toggle');

				
				
			}
			
		} else if (source.includes('comm')){
			var thisID = this.id;
			var post_id = thisID.substring(0, 10);
			$('#reply' + post_id).collapse('toggle');
			
		} else if (source.includes('cross')){
			
			var thisID = this.id;
			
			if (thisID.includes('POST')){
				var post_id = thisID;
				$(this).prevAll('input').val('');
				$('#reply' + post_id).collapse('hide');
				
			} else if (thisID.includes('COMM')){
				var comm_id = thisID;
				$(this).prevAll('input').val('');
				$('#update' + comm_id).collapse('hide');
			}
			
		} else if (source.includes('checked')){
			var thisID = this.id;
			
			if (thisID.includes('POST')){
				var post_id = thisID.substring(0, 10);
				var mem_id = thisID.substring(10, 17);
				var c_text = $(this).prevAll('input').val();
				$.ajax({
					url: '<%=request.getContextPath()%>/comm/comm.do',
					type: 'POST',
					data: {
						post_id: post_id,
						mem_id: mem_id,
						c_text: c_text,
						c_status: 1,
						action: 'insert'
					},
					success: function(){
						Swal.fire({
							icon: 'success',
							title: '留言成功',
							showConfirmButton: false,
							timer: 1200
						})
						var timer = setTimeout(function(){
							
							document.location.href = '<%=request.getContextPath()%>/front-end/post/listAllPost.jsp';
							
						}, 500);
					}
				});
				
			} else if (thisID.includes('COMM')){
				
				var post_id = $(this).attr('class').substring(0, 10);
				var comm_id = thisID.substring(0, 10);
				var mem_id = thisID.substring(10, 17);
				var c_text = $(this).prevAll('input').val();
				console.log(c_text);
				$.ajax({
					url: '<%=request.getContextPath()%>/comm/comm.do',
					type: 'POST',
					data: {
						post_id: post_id,
						comm_id: comm_id,
						mem_id: mem_id,
						c_status: 1,
						c_text: c_text,
						action: 'update'
					}, 
					success: function(){
						Swal.fire({
							icon: 'success',
							title: '修改成功',
							showConfirmButton: false,
							timer: 1200
						})
						var timer = setTimeout(function(){
							location.reload();
						}, 500);
					}
				})
				
			}
				

			
			
			
		}

	});
	
	
	$('.insert-head').mouseup(function(){
		// 討論區頂端的文字欄, 點選後檢查是否有登入, 
		// 是, 則打開折疊的新增文章表單
		// 否, 則在 session 存入此頁面的網址, 再導向到登入頁面
		if (${sessionScope.memberVO ne null}) {
			
			$('.insert-body').collapse('show');
			if ($(this).attr('placeholder').includes('Hi')){
				$(this).attr('placeholder', '請輸入文章標題');
			}
			
			
		} else {
			<% 
				session.setAttribute("location", request.getRequestURI());
			%>
			document.location.href = '<%=request.getContextPath()%>/front-end/member/login.jsp';
		
		}
		
	})
	
	$('.canceledit').click(function(){
		// 討論區頂端的文字欄收折
		$('.insert-body').collapse('hide');
		if ($('.insert-head').attr('placeholder').includes('請輸入')){
			$('.insert-head').attr('placeholder', 'Hi ${sessionScope.memberVO.mem_name}, 在想什麼嗎？');
		}
	})
	
	$('.cancelupdate').click(function(){
		$('.modal-update').modal('hide');
	})
	
	$('.cleanedit').click(function(){
		// 討論區頂端的表單清空按鈕
		var formInsert = document.getElementById('form-insert');
		formInsert.reset();
		
		$('#p_image').attr('src', '<%=request.getContextPath()%>/images/post/toupload.png');
		CKEDITOR.instances.p_text.setData('');
	})
	
	$('.submitedit').click(function(){
		
		var timer = setTimeout(function(){
			var formInsert = document.getElementById('form-insert');
			formInsert.reset();
			CKEDITOR.instances.p_text.setData('');
		}, 1000);
		
	})
	
	
    function init() {
        var p_image = document.getElementById("p_image");
        var upload = document.getElementById("upload");

        upload.addEventListener("change", function(e){
            var files = upload.files;
            if (files && files[0]) {
                for (i = 0; i < files.length; i ++) {
                    if (files[i].type.indexOf("image") < 0) {
						Swal.fire({
							icon: 'error',
							title: '上傳的格式不符'
						})
                    } else {
                        var file = files[i];
                        var reader = new FileReader();

                        reader.onload = function(e) {
                            var result = e.target.result;

                            p_image.setAttribute("src", result);

                        }
                        reader.readAsDataURL(file);
                    }
                }
            }
        });
        
    }
    
    window.onload = init;	
	
	
	
</script>
	
		
		

    <!-- 內容 ---end  -->


        <!-- footer -->
        <footer id="footer" class="pt-5 ">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6 footer-list">
                        <h5 class="text-uppercase">快速連結</h5>
                        <ul>
                            <li>
                                <a class="footer-link" href="<%=request.getContextPath()%>/front-end/index.jsp">S.F.G首頁</a>
                            </li>
                            <li>
                                <a class="footer-link" href="<%=request.getContextPath()%>/front-end/member/addMember.jsp">註冊會員</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">商城</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">團購</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6 footer-list">
                        <h5 class="text-uppercase">會員互動</h5>
                        <ul>
                            <li>
                                <a class="footer-link" href="">競標區</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">直購區</a>
                            </li>
                            <li>
                                <a class="footer-link" href="<%=request.getContextPath()%>/front-end/post/listAllPost.jsp">討論區</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">聊天室</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6 footer-list">
                        <h5 class="text-uppercase">關於我們</h5>
                        <ul>
                            <li>
                                <a class="footer-link" href="">關於S.F.G</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">最新消息</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">隱私權政策</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6 footer-list">
                        <h5 class="text-uppercase">技術支援</h5>
                        <ul>
                            <li>
                                <a class="footer-link" href="">新手上路</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">幫助&支援</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">服務條款</a>
                            </li>
                        </ul>                    
                    </div>
                </div>
            </div>

            <div class="footer-end bg-dark mt-5 py-2">
                <p class="text-center">&copy; Copy right 2020</p>
            </div>
        </footer>

        <button id="chatBtn" class="bg-primary">
            <i class="fas fa-comments"></i>
        </button>

</body>



</html>