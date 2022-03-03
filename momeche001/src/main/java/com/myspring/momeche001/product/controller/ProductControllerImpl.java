package com.myspring.momeche001.product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.momeche001.common.base.BaseController;
import com.myspring.momeche001.product.service.ProductService;
import com.myspring.momeche001.product.vo.ProductVO;

import net.sf.json.JSONObject;



@Controller("productController")
@RequestMapping(value="/goods")
public class ProductControllerImpl extends BaseController implements ProductController {
	
	@Autowired
	private ProductService productService;
	
	
	
	// 상품 정렬
	@Override
	@RequestMapping(value = {"/productSort.do"},method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView productSort(ProductVO productVO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		//Map<String, Object> param = new HashMap<String, Object>();

		List<ProductVO> productMWMap = productService.listProducts(productVO);
		mav.addObject("productMWMap", productMWMap);
		return mav;
	}
	
	
	// 상품 상세
	@RequestMapping(value="/productDetail.do" ,method = RequestMethod.GET)
	public ModelAndView productDetail(@RequestParam("pd_id") String pd_id,
			                       HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		Map productMap=productService.pdDetail(pd_id);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("productMap", productMap);
		ProductVO productVO=(ProductVO)productMap.get("productVO");
		mav.setViewName(viewName);
		addGoodsInQuick(pd_id,productVO,session);
		return mav;
	}
		
	
	// 키워드 검색
	@RequestMapping(value="/keywordSearch.do",method = RequestMethod.GET,produces = "application/text; charset=utf8")
	public @ResponseBody String  keywordSearch(@RequestParam("keyword") String keyword,
			                                  HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		//System.out.println(keyword);
		if(keyword == null || keyword.equals(""))
		   return null;
	
		keyword = keyword.toUpperCase();
	    List<String> keywordList =productService.keywordSearch(keyword);
	    
	 // 최종 완성될 JSONObject 선언
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("keyword", keywordList);
		 		
	    String jsonInfo = jsonObject.toString();
	    System.out.println("jsonInfo:" + jsonInfo.toString()); // 데이터 확인
	    return jsonInfo;
	}
	
	
	// 상품 검색
	@RequestMapping(value="/searchProduct.do" ,method = RequestMethod.GET)
	public ModelAndView searchGoods(@RequestParam("searchWord") String searchWord,
			                       HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		List<ProductVO> productList=productService.searchGoods(searchWord);
		System.out.println("productList:" + productList.toString()); // 데이터 확인
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("productList", productList);
		return mav;
		
	}
	
	
	// 상품 퀵메뉴
	private void addGoodsInQuick(String pd_id,ProductVO productVO,HttpSession session){
		boolean already_existed=false;
		List<ProductVO> quickGoodsList; 
		quickGoodsList=(ArrayList<ProductVO>)session.getAttribute("quickGoodsList");
		
		if(quickGoodsList!=null){
			if(quickGoodsList.size() < 4){ 
				for(int i=0; i<quickGoodsList.size();i++){
					ProductVO _pdBean=(ProductVO)quickGoodsList.get(i);
					if(pd_id.equals(_pdBean.getPd_id())){
						already_existed=true;
						break;
					}
				}
				if(already_existed==false){
					quickGoodsList.add(productVO);
				}
			}
			
		}else{
			quickGoodsList =new ArrayList<ProductVO>();
			quickGoodsList.add(productVO);
			
		}
		session.setAttribute("quickGoodsList",quickGoodsList);
		session.setAttribute("quickGoodsListNum", quickGoodsList.size());
	}
	
	

}
