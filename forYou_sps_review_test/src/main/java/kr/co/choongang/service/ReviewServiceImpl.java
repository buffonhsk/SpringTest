package kr.co.choongang.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.choongang.domain.Criteria;
import kr.co.choongang.domain.ReviewVO;
import kr.co.choongang.persistence.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Inject
	private ReviewDAO dao;

	@Override
	public void addReview(ReviewVO vo) throws Exception {

		dao.create(vo);

	}

	@Override
	public List<ReviewVO> listReview(Integer id) throws Exception {

		return dao.list(id);
	}

	@Override
	public void modifyReview(ReviewVO vo) throws Exception {
		dao.update(vo);

	}

	@Override
	public void deleteReview(Integer id) throws Exception {
		dao.delete(id);

	}

	@Override
	public List<ReviewVO> listReviewPage(Integer id, Criteria cri) throws Exception {
		
		return dao.listReviewPage(id, cri);
	}

	@Override
	public int count(Integer id) throws Exception {
		
		return dao.count(id);
	}

}
