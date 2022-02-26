package com.myspring.momeche001.product.vo;

import org.springframework.stereotype.Component;


public class ImageFileVO {
	
	private int image_num;
	private String fileName;
	private String fileType;
	private int pd_id;
	private String pd_name;

	
	
	public ImageFileVO() {
		super();
	}
	

	public int getImage_num() {
		return image_num;
	}


	public void setImage_num(int image_num) {
		this.image_num = image_num;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public String getFileType() {
		return fileType;
	}


	public void setFileType(String fileType) {
		this.fileType = fileType;
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







	

	
	

}
