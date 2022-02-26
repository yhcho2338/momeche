package com.myspring.momeche001.board.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;
import org.springframework.stereotype.Component;


@Component("noticeVO")
public class NoticeVO {

	private int notice_num;
	private String notice_title;
	private String notice_content;
	private String mb_id;
	private Date notice_wDate;
	
	
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	
	
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	
	
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	
	
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	
	
	public Date getNotice_wDate() {
		return notice_wDate;
	}
	public void setNotice_wDate(Date notice_wDate) {
		this.notice_wDate = notice_wDate;
	}
	
	
	
}
