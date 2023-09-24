package kr.or.ddit.comm.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import kr.or.ddit.comm.vo.AtchFileVO;

public interface IAtchFileService {
	
	/**
	 * 첨부파일 목록을 저장하기 위한 메서드
	 * @param req Part정보를 꺼내기 위한 요청객체
	 * @return 첨부파일ID를 저장하고 있는 AtchFileVO객체
	 * @throws Exception 
	 */
	public AtchFileVO saveAtchFileList(HttpServletRequest req) throws Exception;
	
	/**
	 * 첨부파일 목록 조회
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
