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
        .outerr{
            background-color: black;
            color: white;
            width: 1000px;
            height: 1000px;
            margin: auto;
            margin-top: 50px;
        }
    </style>
</head>
<body>
	<%@include file="../common/menubar.jsp" %>
    <div class="outerr">
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
        
        <br>
        <div id="reply-area">
        	<table border="1" align="center">
        		<thead>
        		<%if(loginUser != null) { %>
        			<tr>
        				<th>댓글작성</th>
        				<td><textarea id="replyBox" rows="3" cols="50" style="resize:none"></textarea></td>
        				<td><button onclick="insertReply();">댓글등록</button></td>
        			</tr>
        		<%}else{ %>
        			<tr>
        				<th>댓글작성</th>
        				<td>
        					<textarea rows="3" cols="50" style="resize:none" readonly>로그인 후 이용 가능한 서비스입니다.</textarea>
        				</td>
        				<td><button onclick="insertReply();">댓글등록</button></td>
        			</tr>
        		<%} %>
        		</thead>
        		<tbody id="replyBody">

        		</tbody>
        	</table>
        	<br><br>
        	
        	<script>
        		function insertReply(){
        			//댓글 삽입
        			//게시글 번호 필요
        			//성공시에는 댓글 리스트 조회함수 실행 후 textarea 비워주기
        			var replyText = $("#replyBox").val();
        			
        			$.ajax({
        				url:"insert.re",
        				data :{
        					replyData : replyText,
        					boardNo : <%=board.getBoardNo() %>
        				},
        				type : "post",
        				success : function(result){
        					selectReplyList();
        					$("#replyBox").val('');
        				},
        				error: function(){
        					console.log("통신실패");
        				}
        			});
        			
        			
        		}
        		
        		function selectReplyList(){
        			//댓글 목록 조회
        			//조회해온 데이터를 tbody에 tr로 출력해주기
        			
        			$.ajax({
        				url:"list.re",
        				data : {
        					boardNo : <%=board.getBoardNo() %>
        				},
        				type : "get",
        				success : function(result){
        					var str="";
        					
        					for(var i=0; i<result.length; i++){
        						str+= "<tr>"
        							+"<td>"+result[i].replyWriter+"</td>"
        							+"<td>"+result[i].content+"</td>"
        							+"<td>"+result[i].createDate+"</td>"
        							+"</tr>"
        					}
        					$("#replyBody").html(str);
        					
        				}
        			});
        		}
        		
        		$(function(){
        			selectReplyList();
        		})
        			  		
        	</script>
        	
        </div>
    
    </div>

</body>
</html>