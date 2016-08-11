package kr.co.choongang.service;

import java.util.HashMap;
import java.util.List;

import kr.co.choongang.domain.Criteria;
import kr.co.choongang.domain.QnaVO;

public interface QnaService {
	
	public List<QnaVO> qListCriteria(Criteria cri) throws Exception;
	
	public int qListCountCriteria(Criteria cri) throws Exception;
	
	public void	regist(QnaVO qBoard) throws Exception;
	
	public QnaVO read(HashMap<String, Object> map) throws Exception;
	
	public void	modify(QnaVO qBoard) throws Exception;
	
	public void remove(int id) throws Exception;
}
