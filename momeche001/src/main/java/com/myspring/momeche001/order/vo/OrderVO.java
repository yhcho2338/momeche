package com.myspring.momeche001.order.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("orderVO")
public class OrderVO {
	
	private int order_num;
	private String order_id;
	private String mb_id;
	private int pd_id;
	private String pd_name;
	private int order_price;
	private int order_amount;
	private String receiver_name;
	private String receiver_tel1;
	private String receiver_tel2;
	private String receiver_tel3;
	private String receiver_zipcode;
	private String receiver_road_address;
	private String receiver_jibun_address;
	private String receiver_other_address;
	private Date order_date;
	private String order_state;
	
	// 최종수정 22.01.25 (지속 수정 요망)
	
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
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
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public int getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
	}
	public String getReceiver_name() {
		return receiver_name;
	}
	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}
	public String getReceiver_tel1() {
		return receiver_tel1;
	}
	public void setReceiver_tel1(String receiver_tel1) {
		this.receiver_tel1 = receiver_tel1;
	}
	public String getReceiver_tel2() {
		return receiver_tel2;
	}
	public void setReceiver_tel2(String receiver_tel2) {
		this.receiver_tel2 = receiver_tel2;
	}
	public String getReceiver_tel3() {
		return receiver_tel3;
	}
	public void setReceiver_tel3(String receiver_tel3) {
		this.receiver_tel3 = receiver_tel3;
	}
	public String getReceiver_zipcode() {
		return receiver_zipcode;
	}
	public void setReceiver_zipcode(String receiver_zipcode) {
		this.receiver_zipcode = receiver_zipcode;
	}
	public String getReceiver_road_address() {
		return receiver_road_address;
	}
	public void setReceiver_road_address(String receiver_road_address) {
		this.receiver_road_address = receiver_road_address;
	}
	public String getReceiver_jibun_address() {
		return receiver_jibun_address;
	}
	public void setReceiver_jibun_address(String receiver_jibun_address) {
		this.receiver_jibun_address = receiver_jibun_address;
	}
	public String getReceiver_other_address() {
		return receiver_other_address;
	}
	public void setReceiver_other_address(String receiver_other_address) {
		this.receiver_other_address = receiver_other_address;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}
	
	
	
	
	

}
