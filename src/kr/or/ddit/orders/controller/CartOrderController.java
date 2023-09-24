package kr.or.ddit.orders.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cart.vo.CartVO;
import kr.or.ddit.cartProd.dto.cartProdDto;
import kr.or.ddit.cartProd.service.CartProdServiceImpl;
import kr.or.ddit.cartProd.service.ICartProdService;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.membership.service.IMembershipService;
import kr.or.ddit.membership.service.MembershipServiceImpl;
import kr.or.ddit.membership.vo.MembershipVO;
import kr.or.ddit.orders.service.IOrdersService;
import kr.or.ddit.orders.service.OrderServiceImpl;
import kr.or.ddit.orders.vo.OrdersVO;
import kr.or.ddit.ordetail.service.IOrDetailService;
import kr.or.ddit.ordetail.service.OrDetailServiceImpl;
import kr.or.ddit.ordetail.vo.OrDetailVO;
import kr.or.ddit.pay.service.IPayService;
import kr.or.ddit.pay.service.PayServiceImpl;
import kr.or.ddit.pay.vo.PayVO;
import kr.or.ddit.product.service.IProductService;
import kr.or.ddit.product.service.ProductServiceImpl;
import kr.or.ddit.product.vo.ProductVO;


@WebServlet("/CartOrderController")
public class CartOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CartOrderController() {
        super();
    }
    
    public String generateOrderNo() {
        UUID uuid = UUID.randomUUID();
        String rndNum = uuid.toString().replace("-", "").substring(0, 4);
        
        // 현재 날짜를 가져옴
        LocalDate currentDate = LocalDate.now();
        // 날짜 형식을 지정
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMdd");
        // 형식에 맞게 날짜를 문자열로 변환
        String formattedDate = currentDate.format(formatter);
        
        String orderNo = "OR" + formattedDate + rndNum;
        return orderNo;
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IOrdersService orderService = OrderServiceImpl.getInstance();
		IPayService payService = PayServiceImpl.getInstance();
		IProductService prodService = ProductServiceImpl.getInstance();
		IMemberService memService = MemberServiceImpl.getInstance();
		IOrDetailService orDetailService = OrDetailServiceImpl.getInstance();
		ICartProdService cartProdService = CartProdServiceImpl.getInstance();
		IMembershipService membershipService = MembershipServiceImpl.getInstance();
		
		
		String memId = req.getParameter("memId");
		String[] prodNos = req.getParameterValues("prodNo");
		String[] quantities = req.getParameterValues("ctQty");
		String orNo = generateOrderNo();
		MemberVO member = memService.findByAdd(memId);
		String memAdd = member.getMemAdd();
		
		MembershipVO membership = membershipService.findByMemId(memId);
		String msName = membership.getMsName();
		
		int totalPrice = 0; 
		
		
		
		List<cartProdDto> cartProd = new ArrayList<>();

		if (prodNos != null && prodNos.length > 0) {
		    for (int i = 0; i < prodNos.length; i++) {
		        String prodNo = prodNos[i];
		        int quantity = Integer.parseInt(quantities[i]);

		        ProductVO product = prodService.findById(prodNo);
		        String prodName = product.getProdName();
		        String productPrice = product.getProdPrice();
		        int prodPrice = Integer.parseInt(productPrice);
		        
		        int itemPrice = prodPrice * quantity; // 각 상품의 가격 계산
		        System.out.println("itemPrice : " + itemPrice);
	            totalPrice += itemPrice; // 총 가격 누적
		        cartProdDto cartItem = new cartProdDto();
		        
		        cartItem.setProdNo(prodNo);
		        cartItem.setProdName(prodName);
		        cartItem.setProdPrice(productPrice);
		        cartItem.setCtQty(quantity);
		        cartItem.setItemPrice(itemPrice);

		        cartProd.add(cartItem);
		        
		        
		    } 
		}
		
		double payDc = Integer.parseInt(membership.getMsDcRate()) / 100.0;   //할인율
		int prodDc = (int) (totalPrice * payDc);  //할인금액
		
		List<OrDetailVO> orDetailList = new ArrayList<>();

		for (cartProdDto cartItem : cartProd) {
		    String prodNo = cartItem.getProdNo();
		    ProductVO product = prodService.findById(prodNo);
		    String productPrice = product.getProdPrice();
		    int prodPrice = Integer.parseInt(productPrice);
		    int doAmount = prodPrice * cartItem.getCtQty();

		    OrDetailVO orDetail = new OrDetailVO();
		    orDetail.setOrNo(orNo);
		    orDetail.setProdNo(prodNo);
		    orDetail.setOdQty(cartItem.getCtQty());
		    orDetail.setDoAmount(String.valueOf(doAmount));
		    orDetailList.add(orDetail);
		}

		
		
		// Pay 테이블에 해당 데이터를 먼저 삽입
		PayVO pay = new PayVO();
		pay.setPayNo(orNo);
		pay.setPayPrice(String.valueOf(totalPrice)); // 전체 결제 가격 설정
		pay.setPayDc(String.valueOf(prodDc));
		pay.setPayAmount(String.valueOf(totalPrice - prodDc)); // 결제 금액에서 할인 금액 차감
		pay.setPayDate(new Date());
		payService.insert(pay);

		// Orders 테이블에 저장
		OrdersVO orders = new OrdersVO();
		orders.setOrNo(orNo);
		orders.setOrDate(new Date());
		orders.setOrAdd(memAdd);
		orders.setMemId(memId);
		orders.setPayNo(orNo);
		orderService.insert(orders);

		// OrDetail 테이블에 저장
	    for (OrDetailVO orDetail : orDetailList) {
	        orDetailService.insert(orDetail);
	    }
		
	    System.out.println(Arrays.toString(prodNos));
	    System.out.println("주문 상세 결과 나와라!! >>>" + orDetailList);
		System.out.println("결제 결과 나와라!! >>>" + pay);
		System.out.println("주문 결과 나와라!! >>>" + orders);
		
//		req.setAttribute("findAll", findAll);
		req.setAttribute("orders", orders);
		req.setAttribute("orDetail", orDetailList);
		req.setAttribute("pay", pay);
		req.setAttribute("cartProd", cartProd);
		req.getRequestDispatcher("cartPay.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
