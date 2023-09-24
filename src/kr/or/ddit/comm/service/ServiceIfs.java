package kr.or.ddit.comm.service;

import java.util.List;

public interface ServiceIfs<T> {
	/**
	 * 전체목록조회
	 * @return 전체목록리스트
	 */
	List<T> findAll(); // select * from club
	
	/**
	 * 특정데이터조회
	 * @param id : 특정데이터를 조회할 수 있는 아이디(PK)
	 * @return 특정데이터
	 */
	T findById(String id); // select * from club where cb_no = ''
	
	/**
	 * 데이터삽입
	 * @param obj : DB에 넣을 데이터가 들어있는 객체
	 * @return DB 삽입작업이 성공하면 1 이상의 값이 반환되고 실패하면 0이 반환된다.
	 */
	int insert(T obj); // insert into club (cb_no, cb_name, cb_manager) values ('', '', '')
	
	/**
	 * 데이터수정
	 * @param obj : DB에 넣을 데이터가 들어있는 객체
	 * @return DB 수정작업이 성공하면 1 이상의 값이 반환되고 실패하면 0이 반환된다.
	 */
	int update(T obj); // update club set cb_name = '', cb_manager = '' where cb_no = '';
	
	/**
	 * 데이터삭제
	 * @param id : 특정데이터를 삭제할 수 있는 아이디(PK)
	 * @return 삭제작업이 성공하면 1, 실패하면 0 리턴함.
	 */
	int deleteById(String id); // delete from club where cb_no = ''
}