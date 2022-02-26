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
	
	
	@RequestMapping(value={"/productManMain.do", "/productWomanMain.do"} ,method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView productManMain(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		session=request.getSession();
		//session.setAttribute("side_menu", "user");
		Map<String,List<ProductVO>> productMWMap=productService.listProduct();
		mav.addObject("productMWMap", productMWMap);
		return mav;
	
	}
	
	
	
	
	@RequestMapping(value="/productPriceSort.do" ,method = RequestMethod.GET)
	public ModelAndView productPriceSort(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		session=request.getSession();
		
		Map<String,List<ProductVO>> productMWMap=productService.listProduct();
		mav.addObject("productMWMap", productMWMap);
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
		List<ProductVO> quickGoodsList; //�ֱ� �� ��ǰ ���� ArrayList
		quickGoodsList=(ArrayList<ProductVO>)session.getAttribute("quickGoodsList");
		
		if(quickGoodsList!=null){
			if(quickGoodsList.size() < 4){ //�̸��� ��ǰ ����Ʈ�� ��ǰ������ ���� ������ ���
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
	
	
	

	
	
	@Override
	@RequestMapping(value = "/product_list/*", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView productList(@RequestParam Map<String, String> info, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName + ".do"); // viewName 가변성 확보
		
		
		// get 요청이 없을경우, 기존의 session을 제거
		if (info.isEmpty()) {
			session.removeAttribute("main_option");
			session.removeAttribute("sub_option");
			session.removeAttribute("title_option");
			session.removeAttribute("order_option");
		}
		
		
		if(viewName.contains("man")) {
			info.put("main_option", "man");
			mav.addObject("pageInfo", "set_man");
		}
		else if(viewName.contains("woman")) {
			info.put("main_option", "woman");
			mav.addObject("pageInfo", "set_woman");
		}
		
		Map<String, Map<String, Object>> productFullList = getFullList(info, request);
		
		/*String pageNo = info.get("pageNo");
		
		if (pageNo != null && pageNo != "") {
			int lastNo = (productFullList.size()+11)/12;
			
			if (Integer.parseInt(pageNo) > lastNo) {
				mav.addObject("pageNo", 1);
				mav.setViewName("redirect:"+viewName +".do");
			}
			else {
				mav.addObject("pageNo", pageNo);	
				mav.setViewName(viewName);
			}
			
		} else {
			mav.addObject("pageNo", 1);
			mav.setViewName(viewName);
		}*/
		mav.addObject("productFullList", productFullList);
		return mav;
	}
	
	
	
	// 상품 조회 필터 사용시, 세션에 있는 상품정보를 확인 후 서비스로 처리하는 메소드
		public Map<String, Map<String, Object>> getFullList(@RequestParam Map<String, String> info, HttpServletRequest request) throws Exception {
			
			HttpSession session = request.getSession();
			
			// Map options에는 조회하고자 하는 조건명 main_option / sub_option / title_option / order_option 이 있으며, main_option은 반드시 포함되어야한다.
			// * main_option(main_category 설정) = value [farm / marine / meat]
			// sub_option(sub_category 설정) = value [채소/곡물/과일, 생선류/갑각류/해조류, 돼지고기/소고기/기타]
			// title_option(main_category 설정) = value [farm / marine / meat]
			// order_option(main_category 설정) = value [farm / marine / meat]
			
			Map<String, String> options = new HashMap<String, String>();
			String paramSub = info.get("sub_option");
			String paramTitle = info.get("title_option");
			String paramOrder = info.get("order_option");
			
			String sessionSub = (String) session.getAttribute("sub_option");
			String sessionTitle = (String) session.getAttribute("title_option");
			String sessionOrder = (String) session.getAttribute("order_option");

			// paramSub 검색조건이 session 혹은 param에 존재할 경우 처리
						if (paramSub != null || sessionSub != null) {
							
							// param에 조건이 있을경우
							if(paramSub != null && sessionSub == null) {
								options.put("sub_option", paramSub);
								session.setAttribute("sub_option", paramSub);
							}
							// session에 조건이 있을경우
							else if(paramSub == null && sessionSub != null) {
								options.put("sub_option", sessionSub);
							}
							// param과 session 모두에 조건이 있을경우
							else {
								// param과 session의 조건이 동일할 경우, 기존 session의 조건 전달
								if(paramSub.equals(sessionSub)) {
									options.put("sub_option", sessionSub);
								}
								// param과 session의 조건이 다를 경우, session에 set후, param 조건 전달
								else {
									options.put("sub_option", paramSub);
									session.setAttribute("sub_option", paramSub);
								}
							} 
						
						}
						// paramSub 검색조건이 session 혹은 param에 존재할 경우 처리			
						if (paramTitle != null || sessionTitle != null) {
							
							// param에 조건이 있을경우	
							if(paramTitle != null && sessionTitle == null) {
								options.put("title_option", paramTitle);
								session.setAttribute("title_option", paramTitle);
							}
							// session에 조건이 있을경우
							else if(paramTitle == null && sessionTitle != null) {
								options.put("title_option", sessionTitle);
							}
							// param과 session 모두에 조건이 있을경우
							else {
								// param과 session의 조건이 동일할 경우, 기존 session의 조건 전달
								if(paramTitle.equals(sessionTitle)) {
									options.put("title_option", sessionTitle);
								}
								// param과 session의 조건이 다를 경우, session에 set후, param 조건 전달
								else {
									options.put("title_option", paramTitle);
									session.setAttribute("title_option", paramTitle);
								}
							} 
						
						} 
						// paramSub 검색조건이 session 혹은 param에 존재할 경우 처리			
						if (paramOrder != null || sessionOrder != null) {
							
							// param에 조건이 있을경우
							if(paramOrder != null && sessionOrder == null) {
								options.put("order_option", paramOrder);
								session.setAttribute("order_option", paramOrder);
							}
							// session에 조건이 있을경우
							else if(paramOrder == null && sessionOrder != null) {
								options.put("order_option", sessionOrder);
							}
							// param과 session 모두에 조건이 있을경우
							else {
								// param과 session의 조건이 동일할 경우, 기존 session의 조건 전달
								if(paramOrder.equals(sessionOrder)) {
									options.put("order_option", sessionOrder);
								}
								// param과 session의 조건이 다를 경우, session에 set후, param 조건 전달
								else {
									options.put("order_option", paramOrder);
									session.setAttribute("order_option", paramOrder);
								}
							} 
						
						} 		
						options.put("main_option", info.get("main_option"));
						Map<String, Map<String, Object>> fullList = productService.productListToOption(options);
						
						return fullList;
					}
	
	
	
	

}
