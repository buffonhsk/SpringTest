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
import kr.co.choongang.domain.PageMaker;
import kr.co.choongang.domain.QnaVO;
import kr.co.choongang.domain.SearchCriteria;
import kr.co.choongang.service.QnaService;

@Controller
@RequestMapping("/qna/*")
public class QnaBoardController {

	private static final Logger LOGGER = LoggerFactory.getLogger(QnaBoardController.class);

	PageMaker pageMaker = new PageMaker();

	@Inject
	private QnaService service;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		LOGGER.info(cri.toString());

		model.addAttribute("list", service.qListCriteria(cri));
		
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(service.qListCountCriteria(cri));
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

		return "redirect:/qna/list";
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPageGET(int id, String userid,@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("userid", userid);
		model.addAttribute(service.read(map));
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagePOST(QnaVO qBoard, SearchCriteria cri, RedirectAttributes rttr, HttpServletRequest request) throws Exception {

		LOGGER.info(cri.toString());

	    service.modify(qBoard);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());

		rttr.addFlashAttribute("msg", "modify");

		LOGGER.info(rttr.toString());

		return "redirect:/qna/list";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET() throws Exception {
		LOGGER.info("register get..................");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(QnaVO qBoard, int mNo, RedirectAttributes rttr, HttpServletRequest request)
			throws Exception {

		LOGGER.info("register post................"); // 로그인구현하면 mNo제거 해야한다.
		LOGGER.info(qBoard.toString());
		LOGGER.info("## mNo:" + mNo);
		
		MemberVO member = new MemberVO();
		member.setmNo(mNo);
		qBoard.setMemberVO(member);

		service.regist(qBoard);

		rttr.addFlashAttribute("msg", "success");

		// return "/board/success";
		return "redirect:/qna/list";
	}

}
