<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
  
 <div class="jumbotron">
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
				<li class="active"><a href="/">Home</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">상품<span
						class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/proudctlist/soccer">Soccer</a></li>
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
			<c:choose>
				<c:when test="${login.id eq null}">
						<li><a href="/user/login"><span
								class="glyphicon glyphicon-user"></span> 로그인</a></li>
						<li><a href="/user/join"><span
								class="glyphicon glyphicon-user"></span> 회원가입</a></li>
				</c:when>
				<c:otherwise>
						<li><a><span
								class="glyphicon glyphicon-user"></span> ${login.id}님 환영합니다.</a></li>
						<li><a href="/user/logout"><span
								class="glyphicon glyphicon-user"></span> 로그아웃</a></li>							
				</c:otherwise>
			
			</c:choose>
				
				
			
				<%-- <c:choose>
					<c:when test="${login.id eq null}">
						<li><a href="/user/login"><span
								class="glyphicon glyphicon-user"></span> 로그인</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/user/logout"><span
								class="glyphicon glyphicon-user"></span> 로그아웃</a></li>
					</c:otherwise>
				</c:choose>  --%>

				
			</ul>
		</div>
	</div>
</nav>