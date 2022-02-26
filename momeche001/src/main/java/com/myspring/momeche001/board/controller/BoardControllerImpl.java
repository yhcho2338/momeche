package com.myspring.momeche001.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.momeche001.board.service.BoardService;
import com.myspring.momeche001.board.vo.ArticleVO;
import com.myspring.momeche001.board.vo.ImageVO;
import com.myspring.momeche001.board.vo.NoticeVO;
import com.myspring.momeche001.board.vo.OtoVO;
import com.myspring.momeche001.board.vo.QnaVO;
import com.myspring.momeche001.member.vo.MemberVO;


	@Controller("boardController")
	public class BoardControllerImpl implements BoardController{
	
	private static final String ARTICLE_IMAGE_REPO = "C:\\momecheShop\\momeche\\board_image";
	@Autowired
	private BoardService boardService;
	@Autowired
	private ArticleVO articleVO;
	
	@Override
	@RequestMapping(value= "/board/listArticles.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		List articlesList = boardService.listArticles();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("articlesList", articlesList);
		return mav;
		}
	
	
	 //다중 이미지 글쓰기 
	
		@Override
		@RequestMapping(value="/board/addNewArticle.do" ,method = RequestMethod.POST)
	  	@ResponseBody
		public ResponseEntity addNewArticle(MultipartHttpServletRequest 
		  multipartRequest, HttpServletResponse response) throws Exception {
		  multipartRequest.setCharacterEncoding("utf-8");
			 String article_photo=null;
			 
			 Map articleMap = new HashMap();
			 Enumeration enu=multipartRequest.getParameterNames();
			 while(enu.hasMoreElements()){
				 String name=(String)enu.nextElement();
				 String value=multipartRequest.getParameter(name);
				 articleMap.put(name,value);
			 }
			 
	    //濡쒓렇�씤 �떆 �꽭�뀡�뿉 ���옣�맂 �쉶�썝 �젙蹂댁뿉�꽌 湲��벖�씠 �븘�씠�뵒瑜� �뼸�뼱���꽌 Map�뿉 ���옣�빀�땲�떎. 
			 HttpSession session = multipartRequest.getSession();
			 MemberVO memberVO = (MemberVO) session.getAttribute("member");
			 String id = memberVO.getMb_id();
			 articleMap.put("mb_id",id);
			 
			 List<String> fileList =upload(multipartRequest);
			 List<ImageVO> imageFileList = new ArrayList<ImageVO>();
			 if(fileList!= null && fileList.size()!=0) {
			 	for(String fileName : fileList) {
			 		ImageVO imageVO = new ImageVO();
			 		imageVO.setarticle_photo(fileName);
			 		imageFileList.add(imageVO);
			 	}
			 articleMap.put("imageFileList", imageFileList);
			 }
				String message;
				ResponseEntity resEnt=null;
				HttpHeaders responseHeaders = new HttpHeaders();
	 			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	 			
			try {
				int article_num = boardService.addNewArticle(articleMap);
				if(imageFileList!=null && imageFileList.size()!=0) {
					for(ImageVO imageVO:imageFileList) {
						article_photo = imageVO.getarticle_photo();
						File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+article_photo);
						File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+"board_"+article_num);
						FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
				
			}
				message = "<script>";
				message += " alert('게시글이 등록되었습니다.');";
				message += " location.href='"+multipartRequest.getContextPath()+"/board/listArticles.do'; ";
				message +=" </script>";
	 			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	 
				} 
				catch(Exception e) {
					if(imageFileList!=null && imageFileList.size()!=0) {
						for(ImageVO imageVO:imageFileList) {
							article_photo = imageVO.getarticle_photo();
							File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+article_photo);
							srcFile.delete();
	 				}
				}
					message = " <script>";
					message +=" alert('게시글 등록 오류');');";
					message +=" location.href='"+multipartRequest.getContextPath()+"/board/articleForm.do'; ";
					message +=" </script>";
					resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
					e.printStackTrace();
					}
			
			finally {
				message = "<script>";
				message += " alert('게시글이 등록되었습니다.');";
				message += " location.href='"+multipartRequest.getContextPath()+"/board/listArticles.do'; ";
				message +=" </script>";
	 			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				
			}
					return resEnt;

	 			}
		
		@Override
		@RequestMapping(value={"/board/modArticle.do","/board/adminmodArticle.do"} ,method =RequestMethod.POST)
		@ResponseBody
		  public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest,  
		    HttpServletResponse response) throws Exception{
		    multipartRequest.setCharacterEncoding("utf-8");
			Map<String,Object> articleMap = new HashMap<String, Object>();
			Enumeration enu=multipartRequest.getParameterNames();
			while(enu.hasMoreElements()){
				String name=(String)enu.nextElement();
				String value=multipartRequest.getParameter(name);
				articleMap.put(name,value);
			}
			
			String article_num=(String)articleMap.get("article_num");
			String message;
			ResponseEntity resEnt=null;
			HttpHeaders responseHeaders = new HttpHeaders();
			
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		    try {
		       boardService.modArticle(articleMap);
		       message = "<script>";
			   message += " alert('수정이 완료되었습니다.');";
			   message += " location.href='"+multipartRequest.getContextPath()+"/board/viewArticle.do?article_num="+article_num+"';";
			   message +=" </script>";
		       resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		       
		    }catch(Exception e) {
		      message = "<script>";
			  message += " alert('수정 실패');";
			  message += " location.href='"+multipartRequest.getContextPath()+"/board/viewArticle.do?article_num="+article_num+"';";
			  message +=" </script>";
		      resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		    }
		    
		    try {
			       boardService.adminmodArticle(articleMap);
			       message = "<script>";
				   message += " alert('수정이 완료되었습니다.');";
				   message += " location.href='"+multipartRequest.getContextPath()+"/board/viewArticle.do?article_num="+article_num+"';";
				   message +=" </script>";
			       resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			       
			    }catch(Exception e) {
			      message = "<script>";
				  message += " alert('수정 실패');";
				  message += " location.href='"+multipartRequest.getContextPath()+"/board/viewArticle.do?article_num="+article_num+"';";
				  message +=" </script>";
			      resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			    }
		    return resEnt;
		  }
		
		@Override
		@RequestMapping(value="/board/addReply.do" ,method = RequestMethod.POST)
	  	@ResponseBody
		public ResponseEntity addReply(MultipartHttpServletRequest 
		  multipartRequest, HttpServletResponse response) throws Exception {
		  multipartRequest.setCharacterEncoding("utf-8");
			 String article_photo=null;
			 
			 Map articleMap = new HashMap();
			 Enumeration enu=multipartRequest.getParameterNames();
			 while(enu.hasMoreElements()){
				 String name=(String)enu.nextElement();
				 String value=multipartRequest.getParameter(name);
				 articleMap.put(name,value);
			 }
			 
	    //濡쒓렇�씤 �떆 �꽭�뀡�뿉 ���옣�맂 �쉶�썝 �젙蹂댁뿉�꽌 湲��벖�씠 �븘�씠�뵒瑜� �뼸�뼱���꽌 Map�뿉 ���옣�빀�땲�떎. 
			 HttpSession session = multipartRequest.getSession();
			 MemberVO memberVO = (MemberVO) session.getAttribute("member");
			 String id = memberVO.getMb_id();
			 articleMap.put("mb_id",id);
			 
			 List<String> fileList =upload(multipartRequest);
			 List<ImageVO> imageFileList = new ArrayList<ImageVO>();
			 if(fileList!= null && fileList.size()!=0) {
			 	for(String fileName : fileList) {
			 		ImageVO imageVO = new ImageVO();
			 		imageVO.setarticle_photo(fileName);
			 		imageFileList.add(imageVO);
			 	}
			 articleMap.put("imageFileList", imageFileList);
			 }
				String message;
				ResponseEntity resEnt=null;
				HttpHeaders responseHeaders = new HttpHeaders();
	 			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	 			
			try {
				int article_num = boardService.addNewReply(articleMap);
				if(imageFileList!=null && imageFileList.size()!=0) {
					for(ImageVO imageVO:imageFileList) {
						article_photo = imageVO.getarticle_photo();
						File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+article_photo);
						File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+"board_"+article_num);
						FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
				
			}
				message = "<script>";
				message += " alert('게시글이 등록되었습니다.');";
				message += " location.href='"+multipartRequest.getContextPath()+"/board/listArticles.do'; ";
				message +=" </script>";
	 			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	 
				} 
				catch(Exception e) {
					if(imageFileList!=null && imageFileList.size()!=0) {
						for(ImageVO imageVO:imageFileList) {
							article_photo = imageVO.getarticle_photo();
							File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+article_photo);
							srcFile.delete();
	 				}
				}
					message = " <script>";
					message +=" alert('게시글 등록 오류');');";
					message +=" location.href='"+multipartRequest.getContextPath()+"/board/articleForm.do'; ";
					message +=" </script>";
					resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
					e.printStackTrace();
					}
			
			finally {
				message = "<script>";
				message += " alert('게시글이 등록되었습니다.');";
				message += " location.href='"+multipartRequest.getContextPath()+"/board/listArticles.do'; ";
				message +=" </script>";
	 			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				
			}
					return resEnt;

	 			}
		
		
	//다중 이미지 글 상세
	@Override
	@RequestMapping(value="/board/viewArticle.do", method = RequestMethod.GET)
	public ModelAndView viewArticle(@RequestParam("article_num") int article_num,
						HttpServletRequest request, HttpServletResponse response) throws Exception{
	String viewName = (String)request.getAttribute("viewName");
	Map articleMap=boardService.viewArticle(article_num);
	ModelAndView mav = new ModelAndView();
	mav.setViewName(viewName);
	mav.addObject("articleMap", articleMap);
	return mav;
	}
	
	
	@RequestMapping (value="/board/replyForm.do")
	public ModelAndView replyForm(@RequestParam("parentNO") int parentNO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("parentNO",parentNO);
		mv.setViewName("/board/replyForm");
		return mv;
	}
		

	//다중 이미지 글 삭제
	 @Override
	 @RequestMapping(value="/board/removeArticle.do" ,method = RequestMethod.POST)
	 @ResponseBody
	 public ResponseEntity removeArticle(@RequestParam("article_num") int article_num, HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			boardService.removeArticle(article_num);
			File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+"board_"+article_num);
			FileUtils.deleteDirectory(destDir);
		
			message = "<script>";
			message += " alert('게시글이 삭제되었습니다.');";
			message += " location.href='"+request.getContextPath()+"/board/listArticles.do';";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		 
		}catch(Exception e) {
			message = "<script>";
			message += " alert('게시글 삭제 오류');";
			message += " location.href='"+request.getContextPath()+"/board/listArticles.do';";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
			e.printStackTrace();
		 	}
		 	return resEnt;
		  }  
	 
		 
	 @RequestMapping(value = "/board/*Form.do", method = {RequestMethod.GET, RequestMethod.POST})
	 private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 
		 String viewName = (String)request.getAttribute("viewName");
		 ModelAndView mav = new ModelAndView();
		 mav.setViewName(viewName);
		 
		 return mav;
		 
	 }
	 
	//다중 이미지 업로드
		private List<String> upload(MultipartHttpServletRequest multipartRequest) throws Exception{
			
			List<String> fileList= new ArrayList<String>();
			Iterator<String> fileNames = multipartRequest.getFileNames();
			
			while(fileNames.hasNext()){
				String fileName = fileNames.next();
				MultipartFile mFile = multipartRequest.getFile(fileName);
				String originalFileName=mFile.getOriginalFilename();
				
				fileList.add(originalFileName);
				File file = new File(ARTICLE_IMAGE_REPO +"\\"+"temp"+"\\"+ fileName);
				if(mFile.getSize()!=0){ //File Null Check
					if(!file.exists()){ //寃쎈줈�긽�뿉 �뙆�씪�씠 議댁옱�븯吏� �븡�쓣 寃쎌슦
						if(file.getParentFile().mkdirs()) {
							file.createNewFile();
						}
					}
					mFile.transferTo(new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+originalFileName));
				}
			}
			return fileList;
			
		}
		
	}

