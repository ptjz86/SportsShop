<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../header.jsp"></jsp:include>
<title>Insert title here</title>
<script src="/resources/js/upload.js" type="text/javascript"></script>
<style type="text/css">
#myCollapsible {
	margin-top: 30px;
}

.jump {
	margin-top: 50px;
}

/* #modDiv{
		width: 300px;
		height : 100px;
		background-color: gray;
		position: absolute;
		top: 50%;
		left: 50%;
		margin-left: -50px;
		margin-top: -50px;
		padding: 10px;
		z-index: 1000;
	
	} */
	
	.uploadedList li{
		list-style-type:none;		
		margin-bottom: 50px;
	}
	
	
	.popup{
		position: absolute;
	}
	
	.back{
		background-color: gray;
		opacity: 0.5;
		width: 100%;
		height: 300%;
		overflow: hidden;
		z-index: 1101;
	}
	
	.front{
		border:1px;
		margin: auto;
		opacity: 1;
		z-index: 1110;
	}
	
	.show{
		position: relative;
		max-width: 1200px;
		max-height: 800px;
		overflow: auto;
	}
	
</style>
</head>
<body>
	<form role="form" method="post">
		<input value="${vo.bno}" name="bno" type="hidden"> <input
			value="${cri.page}" name="page" type="hidden"> <input
			value="${cri.perPageNum}" name="perPageNum" type="hidden">
			<input value="${cri.orderType}" name="orderType" type="hidden">
	</form>
	<!-- hidden으로 보냄..  -->
	<div class="container">
		<div class="row">		
			<div style="display: none;" class="popup back"></div>
			<div style="display: none;" class="popup front">			
				<img id="popup_img">
			</div>
		
			<div class="form-group">
				<label for="title">제목</label> <input class="form-control"
					readonly="readonly" value="${vo.title }" name="title" id="title">
			</div>
			<div class="form-group">
				<label for="writer">작가</label> <input class="form-control"
					readonly="readonly" value="${vo.writer }" name="writer" id="writer">
			</div>
			
			
			


			<div class="form-group">
			
				${vo.content}
				<%-- <label for="content">내용</label>
				<textarea name="content" readonly="readonly" id="content" rows="3" class="form-control" id="content">${vo.content}</textarea> --%>
				<%-- <input readonly="readonly" name="content" id="content" rows="3"
					class="form-control" value="${vo.content}" id="content"> --%>

			</div>
			
			<div class="form-group">
				<label for="uploadedList">첨부파일</label>
				<ul id="uploadedList" class="clearfix uploadedList">
			
		
				</ul>			
			</div>

			<div class="form-group">
				<c:if test="${not empty login}">
				<button id="reply_form" class="btn btn-primary">댓글</button>
				</c:if>
			 	<c:if test="${vo.writer==login.id}">
				<button class="btn btn-warning" type="submit">수정</button>
				<button class="btn btn-danger" type="submit">삭제</button>
 				</c:if> 
				<button class="btn btn-info" type="submit">목록</button>
			</div>

		</div>

		<div id="myCollapsible" class="row collapse">
			<div class="form-group">
				<label for="replyer">작성자</label> <input id="replyer"
					value ="${login.id}" class="form-control" readonly="readonly">
			</div>

			<div class="form-group">
				<label for="replyText">내용</label> <input id="replyText"
					class="form-control">
			</div>			

			<div class="form-group">
				<button id="replyInsertBtn" class="btn btn-default">댓글등록</button>
				<button id="replyResetBtn" class="btn btn-default">초기화</button>
			</div>
		</div>
		
		
		


		<div class="row">
		<div id="replies" class="row jump">
		
		</div>	
		</div>
		
		
		<div class="row">
			<ul class="pagination pagination-lg">
			
			</ul>		
		</div>
				
		<!-- 모달 -->
		<div class="row">
			<div data-backdrop="static" id="myModal" class="modal fade">
				<div class="modal-dialog" >
					<div class="modal-content" style="background-color: #D4F4FA; opacity: 0.8;">
						<div class="modal-header">
							<button data-dismiss="modal" class="close">&times;</button>							
							<div>
							 	<strong style="float: left;">댓글 번호 : </strong>
								<p id="modal_rno"></p>
							
							</div>
						</div>
						<div class="modal-body">
							<input id="modal_replyText" class="form-control">
						</div>
						
						
						<div class="modal-footer">
					
							<button data-dismiss="modal" class="btn" id="modal_update">수정</button>
							<button data-dismiss="modal" class="btn" id="modal_delete">삭제</button>
					
							<button data-dismiss="modal" class="btn" id="modal_close">닫기</button>
						</div>
					</div>
					
				</div>	
			</div>		
		</div>	
		
		
	
		
		
		
		
	
		
		</div>
		
		
			
	</div>
	
	
	<script id="sourceAttach" type="text/x-handlebars-template">
		
{{imgsrc}}
		<li class="col-xs-3" data-src={{fullName}}>
			<span>
				<img src="{{imgsrc}}">
				</span>
					<div>
						<a class="largeShow" href="{{getLink}}">{{fileName}}</a>		
					</div>
		</li>		
	</script>
	
		<script id="source" type="text/x-handlebars-template">
					{{#each.}}		
	<div class="panel panel-info">
				<div class="panel-heading">
					<span><i class="fa fa-sticky-note" aria-hidden="true"></i> 글번호 : {{rnum}}, <i class="fa fa-user" aria-hidden="true"></i> : {{replyer}}</span>
					<span class="pull-right"><i class="fa fa-calendar-o" aria-hidden="true"></i> : {{regDate}}</span>					
				</div>
				<div class="panel-body replyLi">
					<p data-rno="{{rno}}" data-rnum="{{rnum}}">{{replyText}}</p>

					{{#eqReplyer replyer}}
						<button class="btn btn-default callModal">수정/삭제</button>
					{{/eqReplyer}}				
				</div>		
	</div>
	{{/each}}	
		</script>
	
	<script type="text/javascript">	
		
		$(document).ready(function(){		
			
			var bno=${vo.bno};
			var replyPage=1;
			
			
 		/*  	var id = '${login.id}';
			var writer = $("#writer").val(); */
			
			
			
			//alert(typeof(bno));
						
			getAllAttach(bno);
			
			
			 /* if(id!=writer){				
				$(".btn-warning").remove();
				$(".btn-danger").remove();				 
			}
			  */
			  
			  
			$(".uploadedList").on("click", ".largeShow", function(event) {
					var fileLink = $(this).attr("href");
					
					if(checkImageType(fileLink)){
						event.preventDefault();
						var imgTag=$("#popup_img");
						imgTag.attr("src", fileLink);
					
						$(".popup").show("slow");
						imgTag.addClass("show");
					}
					
					
					$("#popup_img").on("click", function () {
						$(".popup").hide("slow");
					})
			
			});
			
			//displayAttach(bno); 내가 만든거임..... 이거 안씀......
			
			$("#reply_form").on("click", function() {
				
				$("#myCollapsible").collapse("toggle");
				/* $("#myCollapsible").collapse("show");  보여주는거
				$("#myCollapsible").collapse("hide"); 감추는거 
				toggle은 열려있으면 닫고, 닫혀있으면 열리기.
				*/
				
			});
			
			$("#replyInsertBtn").click(function() {
				var replyer=$("#replyer").val();
				var replyText=$("#replyText").val();
				/* input 태그의 글자를 의미함 */
								
				/* header 넘겨준 데이터를 json으로 바꾸기 위해 */		
				$.ajax({
					type: "post",
					url: "/replies",
					headers: {
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"POST"
					},
					dataType: "text",
					data: JSON.stringify({
					/* stringify : 객체를 JSON 문자열로 바꿔주는 메소드 */
						bno:bno,
						replyer:replyer,
						replyText:replyText
					}),
					
					success: function(result) {					
						if(result=="INSERT_SUCCESS"){
							alert("댓글입력성공");
							getAllList(bno,replyPage); 
							
							$("#replyer").val("");
							$("#replyText").val("");
						}
					}
				});	
		
			}); 
			
			$("#modal_update").click(function() {
								
				//var rno=$("#modal_rno").text();
				var rno = $("#modal_rno").attr("data-rno");
				var replyText =$("#modal_replyText").val();			

				$.ajax({
					type : "PUT",
					url : "/replies/" + rno,
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "DELETE"
					},
					dataType : "text",
					data : JSON.stringify({

						replyText : replyText
					}),
					success : function(result) {
						if (result == 'UPDATE_SUCCESS') {
							//$("#modDiv").hide("fast");
							alert("수정되었습니다");
							getAllList(bno, replyPage);
						}
					}

				});

				
			});
			
			
			/* 클래스가 callModal $(this)  
			바로 앞에 있는 p태그	*/		
			$("#replies").on("click", ".callModal", function() {			
					 	
						var rno=$(this).prev("p").attr("data-rno");				
						var replyText =$(this).prev("p").text();						
						var rnum=$(this).prev("p").attr("data-rnum");				
						
						//$("#modal_rno").attr("data-rno", rno);
						
						$("#modal_rno").text(rnum);
						
						$("#modal_rno").attr("data-rno", rno);
							
						$("#modal_replyText").val(replyText);			
										
						$("#myModal").modal("show");
						
					
						
			});
			
			
			$("#modal_delete").click(function() {				

				//var rno=$("#modal_rno").text();	
				//alert(rno);
				
				
				
				
				var rno = $("#modal_rno").attr("data-rno");

				$.ajax({
					type : "delete",
					url : "/replies/" + rno,
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "DELETE"
					},
					dataType : "text",
					success : function(result) {
						if (result == 'DELETE_SUCCESS') {
						//	$("#modDiv").hide("slow");
							alert("삭제 되었습니다.");
							getAllList(bno, replyPage);
						}
					}

				});

				
			});
			
			
			$("#modal_close").click(function() {
				
				$("#myModal").modal("hide");
				
			});
			
			
		
			
			$("#replyResetBtn").click(function() {
				
				$("#replyer").val("");
				$("#replyText").val("");
				
			});		
			
			var $form = $("form[role='form']");
			
			$(".btn-warning").click(function() {
				$form.attr("action", "/board/update");
				$form.attr("method", "get");
				$form.submit();				
			});
			
			
			$(".btn-danger").click(function() {
				$form.attr("method", "post");
				/* $form.attr("action", "/board/delete?page=${cri.page}&perPageNum=${cri.perPageNum}"); */				
				$form.attr("action", "/board/delete"); 				
				$form.submit();			
				/* 삭제는 바로 */
			});
			
			$(".btn-info").click(function() {
			//	self.location="/board/listCriteria";
				$form.attr("method", "get");
				$form.attr("action", "/board/listCriteria");
				$form.submit();
			});
			
			
			$(".pagination").on("click", "li a", function(event) {
				event.preventDefault(); 
				replyPage=$(this).attr("href");
				getAllList(bno,replyPage);
				
			});
			
			
			getAllList(bno,replyPage);
		
			
		});
		
		
		function getAllList(bno, page) {
			$.getJSON("/replies/"+bno+"/"+page, function(data) {
				var source = $("#source").html();
				var template =Handlebars.compile(source);
				var gab=data.list;
				
				
				Handlebars.registerHelper("eqReplyer", function(replyer, option) {
					var str="";
					if(replyer=='${login.id}'){
						str+=option.fn();
						
					}
					return str;					
				});
				
				
				
				
				$("#replies").html(template(gab));
				
				printPaging(data.pageMaker);
				
				
			});
			
		};
		
		
		function printPaging(pageMaker) {
			var str="";
			if(pageMaker.cri.page>1){
				str+="<li><a href='"+(pageMaker.cri.page-1)+"'>&laquo;</a></li>";					
			}		
			
			for(var i=pageMaker.startPageNum; i<=pageMaker.endPageNum; i++){
				var strClass = pageMaker.cri.page == i ? 'class=active' : '';
				
				str+= "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
			}
			
			if(pageMaker.cri.page < pageMaker.totalPage){
				str+="<li><a href='"+(pageMaker.cri.page+1)+"'>&raquo;</a></li>";					
			}	
			
			$(".pagination").html(str);
			
			
		};
		
		
		
		function displayAttach(bno) {
			
			var source=$("#attach").html();
			var template= Handlebars.compile(source);
			
			/* bno값을 알고 있으니까 컨트롤러를 하나 더 만들어서, db에 있는 bno 값이랑 같은 selectList를 일단 가져와서 파일을 해야됨.. */
			
			
			$.getJSON("/listAttach/"+bno, function(data) {
				
				//alert(data.fullname);
				
				//alert(data[0].fullname);
				
				var str="";
				
				
				
				//1방법	each돌리는거
				$(data).each(function() {
				//	alert(this.fullname);
					
					var imgData = getFileInfo(this.fullname);
					var ht=template(imgData);
					$(".uploadedList").append(ht);
					
				})				
				
				//2방법  그냥 for문				
				/* for(var j=0; j<data.length; j++){					
					
					var imgData = getFileInfo(data[j].fullname);
					var ht=template(imgData);
					$(".uploadedList").append(ht);					
				}
				 */
				 
				 
				 
			
				/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
				 
				 
				 /* for(var j=0; j<data.length; j++){
					
					
					var imgData = getFileInfo(data[j].fullname);
					var ht=template(imgData);
					
				
					str += ht;
					
				}
				 
				 $(".uploadedList").append(str);		
				 
				 */
				
				/* for(i=0; i<data.size; i++){
					alert(data);
				} */
				
				
				
				/* var data = getFileInfo(result);
				var ht=template(data);
				
				$(".uploadedList").append(ht); */
								
				//$(".uploadedList").append(data);	
				//alert(data[1].fullname);
				
				
				/* var source = $("#source").html();
				var template =Handlebars.compile(source);
				var gab=data.list;
				
				$("#replies").html(template(gab));
				
				printPaging(data.pageMaker); */
				
				
			});
			
			
			/* $.ajax({
				type: "post",
				url: "/listAttach",			
				dataType: 'text',				
				success: function(result) {
					
				
					
					
					//$(".uploadedList").append(ht);						
				}					
			});
			 */
			
		}
		
		
		function getAllAttach(bno) {
			
			$.getJSON("/board/getAttach/"+bno, function(result) {
				
				var source = $("#sourceAttach").html();
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