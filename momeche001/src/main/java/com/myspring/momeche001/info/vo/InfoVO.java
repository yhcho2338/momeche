package com.myspring.momeche001.info.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("infoVO")
public class InfoVO {
	
	private int info_num;
	private String info_title;
	private String info_url;
	private String info_url_origin;
	private String info_content;
	private Date info_wDate;
	private String mb_id;
	
	
	public int getInfo_num() {
		return info_num;
	}
	public void setInfo_num(int info_num) {
		this.info_num = info_num;
	}
	
	
	public String getInfo_title() {
		return info_title;
	}
	public void setInfo_title(String info_title) {
		this.info_title = info_title;
	}
	
	
	public String getInfo_url() {
		return info_url;
	}
	public String setInfo_url(String info_url) {
		return this.info_url = info_url;
	}

	
	public String getInfo_url_origin() {
		return info_url_origin;
	}
	public String setInfo_url_origin(String info_url_origin) {
		return this.info_url_origin = info_url_origin;
	}
	
	
	public String getInfo_content() {
		return info_content;
	}
	public void setInfo_content(String info_content) {
		this.info_content = info_content;
	}
	
	
	public Date getInfo_wDate() {
		return info_wDate;
	}
	public void setInfo_wDate(Date info_wDate) {
		this.info_wDate = info_wDate;
	}
	
	
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	
	
	@Override
	public String toString() {
		return "InfoVO [info_num=" + info_num + ", info_title=" + info_title + ", info_url=" + info_url
				+ ", info_url_origin=" + info_url_origin + ", info_content=" + info_content + ", info_wDate="
				+ info_wDate + ", mb_id=" + mb_id + "]";
	}

	

}
