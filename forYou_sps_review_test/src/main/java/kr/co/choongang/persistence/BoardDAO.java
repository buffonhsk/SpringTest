package kr.co.choongang.persistence;

import java.util.HashMap;
import java.util.List;

import kr.co.choongang.domain.Criteria;
import kr.co.choongang.domain.SearchCriteria;
import kr.co.choongang.domain.TalentBoardVO;

public interface BoardDAO {
	
	public void create(TalentBoardVO vo) throws Exception;
	
	public TalentBoardVO read(HashMap<String, Object> map) throws Exception;
	
	public void update (TalentBoardVO vo) throws Exception;
	
	public void delete(int id) throws Exception;
	
	public List<TalentBoardVO> listAll() throws Exception;
	
	public List<TalentBoardVO> mainNewList() throws Exception;
	
	public List<TalentBoardVO> listPage(int page) throws Exception;
	
	public List<TalentBoardVO> listCriteria(Criteria cri) throws Exception;
	
	public int countPaging(Criteria cri) throws Exception;
	
	public List<TalentBoardVO> tListSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	public List<TalentBoardVO> totalListSearch(SearchCriteria cri) throws Exception;
	
	public int totalListSearchCount(SearchCriteria cri) throws Exception;
	
}
