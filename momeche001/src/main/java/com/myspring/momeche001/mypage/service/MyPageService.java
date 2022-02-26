package com.myspring.momeche001.mypage.service;

import java.util.List;
import java.util.Map;

import com.myspring.momeche001.cart.vo.CartVO;
import com.myspring.momeche001.member.vo.MemberVO;
import com.myspring.momeche001.order.vo.OrderVO;

public interface MyPageService {
	
	public List<OrderVO> findMyOrderInfo(String mb_id) throws Exception;
	
	public int selectCount(CartVO cartVO) throws Exception;
	

	public List<MemberVO> findMyInfo(String mb_id) throws Exception;
	
	public MemberVO modifyMyInfo(Map mbMap) throws Exception;
	
	public MemberVO myDetailInfo(String mb_id) throws Exception;

}
