package com.thecar.client.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.thecar.client.product.vo.ProductVO;

@Repository
public class ProductDaoImpl implements ProductDao {
	
	@Autowired
	private SqlSession session;
	
	// 전체 차량
	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		return session.selectList("boardList", pvo);
	}

	// 예약 가능한 차량
	@Override
	public List<ProductVO> productSelctList(ProductVO pvo) {
		return null;
	}

}
