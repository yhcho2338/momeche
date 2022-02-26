package com.myspring.momeche001.product.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;


@Component("productVO")
public class ProductVO {
	
	private int pd_id;
	private String pd_name;
	private String pd_code;
	private int pd_price;
	private int pd_inCount;
	private int pd_stock;
	private String pd_level;
	private String pd_group1;
	private String pd_group2;
	private String pd_status;
	private int pd_event;
	private int pd_likethis;
	private Date pd_inDate;
	private String pd_limitDate;
	private String pd_content;
	private String pd_fileName;
	
	private String sort;
	//이벤트 설정을 위한 추가 
	private int event;
	
	
	public ProductVO() {
		
	}
	
	


	public int getPd_id() {
		return pd_id;
	}


	public void setPd_id(int pd_id) {
		this.pd_id = pd_id;
	}


	public String getPd_name() {
		return pd_name;
	}


	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}


	public String getPd_code() {
		return pd_code;
	}


	public void setPd_code(String pd_code) {
		this.pd_code = pd_code;
	}


	public int getPd_price() {
		return pd_price;
	}


	public void setPd_price(int pd_price) {
		this.pd_price = pd_price;
	}


	public int getPd_inCount() {
		return pd_inCount;
	}


	public void setPd_inCount(int pd_inCount) {
		this.pd_inCount = pd_inCount;
	}


	public int getPd_stock() {
		return pd_stock;
	}


	public void setPd_stock(int pd_stock) {
		this.pd_stock = pd_stock;
	}


	public String getPd_level() {
		return pd_level;
	}


	public void setPd_level(String pd_level) {
		this.pd_level = pd_level;
	}


	public String getPd_group1() {
		return pd_group1;
	}


	public void setPd_group1(String pd_group1) {
		this.pd_group1 = pd_group1;
	}


	public String getPd_group2() {
		return pd_group2;
	}


	public void setPd_group2(String pd_group2) {
		this.pd_group2 = pd_group2;
	}


	public String getPd_status() {
		return pd_status;
	}


	public void setPd_status(String pd_status) {
		this.pd_status = pd_status;
	}
	
	
	public int getPd_event() {
		return pd_event;
	}


	public void setPd_event(int pd_event) {
		this.pd_event = pd_event;
	}


	public int getPd_likethis() {
		return pd_likethis;
	}


	public void setPd_likethis(int pd_likethis) {
		this.pd_likethis = pd_likethis;
	}


	public Date getPd_inDate() {
		return pd_inDate;
	}


	public void setPd_inDate(Date pd_inDate) {
		this.pd_inDate = pd_inDate;
	}


	public String getPd_limitDate() {
		return pd_limitDate;
	}


	public void setPd_limitDate(String pd_limitDate) {
		this.pd_limitDate = pd_limitDate;
	}


	public String getPd_content() {
		return pd_content;
	}


	public void setPd_content(String pd_content) {
		this.pd_content = pd_content;
	}
	
	
	public String getPd_fileName() {
		return pd_fileName;
	}


	public void setPd_fileName(String pd_fileName) {
		this.pd_fileName = pd_fileName;
	}




	@Override
	public String toString() {
		return "ProductVO [pd_id=" + pd_id + ", pd_name=" + pd_name + ", pd_code=" + pd_code + ", pd_price=" + pd_price
				+ ", pd_inCount=" + pd_inCount + ", pd_stock=" + pd_stock + ", pd_level=" + pd_level + ", pd_group1="
				+ pd_group1 + ", pd_group2=" + pd_group2 + ", pd_status=" + pd_status + ", pd_event=" + pd_event
				+ ", pd_likethis=" + pd_likethis + ", pd_inDate=" + pd_inDate + ", pd_limitDate=" + pd_limitDate
				+ ", pd_content=" + pd_content + ", pd_fileName=" + pd_fileName + "]";
	}




	public String getSort() {
		return sort;
	}


	public void setSort(String sort) {
		this.sort = sort;
	}




	public int getEvent() {
		return event;
	}




	public void setEvent(int event) {
		this.event = event;
	}
	
	
	
	
	
	
	
}
