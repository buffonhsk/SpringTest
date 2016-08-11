package kr.co.choongang.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.choongang.command.LoginCommand;
import kr.co.choongang.command.LoginCommandVaildator;
import kr.co.choongang.domain.MemberVO;
import kr.co.choongang.domain.TalentBoardVO;
import kr.co.choongang.dto.LoginDTO;
import kr.co.choongang.exception.IdPasswordNotMatchingException;
import kr.co.choongang.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	private MemberService memberService;

	@RequestMapping(value = "/memberRegist", method = RequestMethod.GET)
	public void memberRegistGET(MemberVO member, Model model) throws Exception {
		logger.info("memberRegister get.............");
	}

	@RequestMapping(value = "/memberRegist", method = RequestMethod.POST)
	public String memberRegistPOST(@Valid MemberVO member, BindingResult result, RedirectAttributes rttr ,@RequestParam String checkBtn)
			throws Exception {
        logger.info("button value is : " + checkBtn);
		logger.info("memberRegister post.............");
		logger.info(member.toString());
		logger.debug("User : {}", member);
		
		if(checkBtn.equalsIgnoreCase("")){
			logger.info("invalid button clicked..");
			return "member/memberRegist";
		}
		
		if (result.hasErrors()) {
			logger.debug("result Error................");
			List<ObjectError> err = result.getAllErrors();
			for (ObjectError objectError : err) {
				logger.debug("error : {}", objectError.getDefaultMessage());
			}
			return "member/memberRegist";
		}

		memberService.memberRegist(member);
		rttr.addFlashAttribute("msg", "success");

		// return "/member/success";
		return "redirect:/main/mainPage";

	}

	@RequestMapping(value = "/chkMbId")
	@ResponseBody
	public Map<String, String> chkMbId(String userid) throws Exception {

		Map<String, String> resultMap = new HashMap<String, String>();

		
		String result = "";
		String resultMsg = "";
		
		if (userid.length() < 4) {
			result = "failNull";
			resultMsg = "4자 이상 입력하세요.";
			System.out.println(result);
		} else {
			int resultCnt = memberService.chkMbId(userid);
			
			if (resultCnt == 0) {
				result = "success";
				resultMsg = "사용 가능한 아이디 입니다.";
			} else {
				result = "fail";
				resultMsg = "이미 사용중인 아이디 입니다.";
			}
			
		}
		

		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);

		return resultMap;
	}
	
	@RequestMapping(value="/memberInfo", method=RequestMethod.GET)
	public void read(@RequestParam("mNo") int mNo, Model model) throws Exception{
		logger.info("read..............");
		model.addAttribute(memberService.memberRead(mNo));
	}

	
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public String remove(@RequestParam("mNo") int mNo, RedirectAttributes rttr) throws Exception{
		
		memberService.memberRemove(mNo);
		rttr.addFlashAttribute("msg", "remove");
		
		return "redirect:/main/mainPage";	
	}
	
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modifyGET(int mNo, Model model) throws Exception {
		
		model.addAttribute(memberService.memberRead(mNo));
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(MemberVO vo, RedirectAttributes rttr) throws Exception {
		
		logger.info("modify post................");
		
		memberService.memberModify(vo);
		rttr.addFlashAttribute("msg", "modify");
		
		return "redirect:/main/mainPage";
		
	}
	


	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(@RequestParam("mNo") int mNo, RedirectAttributes rttr, HttpSession session) throws Exception{
		
		System.out.println("mNo: " + mNo);
		session.invalidate();
		memberService.memberRemove(mNo);
		rttr.addFlashAttribute("msg", "remove");
		
		return "redirect:/main/mainPage";
		
	}
	

}
