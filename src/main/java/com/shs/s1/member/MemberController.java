package com.shs.s1.member;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shs.s1.admin.coupon.CouponDTO;
import com.shs.s1.board.qna.QnaDTO;
import com.shs.s1.board.review.ReviewDTO;
import com.shs.s1.order.CartDTO;
import com.shs.s1.order.OrderInfoDTO;

@Controller
@RequestMapping("/member/**")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	
	@GetMapping("memberPwFind")
	public void memberPwFind() throws Exception {

	}

	//비밀번호 찾기
	@PostMapping("memberPwFind")
	public ModelAndView memberPwFind(MemberDTO memberDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
				
		String pw = UUID.randomUUID().toString().replace("-", ""); 
		pw = pw.substring(0, 10);
			
		System.out.println("임시비밀번호 : " + pw);
		
		memberDTO.setPw(pw); //임시비밀번호 db에 저장
		int result = memberService.memberPwUpdate(memberDTO);
		 		
		if (result > 0) {		
			session.setAttribute("member", memberDTO);
			mv.addObject("path", "./memberPwSuccess");
			mv.setViewName("common/Result");
		}
		return mv;
	}
	
	@RequestMapping("memberPwSuccess")
	public void memberPwSuccess() throws Exception {
		
	}
	
	// 약관동의
	@RequestMapping("memberJoinCheck")
	public void memberJoinCheck() throws Exception {

	}

	// 회원가입
	@GetMapping("memberJoin")
	public void memberJoin() throws Exception {

	}

	@PostMapping("memberJoin")
	public String memberJoin(MemberDTO memberDTO, Model model, HttpSession session) throws Exception {
		int result = memberService.memberJoin(memberDTO, session);

		String message = "회원가입 실패";
		String path = "./memberJoin";
		if (result > 0) {
			session.setAttribute("member", memberDTO);
			message = "회원가입 성공";
			path = "./memberSuccess";
		}
		model.addAttribute("msg", message);
		model.addAttribute("path", path);

		return "common/commonResult";
	}

	// join 후 성공했을 떄 페이지
	@GetMapping("memberSuccess")
	public void memberSuccess(MemberDTO memberDTO) throws Exception {

	}

	// id 중복확인
	@GetMapping("memberIdCheck")
	public String memberIdCheck(MemberDTO memberDTO, Model model) throws Exception {
		memberDTO = memberService.memberIdCheck(memberDTO);
		String result = "0";
		if (memberDTO == null) {
			result = "1";
		}
		model.addAttribute("result", result);
		return "common/ajaxResult";
	}

	// 로그인
	@GetMapping("memberLogin")
	public ModelAndView memberLogin() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberLogin");

		return mv;
	}

	@PostMapping("memberLogin")
	public ModelAndView memberLogin(MemberDTO memberDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		memberDTO = memberService.memberLogin(memberDTO);

		if (memberDTO != null) {
			// index 페이지로 이동
			session.setAttribute("member", memberDTO);
			mv.addObject("msg", "로그인 성공");
			mv.addObject("path", "../");
			mv.setViewName("common/commonResult");
			// mv.setViewName("redirect:../");

		} else {
			// 로그인 실패 메세지를 alert
			// 로그인 입력 폼 으로 이동
			mv.addObject("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			mv.addObject("path", "./memberLogin");
			mv.setViewName("common/commonResult");
		}
		return mv;
	}

	// 로그아웃
	@GetMapping("memberLogout")
	public String memberLogout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:../";
	}

	// 아이디 찾기
	@GetMapping("memberIdFind")
	public void memberIdFind() throws Exception {

	}

	@PostMapping("memberIdFind")
	public ModelAndView memberIdFind(MemberDTO memberDTO, ModelAndView mv) throws Exception {
		memberDTO = memberService.memberIdFind(memberDTO);
		
		if (memberDTO != null) {
			mv.addObject("msg", "회원님의 아이디는 " + memberDTO.getId() + " 입니다");
			mv.addObject("path", "./memberLogin");
			mv.setViewName("common/commonResult");
		} else {
			mv.addObject("msg", "등록된 아이디가 없습니다");
			mv.addObject("path", "./memberIdFind");
			mv.setViewName("common/commonResult");
		}
		return mv;
	}

	// 마이페이지
	@GetMapping("memberAccount")
	public void memberAccount() throws Exception {

	}

	// 회원 정보 수정
	@GetMapping("memberModify")
	public ModelAndView memberModify(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = new MemberDTO();
		
		memberDTO = (MemberDTO)session.getAttribute("member");
		
		if(memberDTO == null ) {
			mv.addObject("path", "./memberLogin");
			mv.setViewName("common/Result");
		}
		return mv;
	}

	@PostMapping("memberModify")
	public ModelAndView memberModify(MemberDTO memberDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();

		int result = memberService.memberModify(memberDTO);	
		
		if (result > 0 ) {
			session.setAttribute("member", memberDTO);
			mv.addObject("msg", "회원정보 수정 성공");
			mv.addObject("path", "../");
			mv.setViewName("common/commonResult");
		} else {
			mv.addObject("msg", "회원정보 수정 실패");
			mv.addObject("path", "./memberModify");
			mv.setViewName("common/commonResult");
		}
		return mv;
	}

	// 회원 탈퇴
	@GetMapping("memberDelete")
	public ModelAndView memberDelete(MemberDTO memberDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		memberDTO = (MemberDTO) session.getAttribute("member");

		int result = memberService.memberDelete(memberDTO, session);
		if (result > 0) {
			session.invalidate();
			mv.addObject("msg", "정상적으로 탈퇴되었습니다.");
			mv.addObject("path", "../");
			mv.setViewName("common/commonResult");
		} else {
			mv.addObject("msg", "탈퇴 실패");
			mv.addObject("path", "./memberModify");
			mv.setViewName("common/commonResult");
		}
		return mv;
	}

	//내가 쓴 글 조회
	@GetMapping("memberMyWriting")
	public ModelAndView memberMyWriting(HttpSession session) throws Exception {
		MemberDTO memberDTO = new MemberDTO();
		ModelAndView mv = new ModelAndView();
		
		memberDTO = (MemberDTO)session.getAttribute("member");
				
		List<ReviewDTO> ar = memberService.memberMyWriting(memberDTO);
		
		if(memberDTO != null ) {
			mv.addObject("list", ar); 
			mv.addObject("board","review"); 
			mv.setViewName("board/boardList");		
		} else {
			mv.setViewName("member/memberLogin");
		}			
			return mv;
	}
	
	//내가 쓴 qna 조회
	@GetMapping("memberMyQna")
	public ModelAndView memberMyQna(HttpSession session, ModelAndView mv) throws Exception {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = (MemberDTO)session.getAttribute("member");
		
		List<QnaDTO> ar = memberService.memberMyQna(memberDTO);
		
		if(memberDTO != null) {
			mv.addObject("list", ar); 
			mv.addObject("board","Qna"); 
			mv.setViewName("board/boardList");
		} else {
			mv.setViewName("member/memberLogin");
		}
		return mv;
	}
	
	
	//주문내역 조회
	@GetMapping("memberMyOrder")
	public ModelAndView memberMyOrder(HttpSession session, ModelAndView mv) throws Exception {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = (MemberDTO)session.getAttribute("member");
		
		List<OrderInfoDTO> ar = memberService.memberMyOrder(memberDTO);
		
		if(memberDTO != null) {
			mv.addObject("list", ar); 
			mv.addObject("board","ORDER"); 
			mv.setViewName("member/memberMyOrder");
		} else {
			mv.setViewName("member/memberLogin");
		}
		return mv;
	}
	
	//카트
	@GetMapping("memberMyCart")
	public ModelAndView memberMyCart(HttpSession session, ModelAndView mv) throws Exception {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = (MemberDTO)session.getAttribute("member");
		
		List<CartDTO> ar = memberService.memberMyCart(memberDTO);
		mv.addObject("list", ar);
		mv.setViewName("order/cartList");
		
		return mv;
	}
	
	//쿠폰
	@GetMapping("memberMyCoupon")
	public ModelAndView memberMyCoupon(HttpSession session, ModelAndView mv) throws Exception {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = (MemberDTO)session.getAttribute("member");
		
		List<CouponDTO> ar = memberService.memberMyCoupon(memberDTO);
		
		if(memberDTO != null) {
			mv.addObject("list", ar);
			mv.setViewName("member/memberMyCoupon");
		} else {
			mv.setViewName("member/memberLogin");
		}
				
		return mv;
	}
}
