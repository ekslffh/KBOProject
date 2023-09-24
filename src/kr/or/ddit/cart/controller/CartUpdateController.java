package kr.or.ddit.cart.controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import kr.or.ddit.cart.service.CartServiceImpl;
import kr.or.ddit.cart.service.ICartService;
import kr.or.ddit.cart.vo.CartVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/CartUpdateController")
public class CartUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CartUpdateController() {

    }

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] prodNoArr = req.getParameterValues("prodNo");
		String[] ctQtyArr = req.getParameterValues("ctQty");
		String memId = req.getParameter("memId");
		
		System.out.println("prodNo = " + Arrays.toString(prodNoArr));
		System.out.println("ctQtyArr : " +  Arrays.toString(ctQtyArr));
		
		Map<String, String> cartMap = new HashMap<String, String>();
		ICartService cartService = CartServiceImpl.getInstance();
		
		StringBuilder redirectUrl = new StringBuilder("CartOrderController?memId=").append(memId);
		
		for( int i=0; i<prodNoArr.length; i++) {
			
			String prodNo = prodNoArr[i];
		    String ctQty = ctQtyArr[i];
		    
		    
			cartMap.put("prodNo", prodNo);
			cartMap.put("memId", memId);
			
			CartVO cv = cartService.findByProd(cartMap);
			
			cv.setProdNo(prodNo);
//			cv.setMemId(memId);
			cv.setCtQty(Integer.parseInt(ctQty));
			
			
			cartService.update(cv);
			
			redirectUrl.append("&prodNo=").append(URLEncoder.encode(prodNo, "UTF-8"))
            .append("&ctQty=").append(URLEncoder.encode(ctQty, "UTF-8"));

		}
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();


		out.print("<script>");
		out.print("location.href='" + redirectUrl.toString() + "';");    
	    out.print("</script>");
		
		
		
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);

		
	}

}
