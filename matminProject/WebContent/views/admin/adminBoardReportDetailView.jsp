
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminDashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<title>Insert title here</title>
<style>
    .outer {
            border: 1px solid orange;
            color: gray;
            width: 1100px;
            margin: auto;
            margin-bottom: 50px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px; /* Adjusted margin */
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

    #navi{
        list-style-type: none;
        max-width: 1200px;
        margin: 0;
        height: 100%;
        }

        #navi > li > a {
        color: orange;
        font-size: 16px;
        position: relative;
        display: block;
        padding: 15px;
        }

        #navi > li > ul {
        list-style-type: none;
        padding: 0;
        display: none;
        position: absolute;
        text-align: center;
        z-index: 1;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        #navi > li > ul a {
        font-size: 15px;
        color: orange;
        display: block;
        padding: 10px;
        transition: all 0.3s;
        }

        #navi > li > ul a:hover {
        background-color: lightgray;
        color: orange;
        text-decoration: none;
        }

        #navi > li:hover > ul {
        display: block;
        opacity: 1;
        }
</style>
</head>
<body>

    <%@ include file="../common/header.jsp" %>
    <%@ include file="../common/navigator.jsp" %>

    <div class="container" width="82%">
        <!-- <p>Justified tabs:</p> -->
        <br><br>
        <ul id="navi" class="nav nav-tabs nav-justified">
            <li class="nav-item" >
            <a href="<%= contextPath %>/stat.ad" class=" nav-link"  style="color: orange; font-size: 30px;">Statistics</a>
            </li>
            <li class="nav-item">
            <a href="<%= contextPath %>/rest.list" class="nav-link" style="color: orange;font-size: 30px;">Restaurants</a>
                <ul>
                    <li><a href="<%= contextPath %>/restEnroll.ad">식당등록</a></li>
                    <!-- <li><a href="<%= contextPath %>/rest.list">식당전체조회</a></li> -->
                </ul>
            </li>
            <li class="nav-item">
            <a class="nav-link" href="<%= contextPath %>/memList.ad" style="color: orange;font-size: 30px;">Member</a>
                <ul>
                    <li align="center"><a href="<%= contextPath %>/memList.ad">회원전체조회</a></li>
                   
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="<%= contextPath%>/list.bo" style="color: orange;font-size: 30px;">Board</a>
                <ul>
                    <li align="center"><a href="<%= contextPath%>/list.bo">식당 등록/삭제 게시판</a></li>
                </ul>

            </li>
        </ul>
    </div>
    
    
    <div class="outer">
        
        <h2 align="center">요청상세</h2>
 
        <table id="detail-area"  border="1" align="center">
            <tr>
                <th width="70">글번호</th>
                <td width="70">01</td>
                <th width="70">글유형</th>
                <td width="350">신고</td>
            </tr>
            <tr>
                <th width="70">작성자</th>
                <td width="70">matmin01</td>
                <th width="70">제목</th>
                <td width="350">허위사실 확인부탁드립니다</td>
            </tr>
            <tr>
                <th>식당이름</th>
                <td>한우사랑</td>
                <th>작성일</th>
                <td>2024.02.02</td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                    <p style="height:100px;">안녕하세요! 한우사랑 식당 리뷰에 보시면 맞지 않은 정보가 기재되어있습니다. <br>
                        확인 부탁드립니다!감사합니다!</p>
                </td>
            </tr>
            <tr>
                <th>첨부파일</th>
                <td colspan="3">
                
                </td>    
            </tr>
        </table>
        
        <br>

        <div align="center">
            <button type="submit" class="btn btn-warning btn-sm">알림보내기</button>
            <button type="submit" class="btn btn-danger btn-sm" >삭제</button>
            <button type="button" class="btn btn-dark btn-sm" onclick="history.back();">뒤로가기</button>
        </div>

        <br>

    </div>




    

</body>
</html>