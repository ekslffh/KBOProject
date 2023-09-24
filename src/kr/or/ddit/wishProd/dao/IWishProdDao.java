package kr.or.ddit.wishProd.dao;

import java.util.List;


import kr.or.ddit.wishProd.dto.wishProdDto;

public interface IWishProdDao {
	List<wishProdDto> getWishProdList(String memId);
}
