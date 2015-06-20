<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="type" content="album">
	<meta name="id" content="${album_id }">
	<title>album index</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bootstrap2.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/navbar.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/card.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/image.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/header.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/divider.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/comment.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/feed.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/form.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/button.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/message.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/icon.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/statistic.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/page.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style.css">
	<style>
  	body {
    	font-family: "Microsoft YaHei","微软雅黑",tahoma,arial,"宋体";
  	}	
	.ui.tiny.images img{
		width: 88px;
		height: 88px;
	}
	#replybtn{
		margin-bottom: 20px;
	}
	.ui.avatar.image{
		margin-right: .25em;
		display: inline-block;
		width: 2.5em;
		height: 2.5em;
		border-radius: 500rem;		
	}	
	#imgcontainer {
		margin-bottom: 30px;
	}
	#imgcontainer img {
		width: 100%;
	}
	.card div{
		text-align: center;
	}
	#more{
		width: 97%;
	}
	#rightside {
		padding-left:20px;
	}
	</style>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/basic.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/album.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/comment.js"></script>

</head>
<body>
	<%@ include file="../topbar.jsp" %>
	<div class="container">
		<div class="row">
			<div class="span8">
				<div id="imgcontainer">
					<img src='<c:url value="/img/1.jpg"/>' alt="" id="mainimg" class="ui centered image"> 
				</div>
			
				<div class="ui comments" id="comments">

				  <div id="replyarea">
						  <form class="ui reply form" id="replyform">
						    <div class="field">
						      <textarea id="replycontent"></textarea>
						    </div>
							<div class="ui primary button" id="replybtn">
							  评论
							</div>							    
						  </form>								
				  </div>
				  
				  <div id="commentList">							
					  <jsp:include page="/comment/album/${album_id }"></jsp:include>				  	
				  </div>
				  <!-- comment list -->
				</div>
				<!-- end comment -->
			</div>
			<div class="span4">
				<div id="rightside">
					<%@ include file="../usercard.jsp" %>  					
					<div class="ui tiny images" id="imgbox">
						<c:forEach items="${photos}" var="photo">
							<a href="#"><img src="<c:url value="${imgBaseUrl}${photo.key }" />" alt="" id="preview_photo_${photo.id }"></a>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>