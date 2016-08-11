package kr.co.choongang.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.choongang.domain.Criteria;
import kr.co.choongang.domain.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "kr.co.choongang.mapper.ReviewMapper";
	
	@Override
	public List<ReviewVO> list(Integer id) throws Exception {
		
		return session.selectList(namespace + ".list", id);
	}

	@Override
	public void create(ReviewVO vo) throws Exception {
		session.insert(namespace + ".create", vo);

	}

	@Override
	public void update(ReviewVO vo) throws Exception {
		session.update(namespace + ".update", vo);

	}

	@Override
	public void delete(Integer id) throws Exception {
		session.delete(namespace + ".delete", id);

	}

	@Override
	public List<ReviewVO> listReviewPage(Integer id, Criteria cri) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("id", id);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace + ".listReviewPage", paramMap);
	}

	@Override
	public int count(Integer id) throws Exception {
		
		return session.selectOne(namespace + ".count", id);
	}

}
