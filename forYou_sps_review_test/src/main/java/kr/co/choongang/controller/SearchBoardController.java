package kr.co.choongang.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Iterator;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.choongang.domain.MemberVO;
import kr.co.choongang.domain.PageMaker;
import kr.co.choongang.domain.SearchCriteria;
import kr.co.choongang.domain.TalentBoardVO;
import kr.co.choongang.service.BoardService;
import kr.co.choongang.service.FileIOService;

@Controller
@RequestMapping("/sboard/*")
public class SearchBoardController {

	private static final Logger LOGGER = LoggerFactory.getLogger(SearchBoardController.class);

	PageMaker pageMaker = new PageMaker();

	@Autowired
	private FileIOService fileService;
	
	@Inject
	private BoardService service;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		LOGGER.info(cri.toString());

		if (service.tListSearchCount(cri) == 0) {
			model.addAttribute("failed", "searchFailed");

			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.tListSearchCount(cri));
			model.addAttribute("pageMaker", pageMaker);
		}

		// model.addAttribute("list", service.listCriteria(cri));
		MemberVO vo = new MemberVO();
		System.out.println(vo.getUserid());
		model.addAttribute("list", service.tListSearchCriteria(cri));
		
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(service.tListSearchCount(cri));
		model.addAttribute("pageMaker", pageMaker);
		
		// 전체 검색
//		model.addAttribute("list", service.totalListSearchCriteria(cri));
//		pageMaker.setCri(cri);
//
//		pageMaker.setTotalCount(service.tListSearchCount(cri));
//		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("id") int id, @RequestParam("userid") String userid, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
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
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "remove");

		return "redirect:/sboard/list";
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPageGET(int id, String userid,@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("userid", userid);
		model.addAttribute(service.read(map));
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagePOST(TalentBoardVO tBoard, SearchCriteria cri, RedirectAttributes rttr, HttpServletRequest request) throws Exception {

		LOGGER.info(cri.toString());
		
	  //file insert and get original file name then insert to imageName parameter
	  	tBoard.setImageName(fileService.saveMultiPartsFileOne(request));
	    service.modify(tBoard);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "modify");

		LOGGER.info(rttr.toString());

		return "redirect:/sboard/list";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET() throws Exception {
		LOGGER.info("register get..................");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(TalentBoardVO tBoard, int mNo, RedirectAttributes rttr, HttpServletRequest request)
			throws Exception {

		LOGGER.info("register post................"); // 로그인구현하면 mNo제거 해야한다.
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

		// return "/board/success";
		return "redirect:/sboard/list";
	}

}
