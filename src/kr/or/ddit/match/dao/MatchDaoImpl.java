package kr.or.ddit.match.dao;

import java.util.List;

import kr.or.ddit.comm.dao.MyBatisDao;
import kr.or.ddit.match.vo.MatchVO;

public class MatchDaoImpl extends MyBatisDao implements IMatchDao{
	
	private static IMatchDao matchDao;
	
	public MatchDaoImpl() {}

	public static IMatchDao getInstance() {
		if(matchDao == null) {
			matchDao = new MatchDaoImpl();
		}
		return matchDao;
	}
	
	@Override
	public List<MatchVO> findAll() {
		List<MatchVO> matchList = selectList("match.findAll");
		return matchList;
		
	}

	@Override
	public MatchVO findById(String mNo) {
		MatchVO mv = selectOne("match.findBymNo", mNo);
		return mv;
	}

	@Override
	public int insert(MatchVO mv) {
		int cnt = insert("match.insert", mv);
		return cnt;
	}

	@Override
	public int update(MatchVO mv) {
		int cnt = update("match.update", mv);
		return cnt;
	}

	@Override
	public int deleteById(String mNo) {
		int cnt = delete("match.delteBymNo", mNo);
		return cnt;
	}

	@Override
	public List<MatchVO> findDetail(String cbNo) {
		List<MatchVO> matchList = selectList("match.findById", cbNo);
		return matchList;
	}

}
