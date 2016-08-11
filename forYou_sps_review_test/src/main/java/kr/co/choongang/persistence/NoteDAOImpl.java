package kr.co.choongang.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.choongang.domain.Criteria;
import kr.co.choongang.domain.NoteVO;
import kr.co.choongang.domain.QnaVO;

@Repository
public class NoteDAOImpl implements NoteDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "kr.co.choongang.mapper.NoteMapper";
	
	@Override
	public List<NoteVO> nListCriteria(Criteria cri) throws Exception {
		
		return session.selectList(namespace + ".nListCriteria", cri);
	}

	@Override
	public int nListCountCriteria(Criteria cri) throws Exception {
		
		return session.selectOne(namespace + ".nListCountCriteria", cri);
	}

	@Override
	public void regist(NoteVO nBoard) throws Exception {
		session.insert(namespace + ".create", nBoard);

	}

	@Override
	public NoteVO read(HashMap<String, Object> map) throws Exception {
		
		return session.selectOne(namespace + ".readBoard", map);
	}

	@Override
	public void modify(NoteVO nBoard) throws Exception {
		session.update(namespace + ".updateBoard", nBoard);

	}

	@Override
	public void remove(int id) throws Exception {
		session.delete(namespace + ".deleteBoard", id);

	}

}
