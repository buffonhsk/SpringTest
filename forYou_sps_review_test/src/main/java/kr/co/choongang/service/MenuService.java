package kr.co.choongang.service;

import java.util.List;

import kr.co.choongang.domain.Criteria;
import kr.co.choongang.domain.TalentBoardVO;

public interface MenuService {

	public List<TalentBoardVO> gListCriteria(Criteria cri) throws Exception;

	public int gCountPaging(Criteria cri) throws Exception;
	
	public List<TalentBoardVO> dListCriteria(Criteria cri) throws Exception;

	public int dCountPaging(Criteria cri) throws Exception;
	
	public List<TalentBoardVO> sListCriteria(Criteria cri) throws Exception;

	public int sCountPaging(Criteria cri) throws Exception;
	
	public List<TalentBoardVO> mListCriteria(Criteria cri) throws Exception;

	public int mCountPaging(Criteria cri) throws Exception;
	
	public List<TalentBoardVO> cListCriteria(Criteria cri) throws Exception;

	public int cCountPaging(Criteria cri) throws Exception;

//	평점 리스트
	public List<TalentBoardVO> sListStar(Criteria cri) throws Exception;

}
