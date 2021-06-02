package com.thecar.client.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thecar.client.product.dao.ProductDao;
import com.thecar.client.product.vo.ProductVO;

@Service
@Transactional
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDao productDao;
	
	//예약 Dao도 추가 해야될듯! 나중에

	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		List<ProductVO> productList = null;
		productList = productDao.productList(pvo);
		return productList;
	}

	@Override
	public List<ProductVO> productSelectList(ProductVO pvo) {
		return null;
	}

}
