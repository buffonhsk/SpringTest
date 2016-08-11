package kr.co.choongang.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.choongang.domain.MemberVO;
import kr.co.choongang.domain.TalentBoardVO;
import kr.co.choongang.dto.LoginDTO;
import kr.co.choongang.service.BoardService;
import kr.co.choongang.service.MemberService;



@Controller
@RequestMapping("/main")
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	private MemberService memberService;
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/mainPage", method=RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto, Model model){
		
		try {
			boardService.listAll();
			
		} catch (Exception e) {

			e.printStackTrace();
		}
		
		// user 
		// class
		// search 
		
		
	}
	
	@RequestMapping(value="/talents" , method=RequestMethod.GET)
	@ResponseBody
	public List<TalentBoardVO> getTaelentsList() throws Exception{
		return boardService.mainNewList();
	}

	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public void loginGET(LoginDTO dto, HttpSession session, Model model) throws Exception{
		MemberVO vo =  memberService.login(dto);
		
		if (vo == null) {
			return;
		}
		model.addAttribute("memberVO", vo);
		
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		Object obj = session.getAttribute("memberVO");
		
		if (obj != null) {
			MemberVO vo = (MemberVO) obj;
			
			session.removeAttribute("memberVO");
			session.invalidate();
			
			return "/main/mainPage";
		}
		return "/";
	}
	
	
	
}
