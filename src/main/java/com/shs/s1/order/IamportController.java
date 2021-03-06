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
import com.shs.s1.product.ProductService;
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
	
	@Autowired
	private ProductService productService;
	
	
	// API key와 API Secret Key를 활용해 IamportClient 생성
	IamportClient getTestClient()  {
		String test_api_key = "7270583941255770";
		String test_api_secret = "RQqBFu1oMLtlAQh2XxBufiycvNvUaHr2xREclGA8r4u1UL4SiFnyXVKtJgnUXPWvGBH2hibInFKiqOaJ";
		return new IamportClient(test_api_key, test_api_secret);
	}
	

	
	@PostMapping("payList")
	public String getPayList(String merchant_uid,
			String name,		
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
			
		
			ProductDTO productDTO = new ProductDTO();
			productDTO.setProductNum(productList[i]);
			productDTO=productService.getSelect(productDTO);
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = (MemberDTO)session.getAttribute("member");
		AddressInfoDTO addressInfoDTO = new AddressInfoDTO();
		addressInfoDTO.setOrderNum(Long.parseLong(merchant_uid));
		addressInfoDTO.setId(memberDTO.getId());
		addressInfoDTO.setPrice(amount);
		addressInfoDTO.setAmount(count);
		addressInfoDTO.setName(buyer_name);
		addressInfoDTO.setZipCode(buyer_postcode);
		addressInfoDTO.setAddr(buyer_addr);
		addressInfoDTO.setPhone(buyer_tel);
		addressInfoDTO.setEmail(buyer_email);
		addressInfoDTO.setAddrMessage(orderMessage);
		addressInfoDTO.setProductNum(productList[i]);
		addressInfoDTO.setProductName(productDTO.getProductName());
		
		int result = orderService.setAddrInsert(addressInfoDTO); // db에 주문정보 저장
		result = orderService.setOrderInfoInert(addressInfoDTO); // orderInfo 테이블에 저장
		result=productService.setMinus(productDTO); //프로덕트 테이블 수량 감소
		}
		//수량0일경우 결제 안되게 jsp javascript 처
	
		
	
		//cart 테이블 update 및 같은 상품 카트에 담으면 수량이 올라갈수 있도록
		
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

		
		ProductDTO productDTO = new ProductDTO();
		productDTO.setProductNum(Long.parseLong(productNum));
		productDTO=productService.getSelect(productDTO);
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
		addressInfoDTO.setProductName(productDTO.getProductName());
		
		int result = orderService.setAddrInsert(addressInfoDTO); // db에 주문지 정보 저장
		result = orderService.setOrderInfoInert(addressInfoDTO); //배송추적 테이블에도 저장
		result=productService.setMinus(productDTO); //프로덕트 테이블 수량 감소
		
		
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