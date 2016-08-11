package kr.co.choongang.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.choongang.domain.Criteria;
import kr.co.choongang.domain.MemberVO;
import kr.co.choongang.domain.NoteVO;
import kr.co.choongang.domain.PageMaker;
import kr.co.choongang.domain.QnaVO;
import kr.co.choongang.domain.SearchCriteria;
import kr.co.choongang.service.NoteService;
import kr.co.choongang.service.QnaService;

@Controller
@RequestMapping("/note/*")
public class NoteBoardController {

	private static final Logger LOGGER = LoggerFactory.getLogger(NoteBoardController.class);

	PageMaker pageMaker = new PageMaker();

	@Inject
	private NoteService service;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		LOGGER.info(cri.toString());

		model.addAttribute("list", service.nListCriteria(cri));
		
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(service.nListCountCriteria(cri));
		model.addAttribute("pageMaker", pageMaker);
		
		// 전체 검색
//		model.addAttribute("list", service.totalListSearchCriteria(cri));
//		pageMaker.setCri(cri);
//
//		pageMaker.setTotalCount(service.tListSearchCount(cri));
//		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("id") int id, @RequestParam("userid") String userid, @ModelAttribute("cri") SearchCriteria cr, Model model) throws Exception {
		LOGGER.info(userid);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("userid", userid);
		model.addAttribute(service.read(map));
	}

	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("id") int id, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		LOGGER.info("id:................." +  id);
		service.remove(id);
		LOGGER.info("id:................." +  id);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());

		rttr.addFlashAttribute("msg", "remove");

		return "redirect:/note/list";
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPageGET(int id, String userid,@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("userid", userid);
		model.addAttribute(service.read(map));
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagePOST(NoteVO nBoard, SearchCriteria cri, RedirectAttributes rttr, HttpServletRequest request) throws Exception {

		LOGGER.info(cri.toString());

	    service.modify(nBoard);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());

		rttr.addFlashAttribute("msg", "modify");

		LOGGER.info(rttr.toString());

		return "redirect:/note/list";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET() throws Exception {
		LOGGER.info("register get..................");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(NoteVO nBoard, int mNo, RedirectAttributes rttr, HttpServletRequest request)
			throws Exception {

		LOGGER.info("register post................"); // 로그인구현하면 mNo제거 해야한다.
		LOGGER.info(nBoard.toString());
		LOGGER.info("## mNo:" + mNo);
		
		MemberVO member = new MemberVO();
		member.setmNo(mNo);
		nBoard.setMemberVO(member);

		service.regist(nBoard);

		rttr.addFlashAttribute("msg", "success");

		// return "/board/success";
		return "redirect:/note/list";
	}

}
