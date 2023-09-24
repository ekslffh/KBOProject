package kr.or.ddit.cart.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.cart.vo.CartVO;
import kr.or.ddit.comm.service.ServiceIfs;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.wishList.vo.WishListVO;

public interface ICartService{

	int insert(CartVO cv);

	int update(CartVO cv);

	int delete(CartVO cv);

	int findByCart(Map<String, String>cartMap);
	
	List<CartVO> findAll();
	
	CartVO findByProd(Map<String, String> cartMap); 

}
