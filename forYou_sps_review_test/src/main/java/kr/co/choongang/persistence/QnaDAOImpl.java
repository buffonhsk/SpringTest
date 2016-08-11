package kr.co.choongang.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.choongang.domain.Criteria;
import kr.co.choongang.domain.QnaVO;

@Repository
public class QnaDAOImpl implements QnaDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "kr.co.choongang.mapper.QnaMapper";
	
	@Override
	public List<QnaVO> qListCriteria(Criteria cri) throws Exception {
		
		return session.selectList(namespace + ".qListCriteria", cri);
	}

	@Override
	public int qListCountCriteria(Criteria cri) throws Exception {
		
		return session.selectOne(namespace + ".qListCountCriteria", cri);
	}

	@Override
	public void regist(QnaVO qBoard) throws Exception {
		session.insert(namespace + ".create", qBoard);

	}

	@Override
	public QnaVO read(HashMap<String, Object> map) throws Exception {
		
		return session.selectOne(namespace + ".readBoard", map);
	}

	@Override
	public void modify(QnaVO qBoard) throws Exception {
		session.update(namespace + ".updateBoard", qBoard);

	}

	@Override
	public void remove(int id) throws Exception {
		session.delete(namespace + ".deleteBoard", id);

	}

}
