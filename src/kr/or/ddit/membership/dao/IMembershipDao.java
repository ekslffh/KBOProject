package kr.or.ddit.membership.dao;

import kr.or.ddit.comm.dao.DaoIfs;
import kr.or.ddit.membership.vo.MembershipVO;

public interface IMembershipDao extends DaoIfs<MembershipVO> {

	/**
	 * 특정 멤버의 등급정보 가져오기
	 * @return 특정 멤버의 등급정보
	 */
	MembershipVO findByMemId(String memId);
}
