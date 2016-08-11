package kr.co.choongang.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.choongang.domain.Criteria;
import kr.co.choongang.domain.TalentBoardVO;

@Repository
public class MenuDAOImpl implements MenuDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "kr.co.choongang.mapper.MenuMapper";
	
	@Override
	public List<TalentBoardVO> gListCriteria(Criteria cri) throws Exception {

		return session.selectList(namespace + ".gListCriteria", cri);
	}

	@Override
	public int gCountPaging(Criteria cri) throws Exception {

		return session.selectOne(namespace + ".gCountPaging", cri);
	}

	@Override
	public List<TalentBoardVO> dListCriteria(Criteria cri) throws Exception {
		
		return session.selectList(namespace + ".dListCriteria", cri);
	}

	@Override
	public int dCountPaging(Criteria cri) throws Exception {
		
		return session.selectOne(namespace + ".dCountPaging", cri);
	}

	@Override
	public List<TalentBoardVO> sListCriteria(Criteria cri) throws Exception {
		
		return session.selectList(namespace + ".sListCriteria", cri);
	}

	@Override
	public int sCountPaging(Criteria cri) throws Exception {
		
		return session.selectOne(namespace + ".sCountPaging", cri);
	}

	@Override
	public List<TalentBoardVO> mListCriteria(Criteria cri) throws Exception {
		
		return session.selectList(namespace + ".mListCriteria", cri);
	}

	@Override
	public int mCountPaging(Criteria cri) throws Exception {
		
		return session.selectOne(namespace + ".mCountPaging", cri);
	}

	@Override
	public List<TalentBoardVO> cListCriteria(Criteria cri) throws Exception {
		
		return session.selectList(namespace + ".cListCriteria", cri);
	}

	@Override
	public int cCountPaging(Criteria cri) throws Exception {
		
		return session.selectOne(namespace + ".cCountPaging", cri);
	}

//	평점 리스트
	
	@Override
	public List<TalentBoardVO> sListStar(Criteria cri) throws Exception {
		
		return session.selectList(namespace + ".sListStar", cri);
	}

}
