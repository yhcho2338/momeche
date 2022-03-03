package com.myspring.momeche001.order.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.momeche001.member.vo.MemberVO;
import com.myspring.momeche001.order.service.OrderService;
import com.myspring.momeche001.order.vo.OrderVO;
import com.myspring.momeche001.product.service.ProductService;
import com.myspring.momeche001.product.vo.ProductVO;

@Controller("orderController")
@RequestMapping(value = "/order")
public class OrderControllerImpl implements OrderController {

	@Autowired
	private ProductService productService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderVO orderVO;
	@Autowired
	private MemberVO memberVO;
	

	// Order 미사용 연구중
	@Override
	@RequestMapping(value = "/*.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView order(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		return mav;
	}
	
	
	// 결제하기 구동 메소드
	@Override
	@RequestMapping(value="/addOrder.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView addOrder(@RequestParam(value="pd_id", required=false) String pd_id, @RequestParam(value="pd_price", required=false) String pd_price, HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		
		Map productMap=productService.pdDetail(pd_id);
		mav.addObject("productMap", productMap);
		ProductVO productVO = (ProductVO)productMap.get("productVO");
		mav.addObject("productVO", productVO);
		
		Boolean isLogOn=(Boolean)session.getAttribute("isLogOn");
		String action=(String)session.getAttribute("action");
		
		/*if(isLogOn==null || isLogOn==false){
			//session.setAttribute("orderInfo", _orderVO);
			//session.setAttribute("action", "/order/orderEachGoods.do");
			return new ModelAndView("redirect:/member/loginForm.do");
		}else{
			 if(action!=null && action.equals("/order/myOrderList.do")){
				orderVO=(OrderVO)session.getAttribute("orderInfo");
				session.removeAttribute("action");
			 }else {
				 orderVO=_orderVO;
			 }
		 }*/
			
		
		mav.setViewName(viewName);
	
		return mav;
	}
	
	// 결제 API 뷰 메소드
	@RequestMapping(value="/INIStdPay*.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	
	// order_tbl에 주문항목 추가 메소드
	@RequestMapping(value="/addOrderList.do" ,method={RequestMethod.POST})
	public ResponseEntity addOrderList(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String imageFileName=null;
		
		Map ProductMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			ProductMap.put(name,value);
		}
	
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int pd_id = orderService.orderResultReturn(ProductMap);

			message= "<script>";
			message += " alert('주문이 완료되었습니다.');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/admin/product/addNewPdForm.do';";
			message +=("</script>");
			
		}catch(Exception e) {
	
			message= "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요.');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/admin/product/addNewPdForm.do';";
			message +=("</script>");
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	


	@RequestMapping(value="/addOrderAllCart.do", method=RequestMethod.POST)
	public ModelAndView addOrderAllCart(@RequestParam("cart_count") String[] cart_count, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		Map cartMap = (Map)session.getAttribute("cartMap");
		List myOrderList = new ArrayList<OrderVO>();
		
		List<ProductVO> myProductList = (List<ProductVO>)cartMap.get("myProductList");
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		for(int i=0; i<cart_count.length; i++) {
			String[] cart_product = cart_count[i].split(":");
			for(int j=0; j<myProductList.size(); j++) {
				ProductVO productVO = myProductList.get(j);
				int pd_id = productVO.getPd_id();
				if(pd_id == Integer.parseInt(cart_product[0])) {
					OrderVO _orderVO = new OrderVO();
					String pd_name = productVO.getPd_name();
					int pd_price = productVO.getPd_price();
					//String pd_fileName = productVO.getPd_fileName();
					_orderVO.setPd_id(pd_id);
					_orderVO.setPd_name(pd_name);
					_orderVO.setOrder_price(pd_price);
					_orderVO.setOrder_amount(Integer.parseInt(cart_count[1]));
					myOrderList.add(_orderVO);
					break;
				}
			}
		}
		session.setAttribute("myOrderList", myOrderList);
		session.setAttribute("orderer", memberVO);
		
		return mav;
	}
	
	
}
