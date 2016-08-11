package kr.co.choongang.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.choongang.domain.Criteria;
import kr.co.choongang.domain.QnaVO;
import kr.co.choongang.persistence.QnaDAO;

@Service
public class QnaServiceImpl implements QnaService {

	@Inject
	private QnaDAO dao;
	
	@Override
	public List<QnaVO> qListCriteria(Criteria cri) throws Exception {
		
		return dao.qListCriteria(cri);
	}

	@Override
	public int qListCountCriteria(Criteria cri) throws Exception {
		
		return dao.qListCountCriteria(cri);
	}

	@Override
	public void regist(QnaVO qBoard) throws Exception {
		dao.regist(qBoard);

	}

	@Override
	public QnaVO read(HashMap<String, Object> map) throws Exception {
		
		return dao.read(map);
	}

	@Override
	public void modify(QnaVO qBoard) throws Exception {
		dao.modify(qBoard);

	}

	@Override
	public void remove(int id) throws Exception {
		dao.remove(id);

	}

}
