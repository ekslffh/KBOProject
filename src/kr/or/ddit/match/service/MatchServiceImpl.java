package kr.or.ddit.match.service;

import java.util.List;

import kr.or.ddit.match.dao.IMatchDao;
import kr.or.ddit.match.dao.MatchDaoImpl;
import kr.or.ddit.match.vo.MatchVO;

public class MatchServiceImpl implements IMatchService{

	private IMatchDao matchDao;
	
	private static IMatchService matchService;
	
	private MatchServiceImpl() {
		matchDao = MatchDaoImpl.getInstance();
	}
	
	public static IMatchService getInstance() {
		if(matchService==null) {
			matchService = new MatchServiceImpl();
		}
		return matchService;
	}

	@Override
	public List<MatchVO> findAll() {
		return matchDao.findAll();
	}

	@Override
	public MatchVO findById(String mNo) {
		return matchDao.findById(mNo);
	}

	@Override
	public int insert(MatchVO mv) {
		int cnt = matchDao.insert(mv);
		return cnt;
	}

	@Override
	public int update(MatchVO mv) {
		return matchDao.update(mv);
	}

	@Override
	public int deleteById(String mNo) {
		return matchDao.deleteById(mNo);
	}

	@Override
	public List<MatchVO> findDetail(String cbNo) {
		return matchDao.findDetail(cbNo);
	}
}
