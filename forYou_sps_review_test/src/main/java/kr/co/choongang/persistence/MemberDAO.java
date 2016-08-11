package kr.co.choongang.persistence;

import kr.co.choongang.domain.MemberVO;
import kr.co.choongang.dto.LoginDTO;


public interface MemberDAO {
	
	public void insertMember(MemberVO vo);
	
	public MemberVO readMember(int mNo) throws Exception;
	
	public void updateMember(MemberVO vo) throws Exception;
	
	public void delete(int mNo) throws Exception;
	
	public int chkMbId (String userid) throws Exception;
	
	public int chkMbEmail (String email) throws Exception;
	
	public MemberVO login(LoginDTO dto) throws Exception;
	
	
	
}
