package com.myspring.momeche001.cart.controller;

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

import com.myspring.momeche001.cart.service.CartService;
import com.myspring.momeche001.cart.vo.CartVO;
import com.myspring.momeche001.common.base.BaseController;
import com.myspring.momeche001.member.vo.MemberVO;

@Controller("CartController")
@RequestMapping(value="/cart")
public class CartControllerImpl extends BaseController implements CartController{
	@Autowired
	private CartService cartService;
	@Autowired
	private CartVO cartVO;
	@Autowired
	private MemberVO memberVO;
	
	@Override
	@RequestMapping(value="/myCartList.do", method=RequestMethod.GET)
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		String mb_id = memberVO.getMb_id();
		cartVO.setMb_id(mb_id);
		Map<String, List> cartMap = cartService.myCartList(cartVO);
		session.setAttribute("cartMap", cartMap);
		return mav;
	}

	@Override
	@RequestMapping(value="/addProductInCart.do", method = RequestMethod.POST, produces="application/text; charset=utf-8")
	public @ResponseBody String addProductInCart(@RequestParam("pd_id") String pd_id,
												@RequestParam("cart_count") int cart_count,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		memberVO=(MemberVO)session.getAttribute("member");
		String mb_id=memberVO.getMb_id();
		cartVO.setMb_id(mb_id);
		cartVO.setPd_id(pd_id);
		cartVO.setCart_count(cart_count);
		cartVO.setMb_id(mb_id);
		System.out.println("pd_id : "+pd_id+", mb_id : "+mb_id+"cart_count");
		
		boolean isAreadyExisted = cartService.findCartProduct(cartVO);
		System.out.println("isAreadyExisted"+isAreadyExisted);
		if(isAreadyExisted==true) {
			return "already_existed";
		}else {
			cartService.addProductInCart(cartVO);
			return "add_success";
		}
	}

	@Override
	@RequestMapping(value="/modifyCartCount.do", method = RequestMethod.POST)
	public String modifyCartCount(@RequestParam("pd_id") int pd_id, 
								  @RequestParam("cart_count") int cart_count, 
								  HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("member");
		String mb_id = memberVO.getMb_id();
		cartVO.setPd_id(mb_id);
		cartVO.setMb_id(mb_id);
		cartVO.setCart_count(cart_count);
		boolean result = cartService.modifyCartCount(cartVO);
		
		if(result == true){
			return "modify_success";
		}else {
			return "modify_failed";
		}
		
	}
	
	@Override
	@RequestMapping(value="/removeCartProduct.do", method = RequestMethod.POST)
	public ModelAndView removeCartProduct(@RequestParam("cart_num") int cart_num, 
										  HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav=new ModelAndView();
		cartService.removeCartProduct(cart_num);
		mav.setViewName("redirect:/cart/myCartList.do");
		return mav;
	}
	
	
	
	
	


}
