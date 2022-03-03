package com.myspring.momeche001.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.momeche001.common.base.BaseController;
import com.myspring.momeche001.product.service.ProductService;
import com.myspring.momeche001.product.vo.ProductVO;
	
	
	@Controller("mainController")
	@EnableAspectJAutoProxy
	public class MainController extends BaseController {
		@Autowired
		private ProductService productService;
		
		
		// 메인페이지
		@RequestMapping(value= "/main/main.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
			HttpSession session;
			ModelAndView mav=new ModelAndView();
			String viewName=(String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			
			session=request.getSession();
			session.setAttribute("side_menu", "user");
			Map<String,List<ProductVO>> productMap=productService.listGoods();
			mav.addObject("productMap", productMap);
			return mav;
		}
		
		
		
}


