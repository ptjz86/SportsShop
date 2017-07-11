<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/resources/js/upload.js" type="text/javascript"></script>
<jsp:include page="../header.jsp"></jsp:include>
<title>Insert title here</title>
<style type="text/css">

	.fileDrop{
		width: 80%;
		height: 100px; 
		border: 1px dotted gray;
		background-color: lightslategray;
		margin: auto;
	
	}
	
	.attach{
		margin-top: 50px;
	}
	
.uploadedList li{
	
		list-style-type:none;		
		margin-bottom: 50px;
	}
</style>
</head>
<body>
	<!-- hidden으로 보냄..  -->
	<div class="container">
		<div class="row">
			<form id="myForm" class="form-horizontal" method="post">
					<input value="${cri.page}" name="page" type="hidden"> 
					<input value="${cri.perPageNum}" name="perPageNum" type="hidden">
					<input value="${cri.orderType}" name="orderType" type="hidden">
				
				<div class="form-group">
					<label class="col-xs-2 control-label" for="bno">글번호</label>
					<div class="col-xs-10">
						<input readonly="readonly" class="form-control" value="${vo.bno }"
							name="bno" id="bno">
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-2 control-label" for="writer">작가</label>
					<div class="col-xs-10">
						<input readonly="readonly" class="form-control" value="${vo.writer }" name="writer"
							id="writer">
					</div>
				</div>

				<div class="form-group">
					<label class="col-xs-2 control-label" for="title">타이틀</label>
					<div class="col-xs-10">
						<input class="form-control" value="${vo.title }" name="title"
							id="title">
					</div>
				</div>

				<div class="form-group">
					<label class="col-xs-2 control-label" for="content">내용</label>
					<div class="col-xs-10">
						<input name="content" id="content" rows="3" class="form-control"
							value="${vo.content}">
					</div>
					
				</div>
				
		
				
				<div class="row">
				<label for="fileDrop" class="col-xs-2 control-label" >업로드할 파일을 드랍시키세요.</label>
				<div class="fileDrop col-xs-10"></div>
				</div>			
					
			
				<div class="form-group attach">
				<label for="uploadedList" class="col-xs-2 control-label" >첨부파일</label>
					<ul class="uploadedList col-xs-10">
					</ul>
				</div>
			</form>
			
		
			
			
			<div class="form-group">
						<div class="col-xs-offset-2 col-xs-10">
							<button class="btn btn-primary">수정</button>
							<button class="btn btn-warning">목록</button>
						</div>
			</div>
		</div>
	</div>
	
		
			
			
			
			
	
		<script id="source" type="text/x-handlebars-template">
			
				<li class="col-xs-3">
					<span>
						<img src="{{imgsrc}}">
					</span>
					<div>
						<a href="{{getLink}}">{{fileName}}</a>				
						<a href="{{fullName}}" class="btn btn-default btn-xs delbtn"><span class="glyphicon glyphicon-remove-circle"/></a>					
					</div>
				</li>			
			</script>
	
	
	
	<script type="text/javascript">		
		$(document).ready(function(){
			
			
			var bno=${vo.bno};			
			
			var source = $("#source").html();
			var template = Handlebars.compile(source);
			
			var delInfo="";
			
		
		
			getAllAttach(bno);
			
			
		/* 	var wrtierVal = $("#writer").val();
			var titleVal = $("#title").val();
			var contentVal = $("#content").val(); */
			
			$(".fileDrop").on("dragenter dragover", function(event) {
				event.preventDefault();
				
			});
			
			$(".fileDrop").on("drop", function(event) {
				event.preventDefault();
				var files =event.originalEvent.dataTransfer.files;
				var file = null;
				
				for(var j=0; j<files.length; j++){
					var formData = new FormData();
					var file = files[j];					
					
					formData.append("file", file);					
					
					$.ajax({
						type: "post",
						url: "/uploadAjax",
						data: formData,
						dataType: 'text',
						processData: false,
						contentType: false,
						success: function(result) {
							var data = getFileInfo(result);
							var ht=template(data);
							
							
							$(".uploadedList").append(ht);						
						}					
					});
				
				
				}				
				
			});
			
			

		 $(".uploadedList").on("click", "li div .delbtn", function(event) {
				event.preventDefault();
				
				var delBtn = $(this);	
				var delLi = $(this).parent("div").parent("li");
				
				delLi.remove();				
				delInfo += delBtn.attr("href")+"#";
				
				/* var delOk = confirm("\n삭제하겠습니까?");
				
				
				if(delOk){
				
					
					
				 	 $.ajax({
						type: "post",
						url: "/board/deleteFile",
						data: {
							fileName: delBtn.attr("href"),
							bno : bno
						},
						dataType: "text",
						success: function(result) {						
							if(result=="DELETE_SUCCESS"){
								delLi.remove();
								alert("삭제가 되었습니다.");							
							}
							
						}
						
					}); 				
				} */
				
				
				
			});  
			
			
			
				
			
			$(".btn-primary").on("click", function(event) {
				 event.preventDefault();
				/* var writerVal2 = $("#writer").val();
				var titleVal2 = $("#title").val();
				var contentVal2 = $("#content").val();
				
				if(wrtierVal != writerVal2){
					alert("작가가 수정되었습니다.");
				}else if(titleVal != titleVal2){
					alert("타이틀이 수정되었습니다.");
				}else if(contentVal != contentVal2){
					alert("내용이 수정되었습니다.");
				}
 */			

				var title = $("#title").val();
				var content = $("#content").val();
				
				if(title == ""){
					alert("타이틀을 입력하세요");
					return false;
				}else if(content == ""){
					alert("내용을 입력하세요");
					return false;
				}else{
					/*  $("form").attr("action", "update");
					$("form").attr("method", "post");
					
					$("form").submit();		 */	
					
					
					
					//var subBtn=$(this);
					
				//	var form=$("#myForm");				
				
				
					var str="";
					
					$(".delbtn").each(function(index) {
						str += "<input value='"+$(this).attr("href")+"' name='files["+index+"]' type='hidden'>";						
					});
					
					
					/* 작은 따옴표로 묵어야함. "" 있어성  한번 더 추가............ parameter 형식으로 넘어감........*/
					str +='<input value="'+delInfo+'" type="hidden" name="delInfo">';
					
				
					$("form").append(str);
					$("form").attr("action", "update");
					$("form").attr("method", "post"); 
				
					
					$("form").get(0).submit();			
				}
			});
			
			
			$(".btn-warning").on("click", function() {			
				/* $form.attr("action", "/board/delete"); */
				location.href="/board/listCriteria?page=${cri.page}&perPageNum=${cri.perPageNum}&orderType=${cri.orderType}";
				//self.location="/board/listAll";				
				/* 삭제는 바로 */
			});
			
			
		
			
			
			
			
		});
		
		
		function getAllAttach(bno) {
			
			$.getJSON("/board/getAttach/"+bno, function(result) {
				
				var source = $("#source").html();
				var template = Handlebars.compile(source);
				
				
				$(result).each(function() {					
					var fileInfo = getFileInfo(this);
					var ht =template(fileInfo);
					
					$(".uploadedList").append(ht);					
				});				
			});
			
		};
	
	
	
	
	
	</script>

</body>
</html>