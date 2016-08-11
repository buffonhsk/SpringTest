package kr.co.choongang.persistence;

import java.util.HashMap;
import java.util.List;

import kr.co.choongang.domain.Criteria;
import kr.co.choongang.domain.NoteVO;
import kr.co.choongang.domain.QnaVO;

public interface NoteDAO {
	
	public List<NoteVO> nListCriteria(Criteria cri) throws Exception;
	
	public int nListCountCriteria(Criteria cri) throws Exception;
	
	public void	regist(NoteVO nBoard) throws Exception;
	
	public NoteVO read(HashMap<String, Object> map) throws Exception;
	
	public void	modify(NoteVO nBoard) throws Exception;
	
	public void remove(int id) throws Exception;
	
}
