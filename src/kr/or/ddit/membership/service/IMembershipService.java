package kr.or.ddit.membership.service;

import kr.or.ddit.comm.service.ServiceIfs;
import kr.or.ddit.membership.vo.MembershipVO;

public interface IMembershipService extends ServiceIfs<MembershipVO> {

	/**
	 * 특정 멤버의 등급정보 가져오기
	 * @return 특정 멤버의 등급정보
	 */
	MembershipVO findByMemId(String memId);
}
