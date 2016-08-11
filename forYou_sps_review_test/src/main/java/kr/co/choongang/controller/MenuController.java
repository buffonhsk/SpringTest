package kr.co.choongang.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.choongang.domain.Criteria;
import kr.co.choongang.domain.PageMaker;
import kr.co.choongang.domain.SearchCriteria;
import kr.co.choongang.service.MenuService;

@Controller
@RequestMapping(value="/menu/*")
public class MenuController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(MenuController.class);

	
	@Inject
	private MenuService service;
	
	
	@RequestMapping(value="/game", method=RequestMethod.GET)
	public void listGame(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		LOGGER.info(cri.toString());
	
		model.addAttribute("list", service.gListCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.gCountPaging(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/design", method=RequestMethod.GET)
	public void listDesign(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		LOGGER.info(cri.toString());
	
		model.addAttribute("list", service.dListCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.dCountPaging(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/study", method=RequestMethod.GET)
	public void listStudy(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		LOGGER.info(cri.toString());
	
		model.addAttribute("starList", service.sListStar(cri));
		model.addAttribute("list", service.sListCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.sCountPaging(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/music", method=RequestMethod.GET)
	public void listMusic(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		LOGGER.info(cri.toString());
	
		model.addAttribute("list", service.mListCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.mCountPaging(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/cook", method=RequestMethod.GET)
	public void listCook(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		LOGGER.info(cri.toString());
	
		model.addAttribute("list", service.cListCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.cCountPaging(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
}
