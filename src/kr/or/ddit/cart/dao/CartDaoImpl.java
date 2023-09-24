package kr.or.ddit.cart.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.cart.vo.CartVO;
import kr.or.ddit.comm.dao.MyBatisDao;
import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.wishList.vo.WishListVO;

public class CartDaoImpl extends MyBatisDao implements ICartDao {

	private static ICartDao cartDao;

	private CartDaoImpl() {}

	public static ICartDao getInstance() {
		if (cartDao == null) {
			cartDao = new CartDaoImpl();
		}
		return cartDao;
	}

	@Override
	public int insert(CartVO cv) {
		int cnt = insert("cart.insert", cv);
		return cnt;
	}

	@Override
	public int update(CartVO cv) {
		int cnt = update("cart.update", cv);
		return cnt;
	}

	@Override
	public int delete(CartVO cv) {
		int cnt = delete("cart.delete", cv);
		return cnt;
	}

	@Override
	public int findByCart(Map<String, String> cartMap) throws SQLException {
		return selectOne("cart.findByCart", cartMap);
	}

	@Override
	public List<CartVO> findAll() {
		List<CartVO> cartList = selectList("cartList.findAll");
		return cartList;
	}

	@Override
	public CartVO findByProd(Map<String, String> cartMap) {
		CartVO cv = selectOne("cart.findByProd", cartMap);
		return cv;
	}

}
