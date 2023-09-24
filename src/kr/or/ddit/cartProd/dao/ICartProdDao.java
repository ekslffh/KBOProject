package kr.or.ddit.cartProd.dao;

import java.util.List;

import kr.or.ddit.cartProd.dto.cartProdDto;

public interface ICartProdDao {
	List<cartProdDto> getCartProdList(String memId);

	List<cartProdDto> findAll();
}
