package kr.or.ddit.comm.dao;

import java.util.List;
import kr.or.ddit.comm.vo.AtchFileVO;

public class AtchFileDaoImpl 
	extends MyBatisDao implements IAtchFileDao {

	private static IAtchFileDao atchFileDao = new AtchFileDaoImpl();
	
	private AtchFileDaoImpl() {}
	
	public static IAtchFileDao getInstance() {
		return atchFileDao;
	}
	
	@Override
	public int insertAtchFile(AtchFileVO fileVO) {
		int cnt = insert("atchFile.insertAtchFile", fileVO);
		return cnt;
	}
	
	@Override
	public int insertAtchFileDetail(AtchFileVO fileVO) {
		int cnt = insert("atchFile.insertAtchFileDetail", fileVO);
		return cnt;
	}

	@Override
	public List<AtchFileVO> getAtchFileList(AtchFileVO fileVO) {
		List<AtchFileVO> atchFileList = selectList("atchFile.getAtchFileList", fileVO);
		return atchFileList;
	}
	
	
	@Override
	public AtchFileVO getAtchFileDetail(AtchFileVO fileVO) {
		AtchFileVO atchFileVO = selectOne("atchFile.getAtchFileDetail", fileVO);
		return atchFileVO;
	}

}
