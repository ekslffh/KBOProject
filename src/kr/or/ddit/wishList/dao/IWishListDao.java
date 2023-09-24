package kr.or.ddit.wishList.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import kr.or.ddit.cart.vo.CartVO;
import kr.or.ddit.comm.dao.DaoIfs;
import kr.or.ddit.wishList.vo.WishListVO;

public interface IWishListDao{
	
	public Date findByWish(Map<String, String> wishMap)throws SQLException;

	public int insert(WishListVO wv);
	
	public int delete(WishListVO wv);

	public List<WishListVO> findAll();
	
	public WishListVO findByProd(Map<String, String> wishMap);
}
