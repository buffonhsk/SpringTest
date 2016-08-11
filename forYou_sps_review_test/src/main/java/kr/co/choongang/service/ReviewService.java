package kr.co.choongang.service;

import java.util.List;

import kr.co.choongang.domain.Criteria;
import kr.co.choongang.domain.MemberVO;
import kr.co.choongang.domain.ReviewVO;

public interface ReviewService {
	
	public void	addReview(ReviewVO vo) throws Exception;
	
	public List<ReviewVO> listReview(Integer id) throws Exception;
	
	public void modifyReview(ReviewVO vo) throws Exception;
	
	public void	deleteReview(Integer id) throws Exception;
	
	public List<ReviewVO> listReviewPage(Integer id, Criteria cri) throws Exception;
	
	public int count(Integer id) throws Exception;
}
