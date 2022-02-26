package com.myspring.momeche001.board.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;


@Component("otoVO")
public class OtoVO {
	
	private int oto_num;
	private int pos;
	private int depth;
	private int oto_parentNO;
	private int answerornot;
	private String mb_id;
	private String oto_id;
	private String oto_title;
	private String oto_content;
	private String replyContent;
	private Date oto_wDate;
	
	
	
	public int getOto_num() {
		return oto_num;
	}
	public void setOto_num(int oto_num) {
		this.oto_num = oto_num;
	}
	
	
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	
	
	
	public String getOto_id() {
		return oto_id;
	}
	public void setOto_id(String oto_id) {
		this.oto_id = oto_id;
	}
	
	
	public String getOto_title() {
		return oto_title;
	}
	public void setOto_title(String oto_title) {
		this.oto_title = oto_title;
	}
	
	
	public String getOto_content() {
		return oto_content;
	}
	public void setOto_content(String oto_content) {
		this.oto_content = oto_content;
	}
	
	
	public Date getOto_wDate() {
		return oto_wDate;
	}
	public void setOto_wDate(Date oto_wDate) {
		this.oto_wDate = oto_wDate;
	}
	
	public int getPos() {
		return pos;
	}
	public void setPos(int pos) {
		this.pos = pos;
	}
	
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	
	
	
	public int getAnswerornot() {
		return answerornot;
	}
	public void setAnswerornot(int answerornot) {
		this.answerornot = answerornot;
	}
	
	
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	
	
	public int getOto_parentNO() {
		return oto_parentNO;
	}
	public void setOto_parentNO(int oto_parentNO) {
		this.oto_parentNO = oto_parentNO;
	}
	
	
	
}
