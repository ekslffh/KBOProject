package kr.or.ddit.wishList.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import kr.or.ddit.cart.vo.CartVO;
import kr.or.ddit.comm.service.ServiceIfs;
import kr.or.ddit.wishList.vo.WishListVO;

public interface IWishListService{

	int insert(WishListVO wv);

	int delete(WishListVO wv);

	List<WishListVO> findAll();
	
	Date findByWish(Map<String, String>wishMap);
	
	WishListVO findByProd(Map<String, String> wishMap);
}
