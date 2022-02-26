package com.myspring.momeche001.mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.momeche001.cart.vo.CartVO;
import com.myspring.momeche001.member.vo.MemberVO;
import com.myspring.momeche001.mypage.dao.MyPageDAO;
import com.myspring.momeche001.order.vo.OrderVO;



@Repository("myPageDAO")
public class MyPageDAOImpl implements MyPageDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<OrderVO> selectMyOrderInfo(String mb_id) throws DataAccessException{
		List<OrderVO> orderGoodsList=(List)sqlSession.selectList("mapper.mypage.selectMyOrderInfo",mb_id);
		return orderGoodsList;
	}	
	

	
	
	@Override
	public int selectCount(CartVO cartVO) throws DataAccessException {
		int count = sqlSession.selectOne("mapper.order.cartCount", cartVO);
				
		return count;
	}
	
	

	// 정승원 220216 회원정보
	
	// 회원정보 수정
	public void updateMyInfo(Map mbMap) throws DataAccessException {
		sqlSession.update("mapper.mypage.updateMyInfo", mbMap);
		
		
	}


	@Override
	public MemberVO selectMyDetailInfo(String mb_id) throws DataAccessException {
		MemberVO memberVO=(MemberVO)sqlSession.selectOne("mapper.mypage.selectMyDetailInfo",mb_id);
		return memberVO;
		
	}
	
	// 회원정보 조회
	@Override
	public List<MemberVO> selectMyInfo(String mb_id) throws DataAccessException{
		List<MemberVO> myInfoList=(List)sqlSession.selectList("mapper.mypage.selectMyInfo",mb_id);
		return myInfoList;
	}   
	
	// 정승원 220216 회원정보 끝
	

}
