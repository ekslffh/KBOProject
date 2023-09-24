package kr.or.ddit.comm.dao;

import java.util.List;
import kr.or.ddit.comm.vo.AtchFileVO;

public interface IAtchFileDao {
	
	/**
	 * 첨부파일 저장
	 * @param fileVO
	 * @return
	 */
	public int insertAtchFile(AtchFileVO fileVO);
	
	/**
	 * 첨부파일 세부정보 저장
	 * @param fileVO
	 * @return
	 */
	public int insertAtchFileDetail(AtchFileVO fileVO);
	
	/**
	 * 첨부파일 목록 조회하기
	 * @param fileVO
	 * @return
	 */
	public List<AtchFileVO> getAtchFileList(AtchFileVO fileVO);
	
	/**
	 * 첨부파일 세부정보 조회
	 * @param fileVO
	 * @return
	 */
	public AtchFileVO getAtchFileDetail(AtchFileVO fileVO);

}
