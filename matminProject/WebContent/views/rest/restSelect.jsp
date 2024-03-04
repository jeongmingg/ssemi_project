<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛슐랭</title>
<style>
	div{
            box-sizing: border-box;
            border: 1px solid red;
            margin: 0;
            padding: 0;
            display: block;
        }
	.wrap{
		width: 1800px;
		margin: auto;
		box-sizing: border-box;
	}

	#content>div{width: 100%;}
	#content_1{height: 400px;}
	#content_2{height: 1000px;}


</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/navigator.jsp" %>

	<div id="content">
		<div id="content_1">
			
		</div>
		<div id="content_2">

		</div>
	</div>




	
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>