package kr.or.ddit.basic;

import java.util.List;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

public class ServiceTest {
	public static void main(String[] args) {
		
		IMemberService memberService = MemberServiceImpl.getInstance();
		
		List<MemberVO> memList = memberService.findAll();
		
		for (MemberVO mv : memList) {
			System.out.println(mv);
		}
		
		
	}
}
