package kr.co.choongang.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.choongang.domain.Criteria;
import kr.co.choongang.domain.SearchCriteria;
import kr.co.choongang.domain.TalentBoardVO;
import kr.co.choongang.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	private BoardDAO dao;
	
	@Transactional
	@Override
	public void regist(TalentBoardVO tBoard) throws Exception {
		System.out.println("TalentsBoard: register");
		dao.create(tBoard);
	}

	@Override
	public TalentBoardVO read(HashMap<String, Object> map) throws Exception {
		 
		return dao.read(map);
	}

	@Transactional
	@Override
	public void modify(TalentBoardVO tBoard) throws Exception {
		dao.update(tBoard);
		
	}

	@Transactional
	@Override
	public void remove(int id) throws Exception {
		dao.delete(id);
		
	}
	
	@Override
	public List<TalentBoardVO> listAll() throws Exception {
		System.out.println("comin listAll");
		return dao.listAll();
	}
	
	@Override
	public List<TalentBoardVO> mainNewList() throws Exception {
		System.out.println("comin mainNewList");
		return dao.mainNewList();
	}

	
	@Override
	public List<TalentBoardVO> listCriteria(Criteria cri) throws Exception {
		
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		
		return dao.countPaging(cri);
	}

	@Override
	public List<TalentBoardVO> tListSearchCriteria(SearchCriteria cri) throws Exception {

		return dao.tListSearch(cri);
	}

	@Override
	public int tListSearchCount(SearchCriteria cri) throws Exception {
		
		return dao.listSearchCount(cri);
	}

	@Override
	public List<TalentBoardVO> totalListSearchCriteria(SearchCriteria cri) throws Exception {
		
		return dao.totalListSearch(cri);
	}

	@Override
	public int totalListSearchCount(SearchCriteria cri) throws Exception {
		
		return dao.totalListSearchCount(cri);
	}

}
