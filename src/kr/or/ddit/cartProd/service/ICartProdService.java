package kr.or.ddit.cartProd.service;

import java.util.List;

import kr.or.ddit.cartProd.dto.cartProdDto;

public interface ICartProdService {
	
	List<cartProdDto> getCartProdList(String memId);

	List<cartProdDto> findAll();
}
