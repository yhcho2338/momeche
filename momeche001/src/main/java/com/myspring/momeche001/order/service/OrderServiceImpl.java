package com.myspring.momeche001.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.momeche001.cart.vo.CartVO;
import com.myspring.momeche001.order.dao.OrderDAO;
import com.myspring.momeche001.order.service.OrderService;
import com.myspring.momeche001.order.vo.OrderVO;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderDAO orderDAO;
	
	
	@Override
	public int orderResultReturn (Map ProductMap) throws Exception{
		int result = orderDAO.insertOrderList(ProductMap);
		return result;
	}
	
	
	@Override
	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws Exception{
		List<OrderVO> orderGoodsList;
		orderGoodsList=orderDAO.listMyOrderGoods(orderVO);
		return orderGoodsList;
	}
	
	// ��ǰ�� ���� īƮ ���� ��ȸ Service
	@Override
	public int selectCount(CartVO cartVO) throws Exception {
		
		int count = orderDAO.selectCount(cartVO);

		return count;

	}

}
