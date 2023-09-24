package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.cartProd.dto.cartProdDto;
import kr.or.ddit.cartProd.service.CartProdServiceImpl;
import kr.or.ddit.cartProd.service.ICartProdService;
import kr.or.ddit.club.service.ClubServiceImpl;
import kr.or.ddit.club.service.IClubService;
import kr.or.ddit.club.vo.ClubVO;
import kr.or.ddit.member.service.ILoginService;
import kr.or.ddit.member.service.LoginServiceImpl;
import kr.or.ddit.membership.service.IMembershipService;
import kr.or.ddit.membership.service.MembershipServiceImpl;
import kr.or.ddit.membership.vo.MembershipVO;
import kr.or.ddit.orders.service.IOrdersService;
import kr.or.ddit.orders.service.OrderServiceImpl;
import kr.or.ddit.orders.vo.OrdersVO;
import kr.or.ddit.ordetail.service.IOrDetailService;
import kr.or.ddit.ordetail.service.OrDetailServiceImpl;
import kr.or.ddit.ordetail.vo.OrDetailVO;
import kr.or.ddit.product.service.IProductService;
import kr.or.ddit.product.service.ProductServiceImpl;
import kr.or.ddit.product.vo.ProductVO;

@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String mId = request.getParameter("memId");
		String mPw = request.getParameter("memPw");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memId", mId);
		map.put("memPw", mPw);

		ILoginService service = LoginServiceImpl.getInstance();
		IMembershipService membershipService = MembershipServiceImpl.getInstance();
		IClubService clubService = ClubServiceImpl.getInstance();
		IOrdersService orderService = OrderServiceImpl.getInstance();
		IOrDetailService orDetailService = OrDetailServiceImpl.getInstance();
		IProductService productService = ProductServiceImpl.getInstance();

		String loginId = service.loginChk(map);
		System.out.println("loginId : " + loginId);

		// 援щ   濡 洹몄        寃⑥    蹂 
		MembershipVO membership = membershipService.findByMemId(mId);
		ClubVO club = clubService.findById(mId);

		
		List<ProductVO> prodNo = null;
		List<OrDetailVO> orDetailList = null;
		List<OrdersVO> orderMemId = new ArrayList<>();

		if (club != null) {
		    prodNo = productService.findProdByCb(club.getCbNo());

		    orDetailList = new ArrayList<>(); 
		    for (ProductVO product : prodNo) {
		        List<OrDetailVO> orDetail = orDetailService.selectAllByProdNo(product.getProdNo());
		        orDetailList.addAll(orDetail); 
		    }

		}


		if(loginId != null) { // 濡 洹몄    깃났
			HttpSession session = request.getSession();
			session.setAttribute("loginCode", loginId);
			System.out.println("濡 洹몄    깃났");

			// 援щ      대  濡  濡 洹몄  
			if(membership.getMsName().equals("MANAGER")) {
				session.setAttribute("club", club);
				response.sendRedirect(request.getContextPath() + "/manager/index.jsp");
				session.setAttribute("memId", mId);
				session.setAttribute("prodNo", prodNo);
				session.setAttribute("orDetail", orDetailList);
				session.setAttribute("membership", membership);
				return;
			} else if (membership.getMsName().equals("ADMIN")) {
				response.sendRedirect(request.getContextPath() + "/admin");
				return;
			}
			request.getRequestDispatcher("/").forward(request, response);

			session.setAttribute("memId", mId);

			System.out.println("session : " + session);
		}else { // 濡 洹몄    ㅽ  
			//response.sendRedirect("login.html");
			request.setAttribute("loginFail", "비밀번호가 일치하지 않습니다.");

			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}