package kr.or.ddit.util;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

public class MessageTemplate {
	   
	   final DefaultMessageService messageService;
	   public String phoneNumber;
	   
	   public void setPhoneNumber(String phoneNumber) {
		   this.phoneNumber = phoneNumber;
	   }
	   
	   public MessageTemplate() {
	      this.messageService = NurigoApp.INSTANCE.initialize("NCS3CDJQNKS6YNXZ", "AO8BIRTEPZLKY2CMRBZ8VCY0RDPT4ASM", "https://api.solapi.com");
	   }
	   
	   public SingleMessageSentResponse sendOne(String content) {
	       Message message = new Message();
	       // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 한다.
	       // setFrom은 그대로 두고 setTo와 setText만 변경해서 실행하기
	       message.setFrom("01084819926");
	       message.setTo(phoneNumber);
	       message.setText(content);
	       
	       SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
//	       System.out.println(response);
//	       System.out.println("메시지 전송완료");

	       return response;
	   }
	   
	}