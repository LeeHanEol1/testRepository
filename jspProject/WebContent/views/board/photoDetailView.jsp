<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.board.model.vo.*"%>
    <%
    	Board b = (Board)request.getAttribute("b");

    	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	
	<div class="outer" style="height:900px">
		<br>
		<h2 align="center">사진 게시글 상세보기</h2>
		<br>
		

			<table align="center">
				<tr>
					<th width="100">제목</th>
					<td colspan="3"><%=b.getBoardTitle() %></td>				
				</tr>
				<tr>
					<th>작성자</th>
					<td><%=b.getBoardWriter() %></td>
					<th>작성일</th>
					<td><%=b.getCreateDate() %></td>
					<th>내용</th>
					<td colspan="3"><p><%=b.getBoardContent() %></p></td>
				</tr>
				<tr>
					<th>대표이미지</th>
					<td colspan="3" align="center">
						<img src="<%=contextPath + list.get(0).getFilePath()+list.get(0).getChangeName()%>" width="250" height="170" id="titleImg">
						<%System.out.println(contextPath + list.get(0).getFilePath()+list.get(0).getChangeName()); %>
					</td>		
				</tr>
				<tr>
					<th>상세이미지</th>
					<%for(int i=1; i<list.size(); i++) { %>
						<td><img src="<%=contextPath+list.get(i).getFilePath()+list.get(i).getChangeName()%>" id="contentImg1" width="150" height="120"s></td>
					<%} %>
				</tr>
			
			</table>
		</div>
</body>
</html>