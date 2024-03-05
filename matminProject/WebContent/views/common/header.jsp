<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
	Member loginUser = (Member)session.getAttribute("loginUser");
	// 회원번호, 회원아이디, 비밀번호, 이름, 닉네임, 이메일, 이메일인증여부, 주소, 경고횟수, 가입일자, 회원레벨(관리자 or 회원), 회원상태
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
	@font-face {
	    font-family: 'LINESeedKR-Bd';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
	    font-weight: 700;
	    font-style: normal;
	}
	body *{
			font-family: 'LINESeedKR-Bd';
	}
    div{
            box-sizing: border-box;
            /* border: 1px solid red; */
            margin: 0;
            padding: 0;
            display: block;
        }
        .wrap{
            width: 1800px;
            margin: auto;
            box-sizing: border-box;
        }
        
        /* 전체 구조 비율 */
        .wrap>div{width: 100%;}
        #header{height: 170px;}
		
        /* header 비율 */
        #header>div{height: 100%; float: left;}
        #header_1{width: 20%; padding-left: 50px; cursor: pointer;}
        #header_2{width: 56%;}
        #header_3{width: 8%;}
        #header_4{width: 8%;}
        #header_5{
            width: 8%; 
			padding-top: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
			cursor: pointer;
		}
		
		/* header 스타일 - 로고, 검색창, 로그인, 회원가입, 최근본식당 */
			/* logo 스타일 */

			#logo{
				width: 80%;
				height: 140%;
			}

	        /* 검색창 스타일 */
	        /* 검색창 div id="header_2" class="sc-cmfmEs leAvxd"
	            그안에 div class="sc-UFtxY OqZgF Input__Wrap" */
	        /* input 클래스 : sc-hnmMDg bccLDB Search__Input */
	        /* button 클래스 : sc-jPQLIr gZgnOG search */
	        .leAvxd {  
					padding-left: 300px;
					padding-top: 80px;  
					min-width: 430px;
	                }
	
	        .OqZgF {
	                border: 2px solid #E4910D;
	                position: relative;
	                box-sizing: border-box;
	                display: grid;
	                grid-auto-flow: column;
	                grid-auto-columns: auto 18px 22px;
	                gap: 20px;
	                -webkit-box-align: center;
	                align-items: center;
	                width: 100%;
	                max-width: 506px;
	                min-width: 430px;
	                height: 42px;
	                padding-right: 20px;
	                border-radius: 21px;
	                background-color: rgb(245, 245, 245); 
	            }
	
	        .bccLDB {
	            display: block;
	            max-width: 72.5%;
	            width: 100%;
	            height: 30px;
	            margin-left: 24px;
	            padding: 0px 0px 2px;
	            background-color: transparent;
	            outline: transparent;
	            border: transparent;
	            font-size: 0.9375rem;
	            line-height: 1.3125rem;
	            letter-spacing: -0.0469rem;
	            color: rgb(32, 32, 32);
	            padding-top: 6px;
	        }
	
	        input {
	                text-rendering: auto;
	                color: fieldtext;
	                letter-spacing: normal;
	                word-spacing: normal;
	                line-height: normal;
	                text-transform: none;
	                text-indent: 0px;
	                text-shadow: none;
	                display: inline-block;
	                text-align: start;
	                appearance: auto;
	                -webkit-rtl-ordering: logical;
	                cursor: text;
	                background-color: field;
	                margin: 0em;
	                padding: 1px 0px;
	                border-width: 2px;
	                border-style: inset;
	                border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
	                border-image: initial;
	                padding-block: 1px;
	                padding-inline: 2px;
	            }
				
	        /* 검색버튼 */
	        .gZgnOG {
	                    width: 22px;
	                    height: 22px;
	                    background-image: url(https://dcicons.s3.ap-northeast-1.amazonaws.com/new/images/web/react_components/SearchQueryInput/search.png);
	                    background-size: 100%;
	                }
	                
	        * {
	            letter-spacing: -.0437rem;
	            outline: none;
	        }
	        
	        button {
	                background-color: transparent;
	                border: transparent;
	                cursor: pointer;
	            }
	         
	        /* 로그인, 회원가입 버튼 스타일 */
	
	        #header_3 a, #header_4 a{
	            text-decoration: none;
	            color: rgb(150, 150, 150);
	            font-size: 18px;
	            font-weight: 600;
	
	            width: 100%; height: 100%;
	            /* display: block; */
	            line-height: 210px;
	            text-align: center;
	
	        }
	
	        #header_3{padding-left: 80px;}
	        #header_4{padding-left: 40px;}

			#header_5{padding-bottom: 20px; padding-right: 30px;}

			#nnList-div{
				display: none;
			}
			
			/* #userNickname>p:hover #nnList>ul{
				list-style-type: none;
				padding: 0;
				display: block;
				font-size: 10px;
			} */
			
			/* p태그 */
			#nickname{cursor: pointer;}

			/* hover시 li 스타일 */
			.hoverNn{
				list-style: none;
				width: 120px;
				height: 30px;
			}

			.hoverNn>a{
				width: 100%; height: 100%;
				font-size: 15px;
				color: rgb(150, 150, 150);
				text-decoration: none;
			}

			#after-login{
				width: 280px; 
			}

			#userNickname{
				width: 100%;
				height: 50%;
				padding-left: 50px;
				padding-top: 50px;
			}

			#nnList-div{
				width: 100%;
				height: 50%;
			}


</style>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


</head>
<body>

	<% if(alertMsg != null) {%>
		<script>
			alert("<%= alertMsg %>");
		</script>
		<% session.removeAttribute("alertMsg"); %>
	<% } %>
	
    <div class="wrap">
		<form action="<%= contextPath %>/search.rs">
			<div id="header">
				<div id="header_1">
					<img id="logo" src="resources/logo/투명배경로고.png">
				</div>
					<div id="header_2" class="sc-cmfmEs leAvxd" >
					<div class="sc-UFtxY OqZgF Input__Wrap">
						<input id="searchInput" class="sc-hnmMDg bccLDB Search__Input" placeholder="지역, 음식 또는 식당명 입력" name="keyword">
						<button id="searchBtn" class="sc-jPQLIr gZgnOG search" type="submit" aria-label="검색하기 버튼"></button>
					</div>
				</div>
				
				<% if(loginUser == null) { %>
					<div id="header_3">
						<a href="<%= contextPath %>/loginForm.me">로그인</a>
					</div>
					<div id="header_4">
						<a href="<%= contextPath %>/chooseForm.me">회원가입</a>
					</div>
				<% } else { %>

					<div id="header_3">
						<a href="#"><%= loginUser.getNickname() %>님</a>
					</div>
					<div id="header_4">
						<a href="<%= contextPath %>/logout.me">로그아웃</a>
					</div>




					<!-- <div id="after-login">
						<div id="userNickname">
							<p id="nickname"><%= loginUser.getNickname() %>님</p>
						</div>
						<div id="nnList-div">
							<ul id="nnList-ul">
								<li class="hoverNn" id="mypage"><a href="#">마이페이지</a></li>
								<li class="hoverNn" id="updateInfo"><a href="#">회원정보수정</a></li>
								<li class="hoverNn" id="logout"><a href="#">로그아웃</a></li>
							</ul>
						</div>
					</div> -->
				<% } %>
				
				<div id="header_5">
					<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 48 48" data-svg-content="true" fill="#000000" style="margin-right: 30px;">
						<path d="M6 10H2v32c0 2.21 1.79 4 4 4h32v-4H6V10zm36-8H14c-2.21 0-4 1.79-4 4v28c0 2.21 1.79 4 4 4h28c2.21 0 4-1.79 4-4V6 c0-2.21-1.79-4-4 -4zm0 32H14V6h28v28z"></path>
					</svg>
				</div>
				<script>
				
					// 로고 누르면 메인가기
					
					$(function(){
						$("#logo").click(function(){
							location.href="/mm";
						});
					});
				
					// 로그인, 회원가입 스타일
					// $("#navi").children().children().mouseenter("color","#E4910D");
					$("#header_3 a, #header_4 a").mouseenter(function(){
						$(this).css("color","#E4910D");
					});
		
					$("#header_3 a, #header_4 a").mouseout(function(){
						$(this).css("color", "rgb(150, 150, 150)");
					});
					
					/*
					$("#nickname").hover(function(){
						$("#nickname").mouseenter(function(){
							$("#nnList-div").css("display", "block");
						}),

						$("#nickname").mouseout(function(){
							$("#nnList-div").css("display", "none");
						})
					});
					*/

					/*
					$(".hoverNn>a").hover(function(){
						$(".hoverNn>a").mouseenter(function(){
							$("#nnList-div").css("display", "block");
						}),

						$(".hoverNn>a").mouseout(function(){
							$("#nnList-div").css("display", "none");
						})
					})
					*/

					// $(".hoverNn>a").hover(function(){
					// 	$("#nnList-div").css("display", "block");
					// })

				</script>
			</div>
		</form>
    </div>
</body>
</html>