package kr.co.choongang.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.choongang.domain.ShopVO;
import kr.co.choongang.persistence.CartDAO;

@Service
public class CartServiceImpl implements CartService {

	@Inject
	private CartDAO dao;
	
	@Override
	public void cartAdd(ShopVO vo) throws Exception {
		System.out.println("cartAdd service");
		dao.cartAdd(vo);
	}

	@Override
	public List<ShopVO> cartList(int mNo) throws Exception {
		
		return dao.cartList(mNo);
	}

	@Override
	public void cartRemove(int id) throws Exception {
		dao.cartRemove(id);
		
	}

	@Override
	public void cartAllRemove(int mNo) throws Exception {
		dao.cartAllRemove(mNo);
		
	}

}
