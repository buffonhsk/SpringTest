package kr.co.choongang.service;

import java.util.HashMap;
import java.util.List;

import kr.co.choongang.domain.Criteria;
import kr.co.choongang.domain.SearchCriteria;
import kr.co.choongang.domain.TalentBoardVO;

public interface BoardService {
	
	public void	regist(TalentBoardVO tBoard) throws Exception;
	
	public TalentBoardVO read(HashMap<String, Object> map) throws Exception;
	
	public void	modify(TalentBoardVO tBoard) throws Exception;
	
	public void remove(int id) throws Exception;
	
	public List<TalentBoardVO> listAll() throws Exception;
	
	public List<TalentBoardVO> mainNewList() throws Exception;
	
	public List<TalentBoardVO> listCriteria(Criteria cri) throws Exception;
	
	public int listCountCriteria(Criteria cri) throws Exception;
	
	public List<TalentBoardVO> tListSearchCriteria(SearchCriteria cri) throws Exception;
	
	public int tListSearchCount(SearchCriteria cri) throws Exception;
	
	public List<TalentBoardVO> totalListSearchCriteria(SearchCriteria cri) throws Exception;
	
	public int totalListSearchCount(SearchCriteria cri) throws Exception;
	
}
