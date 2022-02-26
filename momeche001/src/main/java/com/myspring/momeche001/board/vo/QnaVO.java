package com.myspring.momeche001.board.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("qnaVO")
public class QnaVO {
	private int qna_num;
	private String qna_title;
	private String qna_content;
	private Date qna_wDate;
	private String mb_id;
	
	
	public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
	
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	
	public Date getQna_wDate() {
		return qna_wDate;
	}
	public void setQna_wDate(Date qna_wDate) {
		this.qna_wDate = qna_wDate;
	}
	
	
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	
	
	
	
}