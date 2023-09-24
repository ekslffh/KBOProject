package kr.or.ddit.cart.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.cart.vo.CartVO;
import kr.or.ddit.comm.dao.DaoIfs;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.wishList.vo.WishListVO;

public interface ICartDao {
	
	public int findByCart(Map<String, String> cartMap)throws SQLException;

	public int insert(CartVO cv);
	
	public int update(CartVO cv);
	
	public int delete(CartVO cv);
	
	public List<CartVO> findAll();
	
	public CartVO findByProd(Map<String, String> cartMap);
}
