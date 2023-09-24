package kr.or.ddit.wishList.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import kr.or.ddit.cart.dao.CartDaoImpl;
import kr.or.ddit.cart.dao.ICartDao;
import kr.or.ddit.cart.vo.CartVO;
import kr.or.ddit.comm.dao.MyBatisDao;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.wishList.vo.WishListVO;

public class WishListDaoImpl extends MyBatisDao implements IWishListDao{

	
	private static IWishListDao wishListDao;

	private WishListDaoImpl() {}

	public static IWishListDao getInstance() {
		if (wishListDao == null) {
			wishListDao = new WishListDaoImpl();
		}
		return wishListDao;
	}
	

	@Override
	public int insert(WishListVO wv) {
		int cnt = insert("wishList.insert", wv);
		return cnt;
	}

	@Override
	public int delete(WishListVO wv) {
		int cnt = delete("wishList.delete", wv);
		return cnt;
	}

	@Override
	public List<WishListVO> findAll() {
		List<WishListVO> wishList = selectList("wishList.findAll");
		return wishList;
	}

	@Override
	public Date findByWish(Map<String, String> wishMap) throws SQLException {
		return selectOne("wishList.findByWish", wishMap);
	}

	@Override
	public WishListVO findByProd(Map<String, String> wishMap) {
		WishListVO wv = selectOne("wishList.findByProd", wishMap);
		return wv;
	}



	

}
