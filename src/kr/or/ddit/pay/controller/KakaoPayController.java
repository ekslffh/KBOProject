package kr.or.ddit.pay.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;


@WebServlet("/KakaoPayController")
public class KakaoPayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KakaoPayController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // 보내는 부분
            URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
            HttpURLConnection connection = (HttpURLConnection) address.openConnection(); // 서버연결
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Authorization", "KakaoAK 63bd19fc59dc0fc8b0e8cd0d4b0ab64e"); // 어드민 키
            connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
            connection.setDoOutput(true); // 서버한테 전달할게 있는지 없는지
            String parameter = "cid=TC0ONETIME" // 가맹점 코드
                    + "&partner_order_id=partner_order_id" // 가맹점 주문번호
                    + "&partner_user_id=partner_user_id" // 가맹점 회원 id
                    + "&item_name=초코파이" // 상품명
                    + "&quantity=1" // 상품 수량
                    + "&total_amount=5000" // 총 금액
                    + "&vat_amount=200" // 부가세
                    + "&tax_free_amount=0" // 상품 비과세 금액
                    + "&approval_url=http://localhost:8000/" // 결제 성공 시
                    + "&fail_url=http://localhost:8000/" // 결제 실패 시
                    + "&cancel_url=http://localhost:8000/"; // 결제 취소 시
            OutputStream send = connection.getOutputStream(); // 이제 뭔가를 를 줄 수 있다.
            DataOutputStream dataSend = new DataOutputStream(send); // 이제 데이터를 줄 수 있다.
            dataSend.writeBytes(parameter); // OutputStream은 데이터를 바이트 형식으로 주고 받기로 약속되어 있다. (형변환)
            dataSend.close(); // flush가 자동으로 호출이 되고 닫는다. (보내고 비우고 닫다)

            int result = connection.getResponseCode(); // 전송 잘 됐나 안됐나 번호를 받는다.
            InputStream receive; // 받다

            if (result == 200) {
                receive = connection.getInputStream();
            } else {
                receive = connection.getErrorStream();
            }
            // 읽는 부분
            InputStreamReader read = new InputStreamReader(receive); // 받은 것을 읽습니다.

            StringBuilder responseBuilder = new StringBuilder();
            String line;

            BufferedReader br = new BufferedReader(read);
            while ((line = br.readLine()) != null) {
                responseBuilder.append(line);
            }

            String responseString = responseBuilder.toString();
            response.getWriter().append(responseString);
            
            // JSON 문자열을 JSON 객체로 변환
            Gson gson = new Gson();
            JsonObject responseJson = gson.fromJson(responseString, JsonObject.class);

            // JSON 객체를 응답으로 반환
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print(responseJson);
            out.flush();

        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
