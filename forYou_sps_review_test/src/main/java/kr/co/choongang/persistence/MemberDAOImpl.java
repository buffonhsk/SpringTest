package kr.co.choongang.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.choongang.domain.MemberVO;
import kr.co.choongang.dto.LoginDTO;



@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "kr.co.choongang.mapper.MemberMapper";
	

	@Override
	public void insertMember(MemberVO vo) {
		sqlSession.insert(namespace + ".insertMember", vo);
		
	}

	@Override
	public MemberVO readMember(int mNo) throws Exception {
		
		return sqlSession.selectOne(namespace + ".readMember", mNo);
	}

	@Override
	public void updateMember(MemberVO vo) throws Exception {
		sqlSession.update(namespace + ".updateMember", vo);
		
	}

	@Override
	public void delete(int mNo) throws Exception {
		sqlSession.delete(namespace + ".deleteMember", mNo);
		
	}

	@Override
	public int chkMbId(String userid) throws Exception {
		
		return sqlSession.selectOne(namespace + ".chkMbId", userid);
	}
	
	@Override
	public int chkMbEmail(String email) throws Exception {
		
		return sqlSession.selectOne(namespace + ".chkMbEmail", email);
	}

	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		
		return sqlSession.selectOne(namespace + ".login", dto);
	}
	
}
