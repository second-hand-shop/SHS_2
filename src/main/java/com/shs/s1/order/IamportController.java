package com.shs.s1.order;

import static org.junit.Assert.assertNotNull;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shs.s1.member.MemberDTO;
import com.shs.s1.product.ProductDTO;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.siot.IamportRestClient.response.PaymentBalance;


@Controller
@RequestMapping(value = "/payment/**")
public class IamportController {
	IamportClient client;
	
	
	
	
	public IamportController() {
		this.client = this.getTestClient();
	}
	
	@Autowired	
	private OrderService orderService;
	
	
	// API key와 API Secret Key를 활용해 IamportClient 생성
	IamportClient getTestClient()  {
		String test_api_key = "7270583941255770";
		String test_api_secret = "RQqBFu1oMLtlAQh2XxBufiycvNvUaHr2xREclGA8r4u1UL4SiFnyXVKtJgnUXPWvGBH2hibInFKiqOaJ";
		return new IamportClient(test_api_key, test_api_secret);
	}
	

	
	@PostMapping("payList")
	public String getPayList(String merchant_uid,
			String name,
//			String productNum,
			Long[] productList,
			Long amount,
			Long count,
			String buyer_email,
			String buyer_name,
			String buyer_tel,
			String buyer_addr,
			String buyer_postcode,
			String orderMessage,
			HttpSession session,
			Model model) throws Exception {
		
		
//		System.out.println("merchant_uid: " + merchant_uid);
//		System.out.println("name: " + name);
//		System.out.println("productNum: " + productNum);
//		System.out.println("price: " + amount);
//		System.out.println("orderMessage: " + orderMessage);
		

		
		for(int i=0;i<productList.length;i++) {
			
		
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = (MemberDTO)session.getAttribute("member");
		AddressInfoDTO addressInfoDTO = new AddressInfoDTO();
		addressInfoDTO.setOrderNum(Long.parseLong(merchant_uid));
		addressInfoDTO.setId(memberDTO.getId());
//		addressInfoDTO.setProductNum(Long.parseLong(productNum));
		addressInfoDTO.setPrice(amount);
		addressInfoDTO.setAmount(count);
		addressInfoDTO.setName(buyer_name);
		addressInfoDTO.setZipCode(buyer_postcode);
		addressInfoDTO.setAddr(buyer_addr);
		addressInfoDTO.setPhone(buyer_tel);
		addressInfoDTO.setEmail(buyer_email);
		addressInfoDTO.setAddrMessage(orderMessage);
		addressInfoDTO.setProductNum(productList[i]);
		
		int result = orderService.setAddrInsert(addressInfoDTO); // db에 주문정보 저장
		result = orderService.setOrderInfoInert(addressInfoDTO);
		
		}
		//상품 수량 -1 해줘야하고, 상품수량이 0일경우를 더 만들어줘야함
		//배송메시지 널 가능?
		//상품이름? 상품정보랑 결제가격을 테이블, 메퍼에 추가해야될듯
		//orderInfo에도 들어가야 될듯 ,,, 고민해보자
		
		
		model.addAttribute("merchant_uid",merchant_uid);
		return "payment/pay";
	}
	
	@PostMapping("pay")
	public String getPay(String merchant_uid,
			String name,
			String productNum,
			Long amount,
			Long count,
            String buyer_email,
            String buyer_name,
            String buyer_tel,
            String buyer_addr,
            String buyer_postcode,
            String orderMessage,
            HttpSession session,
				Model model) throws Exception {
		
		
//		System.out.println("merchant_uid: " + merchant_uid);
//		System.out.println("name: " + name);
//		System.out.println("productNum: " + productNum);
//		System.out.println("price: " + amount);
//		System.out.println("orderMessage: " + orderMessage);

		
		
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = (MemberDTO)session.getAttribute("member");
		AddressInfoDTO addressInfoDTO = new AddressInfoDTO();
		addressInfoDTO.setOrderNum(Long.parseLong(merchant_uid));
		addressInfoDTO.setId(memberDTO.getId());
		addressInfoDTO.setProductNum(Long.parseLong(productNum));
		addressInfoDTO.setPrice(amount);
		addressInfoDTO.setAmount(count);
		addressInfoDTO.setName(buyer_name);
		addressInfoDTO.setZipCode(buyer_postcode);
		addressInfoDTO.setAddr(buyer_addr);
		addressInfoDTO.setPhone(buyer_tel);
		addressInfoDTO.setEmail(buyer_email);
		addressInfoDTO.setAddrMessage(orderMessage);
		
		
		int result = orderService.setAddrInsert(addressInfoDTO); // db에 주문정보 저장
		//상품 수량 -1 해줘야하고, 상품수량이 0일경우를 더 만들어줘야함
		//배송메시지 널 가능?
		//상품이름? 상품정보랑 결제가격을 테이블, 메퍼에 추가해야될듯
		//orderInfo에도 들어가야 될듯 ,,, 고민해보자
		result = orderService.setOrderInfoInert(addressInfoDTO);
		
		
		model.addAttribute("merchant_uid",merchant_uid);
		return "payment/pay";
	}
	
	
	@GetMapping("payInfo")
	public void getPayInfo(AddressInfoDTO addressInfoDTO,Model model)throws Exception {
		
		//주문번호를 받아서 디비에서 정보 받아와야함 받아와서 jsp에 뿌려주기 select
		
		
		addressInfoDTO = orderService.getAddrOne(addressInfoDTO);
		//
		model.addAttribute("dto", addressInfoDTO);
		
		
	}
	@GetMapping("payInfoList")
	public void getPayInfoList(AddressInfoDTO addressInfoDTO,Model model)throws Exception {
	
		//주문번호를 받아서 디비에서 정보 받아와야함 받아와서 jsp에 뿌려주기 select
		
		
		List<AddressInfoDTO> ar = orderService.getAddrList(addressInfoDTO);
		model.addAttribute("list", ar);

		
	}
	
	
	
	
	
	
	
	
	
}