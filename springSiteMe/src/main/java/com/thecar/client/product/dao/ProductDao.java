package com.thecar.client.product.dao;

import java.util.List;

import com.thecar.client.product.vo.ProductVO;

public interface ProductDao {
	// 차량 목록
	public List<ProductVO> productList(ProductVO pvo);
	// 예약 가능 차량 목록
	public List<ProductVO> productSelctList(ProductVO pvo);
}
