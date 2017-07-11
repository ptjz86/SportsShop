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
	#myCollapsible{
		margin-top: 30px;
	
	}
	
	.jump {
		margin-top: 50px;
	}	
	
	.uploadedList li{
		list-style-type:none;		
		margin-bottom: 50px;
	}


</style>

</head>
<body>
	<form role="form" method="post">
		<input value="${vo.bno}" name="bno" type="hidden">
		<input value="${cri.page}" name="page" type="hidden"> 
		<input value="${cri.perPageNum}" name="perPageNum" type="hidden">
		<input value="${cri.searchType}" name="searchType" type="hidden">
		<input value="${cri.keyword}" name="keyword" type="hidden">
		 
	</form>
	<!-- hidden으로 보냄..  -->
	<div class="container">
		<div class="row">
			<div class="form-group">
				<label for="title">제목</label>
				<input class="form-control" readonly="readonly" value="${vo.title }" name="title" id="title">
			</div>
			<div class="form-group">
				<label for="writer" >작가</label>
				<input class="form-control" readonly="readonly" value="${vo.writer }" name="writer" id="writer">			
			</div>

			<div class="form-group">
				<label for="content">내용</label>
				<%-- <textarea name="content" id="content" rows="3" class="form-control" value="${vo.content}" id="content">${vo.content}</textarea> --%>
				<input readonly="readonly" name="content" id="content" rows="3" class="form-control" value="${vo.content}" id="content">
				
			</div>
			
			<div class="form-group">
				<label for="uploadedList">첨부파일</label>
				<ul id="uploadedList" class="clearfix uploadedList">
			
		
				</ul>			
			</div>
			
			
			
			<div class="form-group">
				<button id="reply_form" class="btn btn-primary"><i class="fa fa-reply" aria-hidden="true"></i>댓글</button>
				<button class="btn btn-warning" type="submit"><i class="fa fa-scissors" aria-hidden="true"></i>수정</button>
				<button class="btn btn-danger" type="submit"><i class="fa fa-trash" aria-hidden="true"></i>삭제</button>
				<button class="btn btn-info" type="submit"><span class="fa fa-list" aria-hidden="true"></span>목록</button>			
			</div>
		</div>
		
		<div class="row">
			<div id="myCollapsible" class="collapse">
				<div class="form-group">
					<span class="fa fa-user-o" aria-hidden="true"></span>
					<label for="replyer">작성자</label>
					<input id="replyer" class="form-control">
				</div>
				<div class="form-group">
					<span class="fa fa-comment" aria-hidden="true"></span>
					<label for="replyText">내용</label>
					<input id="replyText" class="form-control">
				</div>

				<div class="form-group">
					<label for="uploadedList">첨부파일</label>
					<ul id="uploadedList" class="clearfix uploadedList">


					</ul>
				</div>

				<div class="form-group">
					<button id="replyInserstBtn" class="btn btn-default">댓글 등록</button>
					<button id="replyResetBtn" class="btn btn-default">초기화</button>				
				</div>
			</div>		
		</div>	
		
		<div class="row jump">
			<div id="replies">
			
			</div>		
		</div>
		
		<div class="row">
			<ul class="pagination">
			
			</ul>		
		</div>
		
		
	<!-- 	<div class="row">
			<div data-backdrop="static" id="myMoDdal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
					<div class="modal-header">
						<button data-dismiss="modal" class="close">&times;</button>
						<p id="modal_rno">여기에 rno값을 넣을 겁니다.</p>					
					</div>
					<div class="modal-body">
						<input id="modal_replyText" class="form-control">					
					</div>
					<div class="modal-footer">
						<button data-dismiss="modal" id="modal_update" class="btn">수정</button>
						<button data-dismiss="modal" id="modal_delete" class="btn">삭제</button>
						<button data-dismiss="modal" id="modal_close" class="btn">닫기</button>					
					</div>
					</div>				
				</div>			
			</div>
		</div> -->
		
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
	
	
		<script id="sourceAttach" type="text/x-handlebars-template">
		
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
					<button class="btn btn-default callModal">수정/삭제</button>				
				</div>		
	</div>
	{{/each}}	
		</script>
		
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			var bno=${vo.bno};
			
			var replyPage=1;
			
			
			getAllAttach(bno);
			
			
			
			$("#modal_update").click(function() {
				
				
				/* var rno = $("#modarl_rno").text(); */
				var rno = $("#modal_rno").attr("data-rno");
				var replyText = $("#modal_replyText").val();
				
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
							$("#modDiv").hide("fast");
							alert("수정되었습니다");
							getAllList(bno, replyPage);
						}
					}

				});
				
				
			});
			
			
			
			$("#replies").on("click", ".callModal", function() {
							
		/* 	 	var rno=$(this).prev("p").attr("data-rno");
				var replyText =$(this).prev("p").text(); 
				
				
				$("#modal_rno").text(rno);
				$("#modal_replyText").val(replyText);
				
				$("#myModal").modal("show"); */
			 	
				var rno=$(this).prev("p").attr("data-rno");				
				var replyText =$(this).prev("p").text();
				
				var rnum=$(this).prev("p").attr("data-rnum");				
				
				$("#modal_rno").text(rnum);
				
				$("#modal_rno").attr("data-rno", rno);
				
				$("#modal_replyText").val(replyText);			
								
				$("#myModal").modal("show");
				
			
				
			});
			
			
			$("#modal_delete").click(function() {				

				//var rno=$("#modal_rno").text();
				var rno = $("#modal_rno").attr("data-rno");
				//alert(rno);

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
							$("#modDiv").hide("slow");
							alert("삭제 되었습니다.");
							getAllList(bno, replyPage);
						}
					}

				});

				
			});
			
			
			$("#modal_close").click(function() {
				
				$("#myModal").modal("hide");
				
			});
			
			
			
			
			
			
			/* 페이지 버튼 처리 */
			$(".pagination").on("click", "li a", function(event) {
				event.preventDefault(); 
				replyPage=$(this).attr("href");
				getAllList(bno,replyPage);
				
			});
			
			getAllList(bno, replyPage); 
			
			$("#reply_form").click(function() {
				
				$("#myCollapsible").collapse("toggle");
				
			});
			
			
			$("#replyResetBtn").click(function() {
				$("#replyer").val("");
				$("#replyText").val("");				
			});
			
			$("#replyInserstBtn").click(function() {
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
							
							getAllList(bno, replyPage); 
							$("#replyer").val("");
							$("#replyText").val("");
						}
					}
				});	
				
				
				
			});
			
			
			
			var $form = $("form[role='form']");
			
			$(".btn-warning").click(function() {
				$form.attr("action", "update");
				$form.attr("method", "get");
				$form.submit();				
			});
			
			
			$(".btn-danger").click(function() {
				$form.attr("method", "post");
				/* $form.attr("action", "/board/delete?page=${cri.page}&perPageNum=${cri.perPageNum}"); */				
				$form.attr("action", "delete"); 				
				$form.submit();			
				/* 삭제는 바로 */
			});
			
			$(".btn-info").click(function() {
			//	self.location="/board/listCriteria";
			
				
				$form.attr("method", "get");
				$form.attr("action", "listCriteria");
				$form.submit();
			});
			
			
			
			
			
		});
		
		
		
		function getAllList(bno, page) {
			
			$.getJSON("/replies/"+bno+"/"+page, function(data) {
				
				var source=$("#source").html();
				var template = Handlebars.compile(source);
				var gab=data.list;
				
				
				$("#replies").html(template(gab));
				
					
				printPaging(data.pageMaker);
				
				
			})
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