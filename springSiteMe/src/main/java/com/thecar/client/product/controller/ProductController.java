package com.thecar.client.product.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.thecar.client.login.controller.LoginController;
import com.thecar.client.product.service.ProductService;
import com.thecar.client.product.vo.ProductVO;

@Controller
@RequestMapping(value="/product")
public class ProductController {
	private Logger log = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private ProductService productService;

	/**************************************************************
	 * 상품 목록
	 **************************************************************/
	@RequestMapping(value = "/productList.do", method = RequestMethod.GET)
	public String productList(@ModelAttribute ProductVO pvo, Model model) {
		log.info("product.do get 호출 성공");
		
		List<ProductVO> productList = productService.productList(pvo);
		
		model.addAttribute("productList", productList);
		model.addAttribute("pvo", pvo);

		return "product/productList";
	}

	/**************************************************************
	 * 대여/반납 시간 지정 후 상품 검색 시 실행될 메서드
	 **************************************************************/
	@RequestMapping(value = "/product.do", method = RequestMethod.POST)
	public String productSelectList(Model model) {

	
		return "product/productList";
	}

}
