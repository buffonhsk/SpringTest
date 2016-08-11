package kr.co.choongang.service;

import java.util.List;

import kr.co.choongang.domain.MemberVO;
import kr.co.choongang.dto.LoginDTO;


public interface MemberService {
	
	public void memberRegist(MemberVO member) throws Exception;
	
	public MemberVO memberRead(int mNo) throws Exception;
	
	public void memberModify (MemberVO vo) throws Exception;
	
	public void memberRemove (int mNo) throws Exception;
	
	public int chkMbId(String userid) throws Exception;
	
	public int chkMbEmail(String email) throws Exception;
	 
	public MemberVO login(LoginDTO dto) throws Exception;
	
//	관리자에서 보여줄듯...
//	public List<MemberVO> memberListAll() throws Exception; 
	
}
