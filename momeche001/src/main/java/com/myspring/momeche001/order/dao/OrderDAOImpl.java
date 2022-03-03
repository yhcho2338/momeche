package com.myspring.momeche001.order.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.momeche001.cart.vo.CartVO;
import com.myspring.momeche001.order.dao.OrderDAO;
import com.myspring.momeche001.order.vo.OrderVO;

@Repository("orderDAO")
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public int insertOrderList(Map ProductMap) throws DataAccessException {
		sqlSession.insert("mapper.order.insertOrderList",ProductMap);
		return Integer.parseInt((String)ProductMap.get("result"));
	}
		
	
	@Override
	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws DataAccessException{
		List<OrderVO> orderGoodsList=new ArrayList<OrderVO>();
		orderGoodsList=(ArrayList)sqlSession.selectList("mapper.order.selectMyOrder",orderVO);
		return orderGoodsList;
	}

	@Override
	public int selectCount(CartVO cartVO) throws DataAccessException {
		int count = sqlSession.selectOne("mapper.order.cartCount", cartVO);
				
		return count;
	}

}
