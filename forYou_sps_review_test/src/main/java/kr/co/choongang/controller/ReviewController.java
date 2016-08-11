package kr.co.choongang.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.choongang.domain.Criteria;
import kr.co.choongang.domain.PageMaker;
import kr.co.choongang.domain.ReviewVO;
import kr.co.choongang.service.ReviewService;

@Controller
@RequestMapping("/reviews")
public class ReviewController {

	@Inject
	private ReviewService service;

	
	//댓글 등록
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReviewVO vo) {
		
		 System.out.println("review : ..." + vo.getComment());
		 System.out.println("review : ..." + vo.getMemberVO().getmNo());
		
		ResponseEntity<String> entity = null;
		
		try {
			
			service.addReview(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/all/{talentBoardVO.id}", method=RequestMethod.GET)
	public ResponseEntity<List<ReviewVO>> list(@PathVariable("talentBoardVO.id") Integer talentBoardVO) {
		
		
		ResponseEntity<List<ReviewVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.listReview(talentBoardVO), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//댓글 수정
	@RequestMapping(value="/{id}", method={RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("id") Integer id, @RequestBody ReviewVO vo) {
		
		ResponseEntity<String> entity = null;
		
		try {
			vo.setId(id);
			service.modifyReview(vo);
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	//댓글삭제
	@RequestMapping(value="/{id}", method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("id") Integer id) {
		
		ResponseEntity<String> entity = null;
		
		try {
			service.deleteReview(id);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	//댓글 전체 목록
	@RequestMapping(value="/{id}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(
			@PathVariable("id") Integer id, @PathVariable("page") Integer page) {
	
		System.out.println("t: ........" + id);
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			Criteria cri = new Criteria();
			cri.setPage(page);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			Map<String, Object> map = new HashMap<String, Object>();
			List<ReviewVO> list = service.listReviewPage(id, cri);
			
			map.put("list", list);

			int reviewCount = service.count(id);
			pageMaker.setTotalCount(reviewCount);
			
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
