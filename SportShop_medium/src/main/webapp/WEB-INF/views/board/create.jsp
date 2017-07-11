<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../header.jsp"></jsp:include>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script src="/resources/js/upload.js" type="text/javascript"></script>
<title>Insert title here</title>
<style type="text/css">
	.fileDrop{
		width: 80%;
		height: 100px; 
		border: 1px dotted gray;
		background-color: lightslategray;
		margin: auto;
	}
		
	.uploadedList li{
		list-style-type:none;		
	}
</style>
</head>
<body>

	<!-- 작가 : <input
					name="writer"><br> 내용 :
				<textarea rows="3" name="content"></textarea>
				<input type="submit" value="등록"> -->
				
		<!-- 		<form method="post">
					제목 : <input type="text" name="title"><br>
					작가 : <input type="text" name="writer"><br>
					내용 : <input type="text" name="content"><br>
					<input type="submit">
					
				</form> -->
				

	<div class="container">
		<div class="row">			
			<form method="post" id="myForm">
				<%-- <input value="${vo.bno}" name="bno" type="hidden"> --%>
					<input value="${cri.page}" name="page" type="hidden"> 
					<input value="${cri.perPageNum}" name="perPageNum" type="hidden">				
				
				<div class="form-group">
					<label for="title">제목</label> <input name="title"
						class="form-control" id="title" placeholder="제목을 입력하세요">
				</div>
				
				<div class="form-group">
					<label for="writer">작가</label> <input name="writer"
						class="form-control" id="writer" value="${login.id}" readonly="readonly" placeholder="작가를 입력하세요">
				</div>
				<div class="form-group">				
					<label for="content">내용</label>
					<textarea name="content" id="content" rows="3" class="form-control"></textarea>
				</div>				
			</form>
			
			<div class="form-group">
				<label for="">업로드할 파일을 드랍시키세요.</label>
				<div class="fileDrop"></div>			
			</div>
			
			
			
			<ul class="clearfix uploadedList">
				
			
			
						
			</ul>
			
			
			
			<script id="source" type="text/x-handlebars-template">
			
				<li class="col-xs-3">
					<span>
						<img src="{{imgsrc}}">
					</span>
					<div>
						<a href="{{getLink}}">{{fileName}}</a>				
						<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><span class="glyphicon glyphicon-remove-circle"/></a>					
					</div>
				</li>			
			</script>
			
			
			
			
			<div class="form-group">
				<button class="btn btn-info" type="submit">등록</button>
				<button class="btn btn-info" type="reset">초기화</button>
				<button class="btn btn-warning">목록으로</button>
			</div>
		</div>
	</div> 
	
	<script type="text/javascript">
		$(document).ready(function() {
			
			var source=$("#source").html();
			var template= Handlebars.compile(source);
			
			
			CKEDITOR.replace( 'content', {//해당 이름으로 된 textarea에 에디터를 적용
	            width:'100%',
	            height:'400px',
	            filebrowserImageUploadUrl: '/community/imageUpload' //여기 경로로 파일을 전달하여 업로드 시킨다. 
	        });
			
			 CKEDITOR.on('dialogDefinition', function( ev ){
		            var dialogName = ev.data.name;
		            var dialogDefinition = ev.data.definition;
		          
		            switch (dialogName) {
		                case 'image': //Image Properties dialog
		                    //dialogDefinition.removeContents('info');
		                    dialogDefinition.removeContents('Link');
		                    dialogDefinition.removeContents('advanced');
		                    break;
		            }
		        });
			
			/* $.ajax({ 
				type:"POST", 
				url: "/editor_template.jsp", 
				success: function(data){ 
					$("#editorTd").html(data);
					setConfig(); },
					error : 
						function(request, status, error) {
						alert("에러");
					} 
			});	
			 */
			

			
			
		

			
			
			
			$(".uploadedList").on("click", "li div .delbtn", function(event) {
				event.preventDefault();
				var delBtn = $(this);	
				var delLi = $(this).parent("div").parent("li");
				
				$.ajax({
					type: "post",
					url: "/deleteFile",
					data: {
						fileName: delBtn.attr("href")
					},
					dataType: "text",
					success: function(result) {						
						if(result=="DELETE_SUCCESS"){
							delLi.remove();
							alert("삭제가 되었습니다.");
						}
						
					}
					
				});
				
			});
			
			
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
			
			
			
			$("button[type='submit']").click(function(event) {
				
			
				
				//subBtn.get(0).submit();		/* 이게 중요함 반드시 0으로 한다음에 submit */
				
				
				 var title = $("#title").val();
				var writer = $("#writer").val();
				var content = $("#content").val();
				
				if(title == ""){
					alert("타이틀을 입력하세요");
					return false;
				}else if(writer == ""){
					alert("작가를 입력하세요");
					return false;
				}/* else if(content == ""){
					alert("내용을  입력하세요");
					return false;					
				} */else{
					//$("form").submit();	
					
					event.preventDefault();
					//var subBtn=$(this);
					var form=$("#myForm");
					var str="";
										
					
					
					$(".delbtn").each(function(index) {
						str += "<input value='"+$(this).attr("href")+"' name='files["+index+"]' type='hidden'>";
						
					})			
			
					
					form.append(str);
					
					form.get(0).submit();
				} 
				
				
			});			
			$("button[type='reset']").click(function() {
				/* location.href="/board/listCriteria"; */
				$("form").each(function() {
					this.reset();
					
				});
				
				
				
			});
			
			$(".btn-warning").click(function() {
				 location.href="/board/listCriteria?page=${cri.page}&perPageNum=${cri.perPageNum}"; 
			})
			
		});
		
		
	</script>
</body>
</html>