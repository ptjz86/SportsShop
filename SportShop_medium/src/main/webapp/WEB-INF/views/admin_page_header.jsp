<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    /* Remove the navbar's default rounded borders and increase the bottom margin */ 
    .navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }
    
    /* Remove the jumbotron's default bottom margin */ 
     .jumbotron {
      margin-bottom: 0;
    }
   
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
  </style>
  
 <div class="jumbotron" style="background-image: url('../resources/img/yoshi.jpg'); background-size: inherit;">
  <div class="container text-center">
    <h1>Exerciser</h1>      
    <p>Health, Enjoy&Enterprise</p>
  </div>
</div>

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li class="active"><a href="/admin">Home</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">상품<span
						class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/userProductList/listSearchCriteria">상품 리스트</a></li>
						<li><a href="#">Soccer</a></li>
						<li><a href="#">Baseball</a></li>
						<li><a href="#">BasketBall</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">커뮤니티<span
						class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/board/notice">공지사항</a></li>
						<li><a href="/board/eventBoard">이벤트</a></li>
						<li><a href="#">Article</a></li>
						<li><a href="/board/soccerBoard">SoccerBoard</a></li>
						<li><a href="/board/baseballBoard">BaseballBoard</a></li>
						<li><a href="/board/basketballBoard">BasketBallBoard</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">고객센터<span
						class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">1:1 문의</a></li>
						<li><a href="#">주문조회</a></li>
						<li><a href="#">나의 상품후기</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">상품관리<span
						class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/product/insertProduct">상품 등록</a></li>
						<li><a href="/product/listAllProduct">상품 조회/수정/삭제</a></li>					
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">게시물
						관리<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">1대1 문의 조회</a></li>
						<li><a href="#">q&a 조회</a></li>
						<li><a href="#">공지사항 게시판 관련</a></li>
					</ul></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">회원
						관리<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/usermanage/usercheck">회원 조회/삭제</a></li>
						<li><a href="/usermanage/manalysis">회원 남여 비율</a></li>
					</ul></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">홈페이지
						정보<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">방문자수 조회</a></li>
						<li><a href="#">오늘 가입한 사람 조회</a></li>
						<li><a href="#">회원 삭제</a></li>
					</ul></li>
					
					
					<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">광고관리
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/ads/create">광고 등록</a></li>
						<li><a href="/ads/list">광고 조회/수정/삭제</a></li>						
					</ul></li>
			</ul>
			<form class="navbar-form navbar-right" role="search">
				<div class="form-group input-group">
					<input type="text" class="form-control" placeholder="Search..">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</div>
			</form>


			<ul class="nav navbar-nav navbar-right">
			
			
				




				<%-- <c:choose>
					<c:when test="${login.id eq null}">
						<li><a href="/user/login"><span
								class="glyphicon glyphicon-user"></span> 로그인</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/user/logout"><span
								class="glyphicon glyphicon-user"></span> 로그아웃</a></li>
					</c:otherwise>
				</c:choose> --%>

				<%-- <c:choose>
					<c:when test="${login.id eq null}">
						<li><a href="/user/login"><span
								class="glyphicon glyphicon-user"></span> 로그인</a></li>
					</c:when>
					<c:otherwise>
						<li><span
							style="color: gray; list-style: none; display: inline; position: relative; top: 15px;"
							class="glyphicon glyphicon-user">관리자 ${login.id}님 환영합니다.</span></li>
						<li><a href="/user/logout"><span
								class="glyphicon glyphicon-user"></span> 로그아웃</a></li>
					</c:otherwise>
				</c:choose>
 --%>
 				<li><span
					style="color: gray; list-style: none; display: inline; position: relative; top: 15px;"
					class="glyphicon glyphicon-user">관리자 ${login.id}님 환영합니다.</span></li>
				<li><a href="/user/logout"><span
						class="glyphicon glyphicon-user"></span> 로그아웃</a></li>
				<li><a href="/cart/list?id=${login.id}"><span class="glyphicon glyphicon-shopping-cart"></span> 장바구니</a></li>
		
			</ul>
		</div>
	</div>
</nav>