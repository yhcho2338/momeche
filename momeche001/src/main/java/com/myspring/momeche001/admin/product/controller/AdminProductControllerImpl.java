package com.myspring.momeche001.admin.product.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.maven.shared.invoker.SystemOutHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.momeche001.common.base.BaseController;
import com.myspring.momeche001.member.controller.MemberControllerImpl;
import com.myspring.momeche001.product.vo.ImageFileVO;
import com.myspring.momeche001.product.vo.ProductVO;
import com.myspring.momeche001.admin.product.service.AdminProductService;

@Controller("adminProductController")
@RequestMapping(value="/admin/product")
public class AdminProductControllerImpl extends BaseController implements AdminProductController {
	private static final Logger logger = LoggerFactory.getLogger(AdminProductControllerImpl.class);
	
	private static final String CURR_IMAGE_REPO_PATH = "C:\\momecheShop\\momeche\\image_repo";
	@Autowired
	private AdminProductService adminProductService;
	
	@RequestMapping(value="/adminProductMain.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView adminPdMain(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		
		
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		session=request.getSession();
		session.setAttribute("side_menu", "admin_mode"); 
		
		List adminProductList = adminProductService.listProducts();	
		mav.addObject("adminProductList", adminProductList);
		return mav;
	}

	@Override
	public ModelAndView adminPdMain(Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	// 상품 등록
	@RequestMapping(value="/addNewPd.do" ,method={RequestMethod.POST})
	public ResponseEntity addNewPd(@RequestParam("pd_id") int pd_id, MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String imageFileName=null;
		
		Map newProductMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			newProductMap.put(name,value);
		}
	
		
		
		List<ImageFileVO> imageFileList =upload(multipartRequest);
		if(imageFileList!= null && imageFileList.size()!=0) {
			for(ImageFileVO imageFileVO : imageFileList) {
				imageFileVO.setPd_id(pd_id);
				
				
			}
			newProductMap.put("imageFileList", imageFileList);
		}
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			pd_id = adminProductService.addNewProduct(newProductMap);
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(ImageFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageFileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH+"\\"+pd_id);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
			}
			message= "<script>";
			message += " alert('상품이 정상적으로 등록되었습니다.');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/admin/product/addNewPdForm.do?pd_id="+pd_id+"';";
			message +=("</script>");
		}catch(Exception e) {
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(ImageFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageFileName);
					srcFile.delete();
				}
			}
			
			message= "<script>";
			message += " alert('상품 등록 중 오류가 발생했습니다.');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/admin/product/addNewPdForm.do';";
			message +=("</script>");
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	
	
	
	// 상품 선택삭제
	@Override
	@ResponseBody
	@RequestMapping(value="/removeProduct.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String removeProduct (HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		System.out.println(ajaxMsg);
		
		int size = ajaxMsg.length;
		System.out.println(size);
		for(int i=0; i<size; i++) {
			adminProductService.removePd(ajaxMsg[i]);
		}
	
		return "redirect:/admin/product/adminProductMain.do";
	}
	
	
	
	
	// 상품 개별삭제
	@Override
	@RequestMapping(value="/removeProduct2.do", method = RequestMethod.GET)
	public ModelAndView removeProduct2(@RequestParam("pd_id") String pd_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		adminProductService.removePd2(pd_id);
		ModelAndView mav = new ModelAndView("redirect:/admin/product/adminProductMain.do");
		return mav;
	}
	
	
	
	
	@RequestMapping(value="/modifyProductForm.do" ,method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView modifyProdcutForm(@RequestParam("pd_id") int pd_id,
			                            HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		Map productMap=adminProductService.pd_Detail(pd_id);
		mav.addObject("productMap",productMap);
		
		return mav;
	}
	
	@RequestMapping(value="/modifyGoodsInfo.do" ,method={ RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity modifyGoodsInfo( @RequestParam("pd_id") String pd_id,
			                     @RequestParam("attribute") String attribute,
			                     @RequestParam("value") String value,
			HttpServletRequest request, HttpServletResponse response)  throws Exception {
		//System.out.println("modifyGoodsInfo");
		
		Map<String,String> productMap=new HashMap<String,String>();
		productMap.put("pd_id", pd_id);
		productMap.put(attribute, value);
		//System.out.println(productMap);
		adminProductService.modifyGoodsInfo(productMap);
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message  = "mod_success";
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	

	@RequestMapping(value="/modifyGoodsImageInfo.do" ,method={RequestMethod.POST})
	public void modifyGoodsImageInfo(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception {
		//System.out.println("modifyGoodsImageInfo");
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String imageFileName=null;
		
		Map productMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			productMap.put(name,value);
		}
		
		/*
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String reg_id = memberVO.getMember_id();
		*/
		
		List<ImageFileVO> imageFileList=null;
		int pd_id=0;
		//int image_id=0;
		try {
			imageFileList =upload(multipartRequest);
			if(imageFileList!= null && imageFileList.size()!=0) {
				for(ImageFileVO imageFileVO : imageFileList) {
					pd_id = Integer.parseInt((String)productMap.get("pd_id"));
					//image_id = Integer.parseInt((String)goodsMap.get("image_id"));
					imageFileVO.setPd_id(pd_id);
					//imageFileVO.setImage_id(image_id);
					//imageFileVO.setReg_id(reg_id);
				}
				
			    adminProductService.modifyGoodsImage(imageFileList);
				for(ImageFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageFileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH+"\\"+pd_id);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
			}
		}catch(Exception e) {
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(ImageFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageFileName);
					srcFile.delete();
				}
			}
			e.printStackTrace();
		}
		
	}
	// 이벤트 상품 설정을 위한 추가 구문 설정
		@Override
		@RequestMapping(value="/eventChk.do", method = RequestMethod.GET)
		public ModelAndView eventChk(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = (String)request.getAttribute("viewName");
			List eventList = adminProductService.eventChk();
			ModelAndView mav = new ModelAndView(viewName);
			//System.out.println("eventList : " + eventList);
			mav.addObject("eventList", eventList);
			return mav;
		}
	
	
	

	

}
