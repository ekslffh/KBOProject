package kr.or.ddit.match.service;

import java.util.List;

import kr.or.ddit.comm.service.ServiceIfs;
import kr.or.ddit.match.vo.MatchVO;

public interface IMatchService extends ServiceIfs<MatchVO>{
	List<MatchVO> findDetail(String cbNo);
}
