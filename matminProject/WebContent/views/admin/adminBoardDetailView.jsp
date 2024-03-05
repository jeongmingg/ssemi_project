
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
            <a href="<%= contextPath %>/rest.list?cpage=1" class="nav-link" style="color: orange;font-size: 30px;">Restaurants</a>
                <ul>
                    <li><a href="<%= contextPath %>/restEnroll.ad">식당등록</a></li>
                    <li><a href="<%= contextPath %>/rest.list?cpage=1">식당전체조회</a></li>
                </ul>
            </li>
            <li class="nav-item">
            <a class="nav-link" href="<%= contextPath %>/memList.ad" style="color: orange;font-size: 30px;">Member</a>
                <ul>
                    <li align="center"><a href="<%= contextPath %>/memList.ad">회원전체조회</a></li>
                   
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="<%= contextPath%>/board.list" style="color: orange;font-size: 30px;">Board</a>
                <ul>
                    <li align="center"><a href="<%= contextPath%>/board.list">식당 등록/삭제 게시판</a></li>
                    <li><a href="<%= contextPath %>/report.bo">신고게시판</a></li>
                </ul>

            </li>
        </ul>
    </div>

    <div class="outer">
       
        <h2 align="center">ìì¸ë³´ê¸°</h2>
    
        <table id="detail-area" align="center">
            <tr>
                <th width="70">ê¸ë²í¸</th>
                <td width="70">01</td>
                <th width="70">ê¸ì í</th>
                <td width="350">ì ê³ </td>
            </tr>
            <tr>
                <th width="70">ìì±ì</th>
                <td width="70">matmin01</td>
                <th width="70">ì ëª©</th>
                <td width="350">íìì¬ì¤ íì¸ë¶íëë¦½ëë¤</td>
            </tr>
            <tr>
                <th>ìë¹ì´ë¦</th>
                <td>íì°ì¬ë</td>
                <th>ìì±ì¼</th>
                <td>2024.02.02</td>
            </tr>
            <tr>
                <th>ë´ì©</th>
                <td colspan="3">
                    <p style="height:100px;">ìëíì¸ì! íì°ì¬ë ìë¹ ëë¬´ ì¢ê³  ìì£¼ ê°ëê¹ ë§ë¯¼ì ë±ë¡ë¶íëë¦½ëë¤! ê°ì¬í©ëë¤!</p>
                </td>
            </tr>
           
            <tr>
                <th>ì²¨ë¶ì¬ì§</th>
                <td colspan="3">
                    <div>
                        <img src="" width="200" height="150" alt=""> 
                        <img src="" width="200" height="150" alt=""> 
                        <img src="" width="200" height="150" alt=""> 
                    </div>
                </td>
                
            </tr>

        </table>
        
        <br>
        
        <div align="center">
            <button type="submit" class="btn btn-warning btn-sm">ìë¦¼ë³´ë´ê¸°</button>
            <button type="submit" class="btn btn-danger btn-sm" >ì­ì </button>
            <button type="button" class="btn btn-dark btn-sm" onclick="history.back();">ë¤ë¡ê°ê¸°</button>
        </div>
    </div>

</body>
</html>