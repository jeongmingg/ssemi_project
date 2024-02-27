<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script> -->
<title>Insert title here</title>
<style>
    .outer{
        border: 1px solid gray;
        color: orange;
        width: 700px;
        margin: auto;
        margin-top: 50px;
        margin-bottom: 50px;
    }
    #enroll-form table{margin:auto;}
    #enroll-form input{margin:10px;}
    button {
    background-color:lightgray; 
    border:1px;
    cursor: pointer;
}

</style>
</head>
<body>

    <%@ include file="../common/header.jsp" %>
	<%@ include file="../common/navigator.jsp" %>

    <div class="container">
        <!-- <p>Justified tabs:</p> -->
        <br><br>
        <ul class="nav nav-tabs nav-justified">
            <li class="nav-item" >
            <a class="nav-link active" style="color: orange; font-size: 30px;" >Statistics</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color: orange;font-size: 30px;">Restaurants</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color: orange;font-size: 30px;">Member</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color: orange;font-size: 30px;">Board</a>
            </li>
        </ul>
    </div>


    <div class="outer">

        <br>
        <!-- <h2 align="center">식당등록</h2> -->

        <form id="enroll-form" action="<%=contextPath %>/restEnroll.ad" method="post">

            <table>
                <tr>
                    <td> 식당이름</td>
                    <td>*필수<input type="text" name="restName" maxlength="20" placeholder="- 식당이름 등록"required></td>
    
                </tr>
                <tr>
                    <td> 카티고리</td>
                    <td>*필수<input type="text" name="category" maxlength="15" placeholder="- 식당 카테고리"required></td>
                    <td></td>
                </tr>
                <tr>
                    <td> 식당주소</td>
                    <td>*필수<input type="text" maxlength="30" placeholder="- 식당주소"required></td>
                    <td></td>
                </tr>
                <tr>
                    <td> 식당전화번호</td>
                    <td>*필수<input type="text" name="restName" maxlength="20" placeholder="- 포함해서 입력"required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;주차여부</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" name="phone" placeholder="- 'Y' 또는 'N' 입력"></td>
                    <td></td>
                </tr>

                <tr>
                    <th>첨부파일</th>
                    <td><input type="file" name="upfile"></td>
                </tr>
                
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;등급</td>
                    <td colspan="2">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="grade" id="first" value="1등급">
                        <label for="first">1등급</label>

                        <input type="checkbox" name="grade" id="second" value="2등급">
                        <label for="second">2등급</label>

                        <input type="checkbox" name="grade" id="third" value="3등급">
                        <label for="third">3등급</label>
                        <br>
                        
                    </td>
                </tr>
            </table>

            <br><br>

            <div align="center">
                <button type="submit" class="btn btn-success">등록하기</button>
				<button type="reset">초기화</button>
				<button type="button" onclick="history.back();">뒤로가기</button>
            </div>

            <br>

        </form>


    </div>
 <%@ include file="../common/footer.jsp" %>

</body>
</html>