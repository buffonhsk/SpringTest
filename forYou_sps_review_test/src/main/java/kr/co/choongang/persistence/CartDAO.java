package kr.co.choongang.persistence;

import java.util.List;

import kr.co.choongang.domain.ShopVO;

public interface CartDAO {
	
	public void cartAdd(ShopVO vo) throws Exception;
	
	public List<ShopVO> cartList(int mNo) throws Exception; 

	public void cartRemove(int id) throws Exception;
	
	public void cartAllRemove(int mNo) throws Exception;
}
