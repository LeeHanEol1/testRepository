package com.kh.board.model.vo;

import java.util.Date;

public class Reply {
	private int replyNo;//	REPLY_NO	NUMBER
	private String content;//	REPLY_CONTENT	VARCHAR2(400 BYTE)
	private int refBno;//	REF_BNO	NUMBER
	private String replyWriter;//	REPLY_WRITER	NUMBER
	private Date createDate;//	CREATE_DATE	DATE
	private String status;//	STATUS	VARCHAR2(1 BYTE)
	
	public Reply() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Reply(int replyNo, String content, int refBno, String replyWriter, Date createDate, String status) {
		super();
		this.replyNo = replyNo;
		this.content = content;
		this.refBno = refBno;
		this.replyWriter = replyWriter;
		this.createDate = createDate;
		this.status = status;
	}

	
	public Reply(String content, String replyWriter, Date createDate) {
		super();
		this.content = content;
		this.replyWriter = replyWriter;
		this.createDate = createDate;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRefBno() {
		return refBno;
	}

	public void setRefBno(int refBno) {
		this.refBno = refBno;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", Content=" + content + ", refBno=" + refBno + ", replyWriter="
				+ replyWriter + ", createDate=" + createDate + ", status=" + status + "]";
	}
	
	
}
