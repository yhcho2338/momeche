package com.myspring.momeche001.member.vo;

import java.sql.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {
	
	private String mb_id;
	private String mb_pw;
	private String mb_name;
	private String mb_gender;
	private String mb_level;
	private String mb_subAdmin;
	private int mb_allPrice;
	private int mb_allCount;
	private int mb_likeCount;
	private String tel_1;
	private String tel_2;
	private String tel_3;
	private String email_1;
	private String email_2;
	private int email_STS;
	private String mb_birthY; 
	private String mb_birthM;
	private String mb_birthD;
	private String zipcode;
	private String road_address;
	private String jibun_address;
	private String other_address;
	private Date join_date;
	
	
	
	public MemberVO() {
		
	}
	
	
	public MemberVO(String mb_id, String mb_pw, String mb_name, String mb_gender, String mb_level, 
					String mb_subAdmin, int mb_allPrice, int mb_allCount, int mb_likeCount, 
					String tel_1, String tel_2, String tel_3, String email_1, String email_2,
					int email_STS, String mb_birthY, String mb_birthM, String mb_birthD,
					String zipcode, String road_address, String jibun_address, 
					String other_address) {
		
		this.mb_id = mb_id;
		this.mb_pw = mb_pw;
		this.mb_name = mb_name;
		this.mb_gender = mb_gender;
		this.mb_level = mb_level;
		this.mb_subAdmin = mb_subAdmin;
		this.mb_allPrice = mb_allPrice;
		this.mb_allCount = mb_allCount;
		this.mb_likeCount = mb_likeCount;
		this.tel_1 = tel_1;
		this.tel_2 = tel_2;
		this.tel_3 = tel_3;
		this.email_1 = email_1;
		this.email_2 = email_2;
		this.email_STS = email_STS;
		this.mb_birthY = mb_birthY;
		this.mb_birthM = mb_birthM;
		this.mb_birthD = mb_birthD;
		this.zipcode = zipcode;
		this.road_address = road_address;
		this.jibun_address = jibun_address;
		this.other_address = other_address;
		
	}

	
	
	
	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public String getMb_pw() {
		return mb_pw;
	}

	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}

	public String getMb_name() {
		return mb_name;
	}

	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}

	public String getMb_gender() {
		return mb_gender;
	}

	public void setMb_gender(String mb_gender) {
		this.mb_gender = mb_gender;
	}

	public String getMb_level() {
		return mb_level;
	}

	public void setMb_level(String mb_level) {
		this.mb_level = mb_level;
	}

	public String getMb_subAdmin() {
		return mb_subAdmin;
	}

	public void setMb_subAdmin(String mb_subAdmin) {
		this.mb_subAdmin = mb_subAdmin;
	}

	public int getMb_allPrice() {
		return mb_allPrice;
	}

	public void setMb_allPrice(int mb_allPrice) {
		this.mb_allPrice = mb_allPrice;
	}

	public int getMb_allCount() {
		return mb_allCount;
	}

	public void setMb_allCount(int mb_allCount) {
		this.mb_allCount = mb_allCount;
	}

	public int getMb_likeCount() {
		return mb_likeCount;
	}

	public void setMb_likeCount(int mb_likeCount) {
		this.mb_likeCount = mb_likeCount;
	}

	public String getTel_1() {
		return tel_1;
	}

	public void setTel_1(String tel_1) {
		this.tel_1 = tel_1;
	}

	public String getTel_2() {
		return tel_2;
	}

	public void setTel_2(String tel_2) {
		this.tel_2 = tel_2;
	}

	public String getTel_3() {
		return tel_3;
	}

	public void setTel_3(String tel_3) {
		this.tel_3 = tel_3;
	}

	public String getEmail_1() {
		return email_1;
	}

	public void setEmail_1(String email_1) {
		this.email_1 = email_1;
	}

	public String getEmail_2() {
		return email_2;
	}

	public void setEmail_2(String email_2) {
		this.email_2 = email_2;
	}

	public int getEmail_STS() {
		return email_STS;
	}

	public void setEmail_STS(int email_STS) {
		this.email_STS = email_STS;
	}

	public String getMb_birthY() {
		return mb_birthY;
	}

	public void setMb_birthY(String mb_birthY) {
		this.mb_birthY = mb_birthY;
	}

	public String getMb_birthM() {
		return mb_birthM;
	}

	public void setMb_birthM(String mb_birthM) {
		this.mb_birthM = mb_birthM;
	}

	public String getMb_birthD() {
		return mb_birthD;
	}

	public void setMb_birthD(String mb_birthD) {
		this.mb_birthD = mb_birthD;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getRoad_address() {
		return road_address;
	}

	public void setRoad_address(String road_address) {
		this.road_address = road_address;
	}

	public String getJibun_address() {
		return jibun_address;
	}

	public void setJibun_address(String jibun_address) {
		this.jibun_address = jibun_address;
	}

	public String getOther_address() {
		return other_address;
	}

	public void setOther_address(String other_address) {
		this.other_address = other_address;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	
	
	public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }



	
	

	

}
