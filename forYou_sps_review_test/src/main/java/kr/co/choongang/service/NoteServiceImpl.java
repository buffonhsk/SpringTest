package kr.co.choongang.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.choongang.domain.Criteria;
import kr.co.choongang.domain.NoteVO;
import kr.co.choongang.persistence.NoteDAO;

@Service
public class NoteServiceImpl implements NoteService {
	
	@Inject
	private NoteDAO dao;

	@Override
	public List<NoteVO> nListCriteria(Criteria cri) throws Exception {
		
		return dao.nListCriteria(cri);
	}

	@Override
	public int nListCountCriteria(Criteria cri) throws Exception {
		
		return dao.nListCountCriteria(cri);
	}

	@Override
	public void regist(NoteVO nBoard) throws Exception {
		dao.regist(nBoard);

	}

	@Override
	public NoteVO read(HashMap<String, Object> map) throws Exception {
		
		return dao.read(map);
	}

	@Override
	public void modify(NoteVO nBoard) throws Exception {
		dao.modify(nBoard);

	}

	@Override
	public void remove(int id) throws Exception {
		dao.remove(id);

	}

}
