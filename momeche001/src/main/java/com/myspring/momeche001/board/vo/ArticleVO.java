package com.myspring.momeche001.board.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;
import org.springframework.stereotype.Component;

	@Component("articleVO")
	public class ArticleVO {
		
		private int article_num;
		private int pos;
		private int depth;
		private int parentNO;
		private String article_title;
		private String article_content;
		private String replyContent;
		private String article_photo;
		private String mb_id;
		private String mb_name;
		private String pd_id;
		private String pd_name;
		private Date article_wDate;
		private int article_likeThis;
		
		
		public int getArticle_num() {
			return article_num;
		}
		public void setArticle_num(int article_num) {
			this.article_num = article_num;
		}
		
		
		public int getPos() {
			return pos;
		}
		public void setPos(int pos) {
			this.pos = pos;
		}
		
		
		public int getParentNO() {
			return parentNO;
		}
		public void setParentNO(int parentNO) {
			this.parentNO = parentNO;
		}
		
		
		public int getDepth() {
			return depth;
		}
		public void setDepth(int depth) {
			this.depth = depth;
		}
		
		
		public String getArticle_title() {
			return article_title;
		}
		public void setArticle_title(String article_title) {
			this.article_title = article_title;
		}
		
		
		public String getArticle_content() {
			return article_content;
		}
		public void setArticle_content(String article_content) {
			this.article_content = article_content;
		}
		
		
		
		
		public String getReplyContent() {
			return replyContent;
		}
		public void setReplyContent(String replyContent) {
			this.replyContent = replyContent;
		}
		
		
		public String getArticle_photo() {
			return article_photo;
		}
		public void setArticle_photo(String article_photo) {
			this.article_photo = article_photo;
		}
		
		
		
		public int getArticle_likeThis() {
			return article_likeThis;
		}
		public void setArticle_likeThis(int article_likeThis) {
			this.article_likeThis = article_likeThis;
		}
		
		public String getMb_id() {
			return mb_id;
		}
		public void setMb_id(String mb_id) {
			this.mb_id = mb_id;
		}
		
		public String getMb_name() {
			return mb_name;
		}
		public void setMb_name(String mb_name) {
			this.mb_name = mb_name;
		}
		
		public String getPd_id() {
			return pd_id;
		}
		
		public void setPd_id(String pd_id) {
			this.pd_id = pd_id;
		}
		
		
		public String getPd_name() {
			return pd_name;
		}
		public void setPd_name(String pd_name) {
			this.pd_name = pd_name;
		}
		
		
		public Date getArticle_wDate() {
			return article_wDate;
		}
		public void setArticle_wDate(Date article_wDate) {
			this.article_wDate = article_wDate;
		}
										


}
