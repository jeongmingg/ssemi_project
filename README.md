![맛집의민족 로고](https://github.com/jeongmingg/ssemi_project/assets/151509557/1a381701-47b2-429d-ac3d-22998fb6c680)

# 📌프로젝트 소개 

하루하루 바쁘게 살아가는 현대사회에서, 매일 무엇을 먹을지 어디서 먹을지 결정하는 고민에 직면한 현대인들을 위한 식당 추천사이트이다.

이 사이트는 사용자들이 가격, 위치, 맛, 주차 기능 여부와 같은 다양한 기준을 활용하여 식당 정보를 검색할 수 있고, 맛집뺑뺑이 추첨기능을 통해 음식 메뉴에 대한 고민을 최소화하고 보다 여유로운 점심시간을 만들기위해 개발되어 사용자들의 삶의 질을 향상시키고자 한다.
<br/><br/> 

# ⌚ 개발기간

◽ 2024.01.17 ~ 2024.01.23 주제, 프로젝트명, 팀장 선정 <br/>
◽ 2024.01.23 ~ 2024.01.30 기획의도, 유사사이트 분석, 클라이언트 요구사항분석, UseCase Diagram 작성 <br/>
◽ 2024.01.30 ~ 2024.02.13 사이트맵, 화면설계 회의, 메인페이지 화면설계 <br/>
◽ 2024.02.13 ~ 2024.02.19 DB 테이블 설계, 샘플데이터, ERD 작성 <br/>
◽ 2024.02.19 ~ 2024.02.23 화면 JSP 생성, 기능구현, JDBC 오라클연동 후 CRUD 최소 1개 <br/>
◽ 2024.02.23 ~ 2024.03.19 프로젝트 구현 및 디버깅 <br/>
◽ 2024.03.19 ~ 2024.03.24 베타 테스트, 최종 발표자료 준비 <br/>
<br/><br/> 
![image](https://github.com/jeongmingg/ssemi_project/assets/151510057/aa9d6705-414d-46b6-8929-eb02892b8070)


<br/>

# 🌱 구성원 및 역할

💗 조장 : 노정민
   - 메인페이지
   - 최근 본 식당 목록(쿠키 사용)
   - 키워드, 카테고리, 지역별, 기능별 선택을 통한 식당 검색페이지
   - 맛슐랭(리뷰별점 평균순, 리뷰개수를 통한 맛슐랭 순위 결정)
   - 맛집뺑뺑이(랜덤 식당추첨기)
   - 배너 직급별 식당 검색 페이지(대표메뉴 가격별 직급)
<br/>

💛 조원 : 김도현
   - 메인페이지 배너 슬라이드
   - 맛집 등록/삭제 게시판 
   - 닉네임 검색을 통한 작성글 조회
   - 식당 상세 페이지 조회
   - 식당 상세 페이지 소셜공유(카카오 API)
   - 리뷰 등록, 삭제 및 리뷰 추천
<br/>

💙 조원 : 남지혜
   - 일반회원가입(이메일 인증)
   - 소셜 로그인/회원가입 (카카오 API)
   - 아이디/비밀번호 찾기 (이메일인증)
   - 비밀번호 변경
   - 마이페이지
   - 지도 마크 구현 (카카오맵API)
   - 식당 찜꽁 기능
   - 서울시 식당 공공데이터 DB활용
<br/>

💜 조원 : 신나리
   - 관리자 페이지 전체 식당 목록 조회 
   - 관리자 페이지 전체 회원 정보 조회 
   - 관리자 보는 식당 및 회원 상세 페이지
   - 게시판 관리: 회원 요청시 식당 등록/삭제
   - 식당 상세 정보 수정
<br/><br/>

# ⚙ 개발환경
- OS : Windows10
- Developer Tools : Eclipse / VS Code / SqlDeveloper
- Server : Apach Tomcat 9.0
- DBMS : Oracle
- Management : Git, GitHub
- Front-end : HTML5 / CSS3 / JavaScript / jQuery / AJAX / JSON 
- BackEnd : Java 11, JSP & Servlet 

<br/>

# 💡 사용한 API
- Kakao Map
- Kakao sdk
- Cookie
- mail (?)
- 공공데이터 API

<br/><br/>

# ✔ 설계
ERD Cloud : 
![ERD Cloud](https://file.notion.so/f/f/87d71406-9469-4a04-834b-dc12ba2349e9/3793a43d-0a0b-4b21-9170-c5cbf9f5cd39/%EB%A7%9B%EC%A7%91%EC%9D%98_%EB%AF%BC%EC%A1%B1_ERD.png?id=90bb3dc5-b9c1-4504-8d54-471e55606221&table=block&spaceId=87d71406-9469-4a04-834b-dc12ba2349e9&expirationTimestamp=1711756800000&signature=cMKH8_wlhnK02YkQHbmfzuk56gu7TxTfTJHXVmYZ5hk)

<br/><br/>

# 📽 프로젝트 구현

### 💗 조장 : 노정민

   ◽ 메인페이지 <br />
     ![메인페이지](https://github.com/jeongmingg/ssemi_project/assets/151510057/e564f798-ef9c-4286-96d3-31d6e5b8242d) <br />
   ◽ 검색창 통합검색결과 페이지 <br />
      ▪ 로그인, 비로그인시 검색창 결과페이지 <br />
      ![검색창 결과페이지(로그인,비로그인)](https://github.com/jeongmingg/ssemi_project/assets/151510057/cede3072-90fc-481a-9897-d1650dab7a33) <br />
      ▪ 카테고리, 편의기능, 지역 선택 검색창 결과페이지 <br />
      ![검색창 카테고리, 편의기능, 지역 선택 결과](https://github.com/jeongmingg/ssemi_project/assets/151510057/6143746e-46a1-44e3-80fb-c5cc64165c79) <br />

   ◽ 배너 메뉴 가격별 오늘의 직급 결과페이지 <br />
       ▪ 오늘의 직급 결과페이지 <br />
      ![배너 오늘의 직급검색결과 페이지](https://github.com/jeongmingg/ssemi_project/assets/151510057/01e1a630-75d4-4191-a0f2-f33740b8f069) <br />
       ▪ 오늘의 직급 지역선택 결과 <br />
      ![배너 오늘의 직급 지역검색](https://github.com/jeongmingg/ssemi_project/assets/151510057/fe5a1604-5774-4f1a-b4af-e0a5bc982556)  <br />
      <br /> 
   ◽ 최근 본 식당, 맛슐랭 <br />
      ![맛슐랭, 최근 본 식당](https://github.com/jeongmingg/ssemi_project/assets/151510057/08200423-57b1-4f6d-b051-d452fb509756) <br />

   ◽ 맛집뺑뺑이 <br />
       ![맛집뺑뺑이](https://github.com/jeongmingg/ssemi_project/assets/151510057/4f47b4be-fe57-4117-9227-20c5b333fbfb) <br />



<br/>

### 💛 조원 : 김도현

- 슬라이드 이미지 구현 <br/>
![슬라이드구현](https://github.com/jeongmingg/ssemi_project/assets/151509557/9ba1977c-c882-4f3b-a7be-0925245dd9bf)
- 식당상세페이지 <br/>
![식당상세페이지](https://github.com/jeongmingg/ssemi_project/assets/151509557/5e4f88bf-ed20-43f3-95fa-3f95f54863ff)
- 식당상세페이지 중 메뉴정보<br/>
![식당메뉴정보](https://github.com/jeongmingg/ssemi_project/assets/151509557/262c05fb-a78d-4149-8ee1-287e239890f5)
- 리뷰작성<br/>
![리뷰작성](https://github.com/jeongmingg/ssemi_project/assets/151509557/58cc6571-d17f-4d64-af7b-9da8cc32c3d3)
- 리뷰삭제<br/>
![리뷰삭제](https://github.com/jeongmingg/ssemi_project/assets/151509557/2e960c56-6e03-4a82-82a6-0bd289aa25e1)



  

<br/>

### 💙 조원 : 남지혜

  여기에 작성
 

### 💜 조원 : 신나리

- 관리자 메인페이지, 식당 목록조회 <br/>
![관리자메인페이지, 식당 목록조회](https://github.com/jeongmingg/ssemi_project/assets/133949316/a19f4d14-c92d-443b-b023-847c19af6983)
- 새로운 삭당 등록 <br/>
 ![시당 등록](https://github.com/jeongmingg/ssemi_project/assets/133949316/e49c303f-eefd-4970-bf50-c38b0fbae937)
- 관리자 보는 식당 상세 페이지<br>
![관리자 보는 식당 상세페이지](https://github.com/jeongmingg/ssemi_project/assets/133949316/6d52cd52-27c7-47a8-9275-499e8524b4c0)


  
     
<br/><br/>

# 📚 최종보고서

[최종보고서 링크](https://drive.google.com/file/d/1p-7MY-ICvuHByL8M-Rqj7zGDIYHQqrwK/view?usp=sharing)

     
