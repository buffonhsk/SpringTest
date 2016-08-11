package kr.co.choongang.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.choongang.domain.MemberVO;
import kr.co.choongang.domain.ShopVO;
import kr.co.choongang.domain.TalentBoardVO;
import kr.co.choongang.service.CartService;

@Controller
@RequestMapping("/shop/*")
public class CartController {
	
	@Inject
	private CartService cartService;
	
	@RequestMapping("cart_add")
	public void cart_add(@RequestParam("mNo") int mNo, @RequestParam("id") int id, Model model) throws Exception{
		 
		
		System.out.println(mNo);
		MemberVO mVo = new MemberVO();
		mVo.setmNo(mNo);
		TalentBoardVO tVo = new TalentBoardVO();
		tVo.setId(id);
		ShopVO vo = new ShopVO();
		vo.setTalentBoardVO(tVo);
		vo.setMemberVO(mVo);
		
		cartService.cartAdd(vo);
		
		System.out.println("장바구니 담기 호출");
	

	}
	
	@RequestMapping("list")
	public String cart_list(@RequestParam("mNo") int mNo, Model model) throws Exception{
		
		System.out.println("mNo: " + mNo);
	   
		model.addAttribute("list", cartService.cartList(mNo));
		System.out.println("model : " + model);
		System.out.println("리스트 보이기");
		 
		return "shop/list";
	}
	
	@RequestMapping("removePage") 
	public String cart_remove(@RequestParam("id") int id, @RequestParam int mNo, RedirectAttributes rttr) throws Exception{
		
		System.out.println("id: " + id);
		System.out.println("mNo: " + mNo);
		cartService.cartRemove(id);
		System.out.println("장바구니 개별 삭제");
		rttr.addAttribute("mNo", mNo);
		
		return "redirect:/shop/list";
	}
	
	@RequestMapping("allRemovePage")
	public String all_Remove(@RequestParam int mNo, RedirectAttributes rttr) throws Exception {
		System.out.println("allRemovePage 실행");
		System.out.println("mNo : " +  mNo);
		cartService.cartAllRemove(mNo);
		rttr.addAttribute("mNo", mNo);
		
		return "redirect:/shop/list";
	}
}
