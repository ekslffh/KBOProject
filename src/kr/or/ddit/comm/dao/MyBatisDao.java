package kr.or.ddit.comm.dao;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import kr.or.ddit.util.MyBatisUtil;
import kr.or.ddit.wishList.vo.WishListVO;

public class MyBatisDao {

	public <T> List<T> selectList(String statement, Object parameter) {

		SqlSession session = MyBatisUtil.getInstance(true);

		List<T> list = Collections.EMPTY_LIST;

		try {
			list = session.selectList(statement, parameter);
		} catch (PersistenceException ex) {

			throw new RuntimeException("마이바티스 목록 조회중 예외발생!", ex);

		} finally {
			session.close();
		}

		return list;
	}

	public <T> List<T> selectList(String statement) {

		SqlSession session = MyBatisUtil.getInstance(true);

		List<T> list = Collections.EMPTY_LIST;

		try {
			list = session.selectList(statement);
		} catch (PersistenceException ex) {

			throw new RuntimeException("마이바티스 목록 조회중 예외발생!", ex);

		} finally {
			session.close();
		}

		return list;
	}

	public <T> T selectOne(String statement) {

		SqlSession session = MyBatisUtil.getInstance(true);

		T obj = null;
		try {
			obj = session.selectOne(statement);
		} catch (PersistenceException ex) {

			throw new RuntimeException("마이바티스 데이터 조회중 예외발생!", ex);

		} finally {
			session.close();
		}
		return obj;
	}

	public <T> T selectOne(String statement, Object parameter) {

		SqlSession session = MyBatisUtil.getInstance(true);

		T obj = null;
		try {
			obj = session.selectOne(statement, parameter);
		} catch (PersistenceException ex) {

			throw new RuntimeException("마이바티스 데이터 조회중 예외발생!", ex);

		} finally {
			session.close();
		}
		return obj;
	}

	public int insert(String statement, Object parameter) {
		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance(true);

		try {
			cnt = session.insert(statement, parameter);

			session.commit(); // 커밋

		} catch (PersistenceException ex) {

			session.rollback();
			throw new RuntimeException("마이바티스 데이터 등록중 예외발생!", ex);

		} finally {
			session.close();
		}
		return cnt;
	}

	public int update(String statement, Object parameter) {
		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance(true);

		try {
			cnt = session.insert(statement, parameter);

			session.commit(); // 커밋

		} catch (PersistenceException ex) {

			session.rollback();
			throw new RuntimeException("마이바티스 데이터 수정중 예외발생!", ex);

		} finally {
			session.close();
		}
		return cnt;
	}

	public int delete(String statement, Object parameter) {
		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance(true);

		try {
			cnt = session.delete(statement, parameter);

			session.commit(); // 커밋

		} catch (PersistenceException ex) {

			session.rollback();
			throw new RuntimeException("마이바티스 데이터 삭제중 예외발생!", ex);

		} finally {
			session.close();
		}
		return cnt;
	}


}
