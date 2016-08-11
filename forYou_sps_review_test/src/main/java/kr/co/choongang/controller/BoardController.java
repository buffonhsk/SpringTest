package kr.co.choongang.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.choongang.domain.Criteria;
import kr.co.choongang.domain.MemberVO;
import kr.co.choongang.domain.PageMaker;
import kr.co.choongang.domain.TalentBoardVO;
import kr.co.choongang.service.BoardService;
import kr.co.choongang.service.FileIOService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger LOGGER = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private FileIOService fileService;
	
	@Inject
	private BoardService service;
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerGET() throws Exception {
		LOGGER.info("register get..................");
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registPOST(TalentBoardVO tBoard, int mNo, RedirectAttributes rttr , HttpServletRequest request) throws Exception{
		LOGGER.info("register post................");		//로그인구현하면 mNo제거 해야한다.
		LOGGER.info(tBoard.toString());
		LOGGER.info("## mNo:" + mNo);
		LOGGER.info("## file:" + tBoard.getImage());
		
		MemberVO member = new MemberVO();
		member.setmNo(mNo);
		tBoard.setMemberVO(member);
		
		//file insert and get original file name then insert to imageName parameter
		tBoard.setImageName(fileService.saveMultiPartsFileOne(request));
		
		service.regist(tBoard);
		
		rttr.addFlashAttribute("msg", "success");
		
//		return "/board/success";
		return "redirect:/board/listAll";
	}
	
	@RequestMapping(value="/listAll", method=RequestMethod.GET)
	public void listAll(Model model) throws Exception {
		
		LOGGER.info("show listAll.................");
		model.addAttribute("list", service.listAll());
		
	}
	
	@RequestMapping(value="/listCri", method=RequestMethod.GET)
	public void listAll(Criteria cri, Model model) throws Exception {
		
		LOGGER.info("show listCri.................");
		model.addAttribute("list", service.listCriteria(cri));
		
	}
	
	@RequestMapping(value="/listPage", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		LOGGER.info(cri.toString());
	
		model.addAttribute("list", service.listCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
//		pageMaker.setTotalCount(131);
		
		pageMaker.setTotalCount(service.listCountCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void read(@RequestParam("id") int id, @RequestParam("userid") String userid, Model model) throws Exception{
		LOGGER.info("read..............");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("userid", userid);
		model.addAttribute(service.read(map));
	}
	
	@RequestMapping(value="/readPage", method=RequestMethod.GET)
	public void read(@RequestParam("id") int id, @RequestParam("userid") String userid, @ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		LOGGER.info("read..............");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("userid", userid);
		model.addAttribute(service.read(map));
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public String remove(@RequestParam("id") int id, RedirectAttributes rttr) throws Exception{
		
		service.remove(id);
		rttr.addFlashAttribute("msg", "remove");
		
		return "redirect:/board/listPage";
		
	}
	
	@RequestMapping(value="/removePage", method=RequestMethod.POST)
	public String remove(@RequestParam("id") int id, Criteria cri ,RedirectAttributes rttr) throws Exception{
		
		service.remove(id);
		rttr.addFlashAttribute("page", cri.getPage());
		rttr.addFlashAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "remove");
		
		return "redirect:/board/listPage";
		
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modifyGET(int id, String userid, Model model) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("userid", userid);
		model.addAttribute(service.read(map));
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(TalentBoardVO vo, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
		
		LOGGER.info("modify post................");
		
		
	    
		service.modify(vo);
		rttr.addFlashAttribute("msg", "modify");
		
		return "redirect:/board/listAll";
		
	}
	
	@RequestMapping(value="/modifyPage", method=RequestMethod.GET)
	public void modifyGET(@RequestParam("id") int id, @RequestParam("userid") String userid,@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("userid", userid);
		model.addAttribute(service.read(map));
		
	}
	
	@RequestMapping(value="/modifyPage", method=RequestMethod.POST)
	public String modifyPOST(TalentBoardVO vo, Criteria cri,RedirectAttributes rttr, HttpServletRequest request) throws Exception {
		
		LOGGER.info("modify post................");
	
		service.modify(vo);
		
		rttr.addFlashAttribute("page", cri.getPage());
		rttr.addFlashAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "modify");
		
		return "redirect:/board/listPage";
		
	}
	
//	//avg starCount 메인에 가지고오기.
//	@RequestMapping(value="/avgStar", method=RequestMethod.POST)
//	@ResponseBody
//	public void avgStarPOST(@RequestParam("id") int id, @RequestParam("avgStar") int avgStar ) throws Exception {
//		
//		LOGGER.info("avgStarPOST................");
//		System.out.println(" id" + id); 
//		System.out.println("avgStar" + avgStar);
//		
////		service.modify(vo);
//		
//	}
	
}
