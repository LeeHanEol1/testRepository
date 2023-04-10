<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.board.model.vo.*"%>
    <%
    	Board board = (Board)request.getAttribute("board");
    	Attachment attachment = (Attachment)request.getAttribute("attachment");
    	//request.getSession().setAttribute("attachment", attachment);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .outer{
            background-color: black;
            color: white;
            width: 1000px;
            height: 500px;
            margin: auto;
            margin-top: 50px;
        }
    </style>
</head>
<body>
	<%@include file="../common/menubar.jsp" %>
    <div class="outer">
    <br><br>
        <h2 align="center">일반게시판 상세보기</h2>
        <br>
        <table class="list-area" align="center" border="1">
            <thead>
                <tr>
                    <th>카테고리</th>
                    <th width="50"><%=board.getCategory() %></th>
                    <th width="70">제목</th>
                    <th width="300"><%=board.getBoardTitle() %></th>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td><%=board.getBoardWriter() %></td>	
                    <td>작성일</td>
                    <td><%=board.getCreateDate() %></td>
                </tr>
            </thead>
            <tbody>

                <tr>
                    <td height="200">내용</td>
                    <td colspan="3"><%=board.getBoardContent() %></td>

                </tr>
                <tr>
                    <td>첨부파일</td>
                    <%if(attachment == null){ %>
                    	<td colspan="3">첨부파일없음</td>
                    <%}else { %>	
                    <td colspan="3"><a href="<%=contextPath %><%=attachment.getFilePath() %>/<%=attachment.getChangeName() %>" download><%=attachment.getOriginName() %></a></td>
                    <%} %>
                </tr>
            </tbody>
        </table>
        <br><br>
        <%if(loginUser != null && loginUser.getUserId().equals(board.getBoardWriter())){ %>
        <div align="center">
        	<button onclick="location.href='<%=contextPath %>/update.bo?bno=<%=board.getBoardNo() %>'" class="btn btn-info">수정하기</button>
        	<button onclick="location.href='<%=contextPath %>/delete.bo?bno=<%=board.getBoardNo() %>'" class="btn btn-danger">삭제하기</button>
        </div>
        <%} %>
    </div>

</body>
</html>