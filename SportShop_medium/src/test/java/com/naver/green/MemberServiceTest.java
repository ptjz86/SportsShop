package com.naver.green;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.BoardVO;
import kr.co.service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class MemberServiceTest {
	
	@Inject
	private BoardService service;
	
	@Test
	public void testListAll() throws Exception{
		service.listAll();
	}
	
	@Test
	public void testRead() throws Exception{
		service.read(1);
		
	}
	
	@Test
	public void testCreate() throws Exception{
		BoardVO vo = new BoardVO(3, "test1", "test1", "test", null, null, 0);
		service.create(vo);
		service.listAll();
	}
	
	@Test
	public void testAddViewCnt() throws Exception{
		service.addViewCnt(3);
		service.listAll();
	}
	
	@Test
	public void testUpdate() throws Exception{
		BoardVO vo = service.read(0);
		vo.setTitle("testUpdate");
		vo.setContent("testUpdate");
		service.update(vo);
	}
	
	@Test
	public void testDelete() throws Exception{
		service.delete(0);
		
	}
	
	

}
