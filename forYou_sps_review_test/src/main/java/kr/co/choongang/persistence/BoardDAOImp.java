package kr.co.choongang.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.choongang.domain.Criteria;
import kr.co.choongang.domain.SearchCriteria;
import kr.co.choongang.domain.TalentBoardVO;

@Repository
public class BoardDAOImp implements BoardDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "kr.co.choongang.mapper.BoardMapper";
	
	@Override
	public void create(TalentBoardVO vo) throws Exception {
		System.out.println("## vo in dao:" + vo);
		session.insert(namespace + ".create", vo);
		
	}

	@Override
	public TalentBoardVO read(HashMap<String, Object> map) throws Exception {
		
		return session.selectOne(namespace + ".readBoard", map);
	}

	@Override
	public void update(TalentBoardVO vo) throws Exception {
		session.update(namespace + ".updateBoard", vo);

	}

	@Override
	public void delete(int id) throws Exception {
		session.delete(namespace + ".deleteMember", id);
		
	}

	@Override
	public List<TalentBoardVO> listAll() throws Exception {
		System.out.println("comin2 listAll");
		return session.selectList(namespace + ".listAll");
	}
	
	@Override
	public List<TalentBoardVO> mainNewList() throws Exception {
		System.out.println("comin2 mainNewList");
		return session.selectList(namespace + ".mainNewList");
	}

	@Override
	public List<TalentBoardVO> listPage(int page) throws Exception {
		if (page <= 10) {
			page = 1;
		}
		page = (page - 1) * 10;
		return session.selectList(namespace + ".listPage", page);
	}

	@Override
	public List<TalentBoardVO> listCriteria(Criteria cri) throws Exception {
		
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		
		return session.selectOne(namespace + ".countPaging", cri);
	}

	@Override
	public List<TalentBoardVO> tListSearch(SearchCriteria cri) throws Exception {
		
		return session.selectList(namespace + ".tListSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return session.selectOne(namespace + ".tListSearchCount", cri);
	}

	@Override
	public List<TalentBoardVO> totalListSearch(SearchCriteria cri) throws Exception {
		
		return session.selectList(namespace + ".tatalListSearch", cri);
	}

	@Override
	public int totalListSearchCount(SearchCriteria cri) throws Exception {
	
		return session.selectOne(namespace + ".tatalListSearchCount", cri);
	}

}
