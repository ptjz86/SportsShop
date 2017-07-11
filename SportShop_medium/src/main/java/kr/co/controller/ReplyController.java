package kr.co.controller;



import static org.hamcrest.CoreMatchers.describedAs;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.print.attribute.standard.PageRanges;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.domain.Criteria;
import kr.co.domain.PageMaker;
import kr.co.domain.ReplyVO;
import kr.co.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {

	@Inject
	private ReplyService service;

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
		// @RequestBody json으로 되어있는것을 문자열로

		ResponseEntity<String> entity = null;
		
		
		
	

		try {
		
			int rno = service.getRno();

			vo.setRno(rno);
			
			System.out.println(vo);
			
			service.create(vo);
			
			entity = new ResponseEntity<String>("INSERT_SUCCESS", HttpStatus.OK);
			
			System.out.println(entity);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			// 실패횄을경우
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;

	}
	
	
	@RequestMapping(value="/all/{bno}", method=RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("bno") Integer bno){
		//@PathVariable("bno")
		
		
		
		ResponseEntity<List<ReplyVO>> entity = null;
		
		List<ReplyVO> list;
		try {
			list = service.list(bno);
			System.out.println(list);
			entity= new ResponseEntity<List<ReplyVO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity= new ResponseEntity<List<ReplyVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	/*patch는 부분적으로 수정할때, PUT 
	 * PUT,PATCH, DELETE는 크롬, 사파리 에서만 가능
	 * */
	@RequestMapping(value="/{rno}", method={RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("rno") Integer rno, @RequestBody ReplyVO vo){
		ResponseEntity<String> entity = null;		
		
		vo.setRno(rno);
		try {
			service.update(vo);
			entity = new ResponseEntity<String>("UPDATE_SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}		
		
		return entity;
		
	}
	
	@RequestMapping(value="/{rno}", method=RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("rno") Integer rno){
		ResponseEntity<String> entity = null;
		
		try {
			service.delete(rno);
			entity = new ResponseEntity<String>("DELETE_SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	
	@RequestMapping(value="/{bno}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("bno") Integer bno, 
			@PathVariable("page") Integer page
			){
			
		ResponseEntity<Map<String, Object>> entity = null;
		Criteria cri = new Criteria();
		cri.setPage(page);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			List<ReplyVO> list =service.listPage(bno, cri);
			map.put("list", list);
		
			int replyCount =service.count(bno);
			pageMaker.setTotalCount(replyCount);
			map.put("pageMaker", pageMaker);
			entity = new ResponseEntity<Map<String, Object>>(
					map,HttpStatus.OK);			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
						
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
			//entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);		
		}
		
		
		
		
		
		
		return entity;
		
		
		
	}
	
	
	
	@RequestMapping(value = "/time", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public ResponseEntity<String> time(Locale locale, Model model){
	
		ResponseEntity<String> entity = null;
		
	
		try {
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			
			String formattedDate = dateFormat.format(date);
			
			entity= new ResponseEntity<String>(formattedDate, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity= new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
