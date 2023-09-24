package kr.or.ddit.member.service;

import java.util.Map;

import kr.or.ddit.comm.service.ServiceIfs;
import kr.or.ddit.member.vo.MemberVO;

public interface IMemberService extends ServiceIfs<MemberVO> {
	boolean checkMember(String memId);
	
	public String findIdChk(Map<String, Object>map);
	public MemberVO findByAdd(String memId);
}
