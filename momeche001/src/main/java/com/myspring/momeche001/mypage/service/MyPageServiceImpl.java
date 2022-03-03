package com.myspring.momeche001.mypage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.momeche001.cart.vo.CartVO;
import com.myspring.momeche001.member.vo.MemberVO;
import com.myspring.momeche001.mypage.dao.MyPageDAO;
import com.myspring.momeche001.mypage.service.MyPageService;
import com.myspring.momeche001.order.vo.OrderVO;

@Service("myPageService")
@Transactional(propagation=Propagation.REQUIRED)
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageDAO myPageDAO;
	
		
	public List<OrderVO> findMyOrderInfo(String mb_id) throws Exception{
	
		return myPageDAO.selectMyOrderInfo(mb_id);
	}
	

	public int selectCount(CartVO cartVO) throws Exception {
	
		int count = myPageDAO.selectCount(cartVO);
		return count;
	}
	
	
	// 회원정보 조회
	public List<MemberVO> findMyInfo(String mb_id) throws Exception{
		
		return myPageDAO.selectMyInfo(mb_id);
	} 
	
	// 회원정보 수정
	public MemberVO modifyMyInfo(Map mbMap) throws Exception {
		String mb_id=(String)mbMap.get("mb_id");
		myPageDAO.updateMyInfo(mbMap);
		return myPageDAO.selectMyDetailInfo(mb_id);
				
	}
	 
	public MemberVO myDetailInfo(String mb_id) throws Exception{
		return myPageDAO.selectMyDetailInfo(mb_id);
	}
	
	


}
