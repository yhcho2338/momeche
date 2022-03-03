package com.myspring.momeche001.mypage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.momeche001.cart.vo.CartVO;
import com.myspring.momeche001.member.vo.MemberVO;
import com.myspring.momeche001.order.vo.OrderVO;

public interface MyPageDAO {

	
	public List<OrderVO> selectMyOrderInfo(String mb_id) throws DataAccessException;
	
	public int selectCount(CartVO cartVO) throws DataAccessException;
	
	public void updateMyInfo(Map mbMap) throws DataAccessException;

	public MemberVO selectMyDetailInfo(String mb_id) throws DataAccessException;
		
	public List<MemberVO> selectMyInfo(String mb_id) throws DataAccessException;
	
}
