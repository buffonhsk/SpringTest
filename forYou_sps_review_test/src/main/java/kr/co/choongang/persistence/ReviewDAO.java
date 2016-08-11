package kr.co.choongang.persistence;

import java.util.List;

import kr.co.choongang.domain.Criteria;
import kr.co.choongang.domain.ReviewVO;

public interface ReviewDAO {
	
	public List<ReviewVO> list(Integer id) throws Exception;
	
	public void create(ReviewVO vo) throws Exception;
	
	public void update(ReviewVO vo) throws Exception;
	
	public void delete(Integer id) throws Exception;
	
	public List<ReviewVO> listReviewPage(Integer id, Criteria cri) throws Exception;
	
	public int count(Integer id) throws Exception;

}
