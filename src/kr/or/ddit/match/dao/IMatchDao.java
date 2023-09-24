package kr.or.ddit.match.dao;

import java.util.List;

import kr.or.ddit.comm.dao.DaoIfs;
import kr.or.ddit.match.vo.MatchVO;

public interface IMatchDao extends DaoIfs<MatchVO>{

	List<MatchVO> findDetail(String cbNo);
	
}
