package com.shs.s1.member;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shs.s1.admin.coupon.CouponDTO;
import com.shs.s1.board.qna.QnaDTO;
import com.shs.s1.board.review.ReviewDTO;
import com.shs.s1.order.CartDTO;
import com.shs.s1.order.OrderInfoDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.shs.s1.member.MemberDAO.";
		
	public int memberJoin(MemberDTO memberDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"memberJoin", memberDTO);
	}
	
	public MemberDTO memberIdCheck(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"memberIdCheck", memberDTO);
	}
	
	public MemberDTO memberLogin(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"memberLogin", memberDTO);
	}
	
	public MemberDTO memberIdFind(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"memberIdFind", memberDTO);
	}
	
	public MemberDTO memberPwFind(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"memberPwFind", memberDTO);
	}
	
	public int memberPwUpdate(MemberDTO memberDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"memberPwUpdate", memberDTO);
	}
	
	public int memberModify(MemberDTO memberDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"memberModify", memberDTO);
	}
	
	public int memberDelete(MemberDTO memberDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"memberDelete", memberDTO);
	}

	public List<ReviewDTO> memberMyWriting(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"memberMyWriting", memberDTO);
	}
	
	public List<QnaDTO> memberMyQna(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"memberMyQna", memberDTO);
	}
	
	public List<OrderInfoDTO> memberMyOrder(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"memberMyOrder", memberDTO);
	}
	
	public List<CartDTO> memberMyCart(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"memberMyCart", memberDTO);
	}
	
	public List<CouponDTO> memberMyCoupon(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"memberMyCoupon", memberDTO);
	}
}
