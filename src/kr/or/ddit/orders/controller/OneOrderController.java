package kr.or.ddit.orders.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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


@WebServlet("/OneOrderController")
public class OneOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OneOrderController() {
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
		IMembershipService membershipService = MembershipServiceImpl.getInstance();
		
		String prodNo = req.getParameter("prodNo"); 
		ProductVO product = prodService.findById(prodNo);
		int prodPrice = Integer.parseInt(product.getProdPrice());
		String prodName = product.getProdName();
		
//		List<OrdersVO> findAll = orderService.findAll();
		
		String memId = req.getParameter("memId");
		String orNo = generateOrderNo();
		MemberVO member = memService.findByAdd(memId);
		String memAdd = member.getMemAdd();
		
		MembershipVO membership = membershipService.findByMemId(memId);
		String msName = membership.getMsName();
		
		int odQty = Integer.parseInt(req.getParameter("quantity"));
		int doAmount = prodPrice * odQty;
		
		double payDc = Integer.parseInt(membership.getMsDcRate()) / 100.0;   //할인율
		int prodDc = (int) (doAmount * payDc);  //할인금액
		
		
//		String payNo = "payPlz";
		
//		System.out.println("결과 >>>" + findAll);
		
		 PayVO pay = new PayVO();
		 pay.setPayNo(orNo); // 주문 번호를 결제 번호로 사용
		 pay.setPayPrice(String.valueOf(doAmount));
		 pay.setPayDc(String.valueOf(prodDc));
		 pay.setPayAmount(String.valueOf(doAmount - prodDc));
		 pay.setPayDate(new Date());
		 payService.insert(pay);
		
		OrdersVO orders = new OrdersVO();
		orders.setOrNo(orNo);
		orders.setOrDate(new Date());
		orders.setOrAdd(memAdd);
		orders.setMemId(memId);
		orders.setPayNo(orNo);
		orderService.insert(orders);
		
		OrDetailVO orDetail = new OrDetailVO();
		orDetail.setOrNo(orNo);
		orDetail.setProdNo(prodNo);
		orDetail.setOdQty(odQty);
		orDetail.setDoAmount(String.valueOf(doAmount));
		orDetailService.insert(orDetail);
		
		System.out.println("결제 결과 나와라!! >>>" + pay);
		System.out.println("주문 결과 나와라!! >>>" + orders);
		System.out.println("주문 상세 결과 나와라!! >>>" + orDetail);
		
//		req.setAttribute("findAll", findAll);
		req.setAttribute("orders", orders);
		req.setAttribute("orDetail", orDetail);
		req.setAttribute("pay", pay);
		req.setAttribute("pv", product);
		req.getRequestDispatcher("pay.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
