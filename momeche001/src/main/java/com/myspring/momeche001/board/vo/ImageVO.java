package com.myspring.momeche001.board.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;
import org.springframework.stereotype.Component;

@Component("imageVO")
public class ImageVO {
	
		private int imageFileNO;
		private String article_photo;
		private Date regDate;
		private int article_num;
		
		public int getImageFileNO() {
			return imageFileNO;
		}
		
		public void setImageFileNO(int imageFileNO) {
			this.imageFileNO = imageFileNO;
		}
		
		public String getarticle_photo() {
			return article_photo;
		}
		
		public void setarticle_photo(String article_photo) {
			try {
				if(article_photo!= null && article_photo.length()!=0) {
					this.article_photo = URLEncoder.encode(article_photo,"UTF-8");
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		
		public Date getRegDate() {
			return regDate;
		}
		
		public void setRegDate(Date regDate) {
			this.regDate = regDate;
		}
		
		public int getarticle_num() {
		return article_num;
		}

		public void setarticle_num(int article_num) {
			this.article_num = article_num;
			}

}
