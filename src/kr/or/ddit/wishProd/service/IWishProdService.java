package kr.or.ddit.wishProd.service;

import java.util.List;

import kr.or.ddit.wishProd.dto.wishProdDto;

public interface IWishProdService {
	
	List<wishProdDto> getWishProdList(String memId);
}
