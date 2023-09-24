package kr.or.ddit.comm.service;

import java.io.File;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import kr.or.ddit.comm.dao.AtchFileDaoImpl;
import kr.or.ddit.comm.dao.IAtchFileDao;
import kr.or.ddit.comm.vo.AtchFileVO;

public class AtchFileServiceImpl implements IAtchFileService {

	private static final String UPLOAD_DIR = "images";
	
	private IAtchFileDao atchFileDao;
	
	private static IAtchFileService atchFileService = new AtchFileServiceImpl();

	private AtchFileServiceImpl() {
		atchFileDao = AtchFileDaoImpl.getInstance();
	}
	
	public static IAtchFileService getInstance() {
		return atchFileService;
	}
	
	@Override
	public AtchFileVO saveAtchFileList(HttpServletRequest req) throws Exception {
		// 웹애플리케이션 루트 디렉토리 기준 업로드 경로 설정하기
		//	String uploadPath = req.getServletContext().getRealPath("/")
		//		+ UPLOAD_DIR;
		String uploadPath = req.getServletContext().getRealPath("/") + UPLOAD_DIR;
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		AtchFileVO atchFileVO = null;
		
		boolean isFirstFile = true; // 첫번째 파일 여부
		
//		String prodNo = (String) req.getAttribute("prodNo");
		
		for (Part part : req.getParts()) {
			
			String fileName = getFileName(part);
			
			if (fileName != null && !fileName.equals("")) { // 파일인 경우...
				
				if (isFirstFile) { // 첫번째 파일정보에 접근하기
					isFirstFile = false;
					
					// 파일 기본정보 저장하기
					atchFileVO = new AtchFileVO();
					
					// atchFileVO에 atchFileId가 저장된다.
					atchFileDao.insertAtchFile(atchFileVO);
				}
				
				String originFileName = fileName; // 원본파일명
				long fileSize = part.getSize(); // 파일 크기
				String saveFileName = ""; // 저장파일명
				String saveFilePath = ""; // 저장파일경로
				// File storeFile = null; // 저장 파일 객체
				
				// 저장파일명 추출
				saveFileName = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 10);
				
				// 확장자명 추출
				String fileExtension = 
						originFileName.lastIndexOf(".") < 0 ? "" 
								: originFileName.substring(
										originFileName.lastIndexOf(".") + 1);
				
				saveFilePath = uploadPath + File.separator + saveFileName + "." + fileExtension;

				// 업로드파일(원본파일) 저장
				part.write(saveFilePath);
				
				atchFileVO.setStreFileNm(saveFileName);
				atchFileVO.setFileSize(fileSize);
				atchFileVO.setOrignlFileNm(originFileName);
				atchFileVO.setFileStreCours(saveFilePath);
				atchFileVO.setFileExtsn(fileExtension);
				
				// 파일 상세정보 저장
				atchFileDao.insertAtchFileDetail(atchFileVO);
				
				part.delete(); // 임시업로드 파일 삭제
			}
		}
		
		return atchFileVO;
	}
	
	@Override
	public List<AtchFileVO> getAtchFileList(AtchFileVO fileVO) {
		return atchFileDao.getAtchFileList(fileVO);
	}

	@Override
	public AtchFileVO getAtchFileDetail(AtchFileVO fileVO) {
		return atchFileDao.getAtchFileDetail(fileVO);
	}
	
	/**
	 * Part 정보를 파싱하여 파일이름 추출하기
	 * @param part 파일이름 추출할 Part객체
	 * @return 파일명: 파일명이 존재하지 않으면(폼필드인 경우) null 리턴함.
	 */
	private String getFileName(Part part) {
	/*
	 	Content-Disposition 헤더에 대하여...
	 	
	 	파일 업로드에서 사용되는 경우...
	 	
	 	Content-Disposition: form-data
	 	Content-Disposition: form-data; name="필드명"
	 	Content-Disposition: form-data; name="필드명"; filename="파일명"
	 */
		for (String content : 
			part.getHeader("Content-Disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf("=") + 1)
						.trim().replace("\"", "");
			}
		}
		
		return null; // filename이 없는 경우...(폼필드)
	}

}
