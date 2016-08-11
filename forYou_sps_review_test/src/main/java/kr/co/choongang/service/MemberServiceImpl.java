package kr.co.choongang.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.choongang.domain.MemberVO;
import kr.co.choongang.dto.LoginDTO;
import kr.co.choongang.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	public MemberDAO memberDao;

	@Transactional
	@Override
	public void memberRegist(MemberVO member) throws Exception {
		memberDao.insertMember(member);
		
	}

	@Override
	public MemberVO memberRead(int mNo) throws Exception {
		
		return memberDao.readMember(mNo);
	}
	
	@Transactional
	@Override
	public void memberModify(MemberVO vo) throws Exception {
		memberDao.updateMember(vo);
		
	}
	
	@Transactional
	@Override
	public void memberRemove(int mNo) throws Exception {
		memberDao.delete(mNo);
		
	}

	@Override
	public int chkMbId(String userid) throws Exception {
		
		return memberDao.chkMbId(userid);
	}

	@Override
	public int chkMbEmail(String email) throws Exception {
		
		return memberDao.chkMbEmail(email);
	}

	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		
		return memberDao.login(dto);
	}

	
	
	

}
