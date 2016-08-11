package kr.co.choongang.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.choongang.domain.ShopVO;

@Repository
public class CartImpl implements CartDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "kr.co.choongang.mapper.CartMapper";
	
	@Override
	public void cartAdd(ShopVO vo) throws Exception{
		System.out.println("cartAdd impl before");
		session.insert(namespace + ".cartAdd", vo);
		System.out.println("cartAdd impl");
	}

	@Override
	public List<ShopVO> cartList(int mNo) throws Exception {
		
		return session.selectList(namespace + ".cartList", mNo);
	}

	@Override
	public void cartRemove(int id) throws Exception {
		session.delete(namespace + ".cartRemove", id);
		
	}

	@Override
	public void cartAllRemove(int mNo) throws Exception {
		session.delete(namespace + ".cartAllRemove", mNo);
		
	}

}
