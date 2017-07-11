<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
   
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.proudctList li{
		list-style-type:none;		
		margin-bottom: 50px;
	}
	
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<jsp:include page="../header.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/admin_page_header.jsp"></jsp:include>
	
	<div class="container">
		<div class="row">
			<br>
			<h2>
				<span class="label label-info">��ǰ���</span>
			</h2>
			<hr>
			
			<ul id="proudctList" class="clearfix proudctList">
				<c:forEach items="${listAllProduct}" var="pList">
				<li class="col-xs-3">
				<span>
					<img alt="�����̹���" src="/displayFile?fileName=${pList.p_img_1}">
				</span>
					<div>
						<a href="#">��ǰ�з� : ${pList.p_category}</a>
					</div>
					<div>
						<a href="#">��ǰ��ȣ : ${pList.pno}</a>
					</div>
					<div>
						<a href="#">��ǰ�� : ${pList.p_title}</a>
					</div>
					<div>		
						<a href="#">��ǰ���� : ${pList.p_price}</a>						
					</div>
				</li>
				
				</c:forEach>
			</ul>
	</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/page_footer.jsp"></jsp:include>



</body>
</html>