<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>맛집의 민족</title>

	<!-- css -->
	<link rel="stylesheet" href="resources/css/member/memberChooseEnrollForm.css">

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

	<!-- jQuery library -->
	<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

	<!-- Popper JS -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

	<!-- js -->
	<script src="resources/js/member/memberChooseEnrollForm.js"></script>
	
	<!-- kakao login -->
	<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		Kakao.init('07b8e08ffb38a692cd2c2144e0dfa010'); // 사용하려는 앱의 JavaScript 키 입력
	</script>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/navigator.jsp" %>

	<div class="choose-enroll-form">
		<div id="topBtn">
			<a href="#">
				<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="45" height="45" viewBox="0 0 32 32" fill="rgb(230, 126, 34)" data-svg-content="true">
		        	<g>
		            	<path d="M 17,2C 8.716,2, 2,8.716, 2,17S 8.716,32, 17,32S 32,25.284, 32,17S 25.284,2, 17,2z M 23.708,15.708 c-0.39,0.39-1.024,0.39-1.414,0L 18,11.414L 18,27 C 18,27.552, 17.552,28, 17,28S 16,27.552, 16,27L 16,11.414 L 11.708,15.708 c-0.39,0.39-1.024,0.39-1.414,0c-0.39-0.39-0.39-1.024,0-1.414l 6-6C 16.296,8.29, 16.298,8.29, 16.3,8.288 c 0.090-0.088, 0.198-0.162, 0.316-0.21c 0.244-0.102, 0.52-0.102, 0.764,0C 17.504,8.128, 17.614,8.2, 17.708,8.292l 6,6 C 24.098,14.684, 24.098,15.316, 23.708,15.708z"></path>
		        	</g>
	    		</svg>
			</a>
		</div>
		
		<% if(loginUser == null) { %>
			<div id="common-enroll" align="center">
				<div>
					<p><b>일반 회원가입</b></p>
					<div id="agree-content">
						<p>
							개인정보보호법에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다. <br><br>
	
							1. 수집하는 개인정보<br>
							이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.<br><br>
	
							회원가입 시점에 네이버가 이용자로부터 수집하는 개인정보는 아래와 같습니다.<br>
							- 회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호를, 선택항목으로 이메일주소를 수집합니다. 실명 인증된 아이디로 가입 시, 암호화된 동일인 식별정보(CI), 중복가입 확인정보(DI), 내외국인 정보를 함께 수집합니다. 만 14세 미만 아동의 경우, 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다.<br>
							- 비밀번호 없이 회원 가입 시에는 필수항목으로 아이디, 이름, 생년월일, 휴대전화번호를, 선택항목으로 비밀번호를 수집합니다.<br>
							- 단체 회원가입 시 필수 항목으로 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를, 선택항목으로 단체 대표자명을 수집합니다.<br>
							서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.<br>
							- 회원정보 또는 개별 서비스에서 프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다. 회원정보에 별명을 입력하지 않은 경우에는 마스킹 처리된 아이디가 별명으로 자동 입력됩니다.<br>
							- 네이버 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.<br><br><br>
	
	
	
							서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.<br>
							구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나, 2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다.<br>
							서비스 이용 과정에서 위치정보가 수집될 수 있으며,<br>
							네이버에서 제공하는 위치기반 서비스에 대해서는 '네이버 위치기반서비스 이용약관'에서 자세하게 규정하고 있습니다.<br>
							이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.<br>
							생성정보 수집에 대한 추가 설명<br>
							- IP(Internet Protocol) 주소란?<br>
							IP 주소는 인터넷 망 사업자가 인터넷에 접속하는 이용자의 PC 등 기기에 부여하는 온라인 주소정보 입니다. IP 주소가 개인정보에 해당하는지 여부에 대해서는 각국마다 매우 다양한 견해가 있습니다.<br>
							- 서비스 이용기록이란?<br>
							네이버 접속 일시, 이용한 서비스 목록 및 서비스 이용 과정에서 발생하는 정상 또는 비정상 로그 일체,메일 수발신 과정에서 기록되는 이메일주소, 친구 초대하기 또는 선물하기 등에서 입력하는 휴대전화번호, 스마트스토어 판매자와 구매자간 상담내역(네이버톡톡 및 상품 Q&A 게시글) 등을 의미합니다.<br>
							- 기기정보란?<br>
							본 개인정보처리방침에 기재된 기기정보는 생산 및 판매 과정에서 기기에 부여된 정보뿐 아니라, 기기의 구동을 위해 사용되는 S/W를 통해 확인 가능한 정보를 모두 일컫습니다. OS(Windows, MAC OS 등) 설치 과정에서 이용자가 PC에 부여하는 컴퓨터의 이름, PC에 장착된 주변기기의 일련번호, 스마트폰의 통신에 필요한 고유한 식별값(IMEI, IMSI), AAID 혹은 IDFA, 설정언어 및 설정 표준시, USIM의 통신사 코드 등을 의미합니다. 단, 네이버는 IMEI와 같은 기기의 고유한 식별값을 수집할 필요가 있는 경우, 이를 수집하기 전에 네이버도 원래의 값을 알아볼 수 없는 방식으로 암호화 하여 식별성(Identifiability)을 제거한 후에 수집합니다.<br>
							- 쿠키(cookie)란?<br>
							쿠키는 이용자가 웹사이트를 접속할 때에 해당 웹사이트에서 이용자의 웹브라우저를 통해 이용자의 PC에 저장하는 매우 작은 크기의 텍스트 파일입니다. 이후 이용자가 다시 웹사이트를 방문할 경우 웹사이트 서버는 이용자 PC에 저장된 쿠키의 내용을 읽어 이용자가 설정한 서비스 이용 환경을 유지하여 편리한 인터넷 서비스 이용을 가능케 합니다. 또한 방문한 서비스 정보, 서비스 접속 시간 및 빈도, 서비스 이용 과정에서 생성된 또는 제공(입력)한 정보 등을 분석하여 이용자의 취향과 관심에 특화된 서비스(광고 포함)를 제공할 수 있습니다. 이용자는 쿠키에 대한 선택권을 가지고 있으며, 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다. 다만, 쿠키의 저장을 거부할 경우에는 로그인이 필요한 네이버 일부 서비스의 이용에 불편이 있을 수 있습니다.<br>
							쿠키에 관한 자세한 내용(네이버 프라이버시 센터) 알아보기<br><br>
	
							2. 수집한 개인정보의 이용<br>
							네이버 및 네이버 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.<br><br>
	
							- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.<br>
							- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.<br>
							- 법령 및 네이버 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.<br>
							- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.<br>
							- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.<br>
							- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.<br>
							- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.<br>
							3. 개인정보의 보관기간<br>
							회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.<br>
							단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.<br>
							이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다.<br>
							- 부정 가입 및 이용 방지<br>
							부정 이용자의 가입인증 휴대전화번호 또는 DI (만 14세 미만의 경우 법정대리인DI) : 탈퇴일로부터 6개월 보관<br>
							탈퇴한 이용자의 휴대전화번호(휴대전화 인증 시), DI(아이핀 인증 시): 탈퇴일로부터 6개월 보관(복호화가 불가능한 일방향 암호화(해시)하여 보관)<br>
							- 네이버 서비스 제공을 위한 본인 확인<br>
							통신사 정보 : 수집 시점으로부터 1년 보관<br>
							- QR코드 복구 요청 대응<br>
							QR코드 등록 정보:삭제 시점으로부터6개월 보관<br>
							- 스마트플레이스 분쟁 조정 및 고객문의 대응<br>
							휴대전화번호:등록/수정/삭제 요청 시로부터 최대1년<br>
							- 네이버 플러스 멤버십 서비스 혜택 중복 제공 방지<br>
							암호화처리(해시처리)한DI : 네이버 회원 탈퇴일로부터 6개월 보관<br>
							- 네이버 엑스퍼트 재가입 신청 및 부정 이용 방지<br>
							네이버 엑스퍼트 서비스 및 네이버 엑스퍼트 센터 가입 등록정보&판매자 이름 : 신청일로부터 6개월(등록 거절 시, 거절 의사 표시한 날로부터 30일) 보관<br>
							- 전자서명 인증 업무<br>
							개인정보: 네이버 인증서 서비스 해지 시까지 보관<br>
							- 인증서와 인증 업무에 관한 기록: 인증서 효력 상실일로부터 5년 보관<br>
							전자상거래 등에서의 소비자 보호에 관한 법률, 전자문서 및 전자거래 기본법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 네이버는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.<br>
							- 전자상거래 등에서 소비자 보호에 관한 법률<br>
							계약 또는 청약철회 등에 관한 기록: 5년 보관<br>
							대금결제 및 재화 등의 공급에 관한 기록: 5년 보관<br>
							소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관<br>
							- 전자문서 및 전자거래 기본법<br>
							공인전자주소를 통한 전자문서 유통에 관한 기록 : 10년 보관<br>
							- 통신비밀보호법<br>
							로그인 기록: 3개월<br><br>
	
							4. 개인정보 수집 및 이용 동의를 거부할 권리<br>
							이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.<br>
						</p>
					</div>
	
					<br>
	
					<input type="checkbox" id="agree" style="cursor: pointer;">
					<label for="agree" style="cursor: pointer;">위 모든 약관을 확인하고 전체 동의합니다.</label>
	
					<span id="click-agree" style="display: none;"></span>
	
					<a href="<%= contextPath %>/commonEnrollForm.me" id="common-enroll-btn" class="btn btn-primary" onclick="return checkAgree();"><b>맛집의 민족 회원가입</b></a>
				</div>
			</div>
	
			<hr id="hr">
	
			<div id="sns-enroll" align="center">
				<div>
					<p><b>간편 회원가입</b></p>
	
					<a href="#" id="naver-enroll-btn" class="btn btn-primary"><img src="resources/loginImg/naver_login_logo.png" align="left"><span>네이버 로그인</span></a>
					<br>
					<a href="javascript:kakaoLogin()" id="kakao-enroll-btn"><img src="resources/loginImg/kakao_login.png"></a>
				</div>
			</div>
		<% } else { %>
			<h3>이미 로그인 상태입니다.</h3>
		<% } %>
	</div>
	
	<script>
		function kakaoLogin() {
	        Kakao.Auth.login({
	            success: function (response) {
	                Kakao.API.request({
	                    url: '/v2/user/me',
	                    success: function (response) {
							$.ajax({
								url: 'idCheck.me',
								data: {checkId: response.id},
								success: function(result) {
									if(result == "NNNNN") {
										// 카카오로그인
										loginKakaoUser(response.id);
									} else {
										// 카카오 회원가입
										insertKakaoUser(response.id, response.kakao_account.email, response.kakao_account.name, response.properties.nickname);
									}
								},
								error: function() {
									console.log("카카오 로그인/회원가입용 ajax 통신 실패");
								}
							});

	                    },
	                    fail: function (error) {
	                        alert(JSON.stringify(error));
	                    },
	                })
	            },
	            fail: function (error) {
	                alert(JSON.stringify(error));
	            },
	        })
	    }

		function loginKakaoUser(id) {
			$.ajax({
				url: "kakaoLogin.me",
				type: "post",
				data: {userId: id},
				success: function() {
					location.href="<%= contextPath %>";
				},
				error: function() {
					console.log("kakao user login ajax 실패");
				}
			});
		}

		function insertKakaoUser(id, email, name, nickname) {
			$.ajax({
				url: "kakaoInsert.me",
				type: "post",
				data: {
					userId: id,
					email: email,
					userName: name,
					nickname: nickname
				},
				success: function() {
					alert(nickname + "님, 회원가입이 완료되었습니다.");
					location.href="<%= contextPath %>";
				},
				error: function() {
					console.log("kakao user insert ajax 호출 실패");
				}
			});
		}
	</script>

	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>