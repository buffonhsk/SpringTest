package kr.co.choongang.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.choongang.domain.Criteria;
import kr.co.choongang.domain.TalentBoardVO;
import kr.co.choongang.persistence.MenuDAO;

@Service
public class MenuServiceImpl implements MenuService {

	@Inject
	private MenuDAO dao;
	
	@Override
	public List<TalentBoardVO> gListCriteria(Criteria cri) throws Exception {
		
		return dao.gListCriteria(cri);
	}

	@Override
	public int gCountPaging(Criteria cri) throws Exception {
		
		return dao.gCountPaging(cri);
	}

	@Override
	public List<TalentBoardVO> dListCriteria(Criteria cri) throws Exception {
		
		return dao.dListCriteria(cri);
	}

	@Override
	public int dCountPaging(Criteria cri) throws Exception {
		
		return dao.dCountPaging(cri);
	}

	@Override
	public List<TalentBoardVO> sListCriteria(Criteria cri) throws Exception {
		
		return dao.sListCriteria(cri);
	}

	@Override
	public int sCountPaging(Criteria cri) throws Exception {
		
		return dao.sCountPaging(cri);
	}

	@Override
	public List<TalentBoardVO> mListCriteria(Criteria cri) throws Exception {
		
		return dao.mListCriteria(cri);
	}

	@Override
	public int mCountPaging(Criteria cri) throws Exception {
		
		return dao.mCountPaging(cri);
	}

	@Override
	public List<TalentBoardVO> cListCriteria(Criteria cri) throws Exception {
		
		return dao.cListCriteria(cri);
	}

	@Override
	public int cCountPaging(Criteria cri) throws Exception {
		
		return dao.cCountPaging(cri);
	}

	
//	평점 리스트
	@Override
	public List<TalentBoardVO> sListStar(Criteria cri) throws Exception {
		
		return dao.sListStar(cri);
	}

}
