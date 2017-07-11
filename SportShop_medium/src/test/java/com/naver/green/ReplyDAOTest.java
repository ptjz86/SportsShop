package com.naver.green;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.Criteria;
import kr.co.domain.ReplyVO;
import kr.co.persistence.ReplyDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class ReplyDAOTest {

	@Inject
	private ReplyDAO dao;

	@Test
	public void testGetRno() throws Exception {

		System.out.println("+++++++++++++++++");
		dao.getRno();
		//System.out.println();
		System.out.println("+++++++++++++++++");

	}
	
	@Test
	public void testCreate() throws Exception{
		
		ReplyVO vo = new ReplyVO(1, 1, "내용", "작성자", null, null);
		
		int rno = dao.getRno();
		
		vo.setRno(rno);
		
		dao.create(vo);
	}
	
	@Test
	public void testList() throws Exception{
		
		dao.list(1);
	}
	
	@Test
	public void testUpdate() throws Exception{
		ReplyVO vo = new ReplyVO(1, 1, "22222", "asd", null, null);
				
		dao.update(vo);
	}
	
	@Test
	public void testDelete() throws Exception{
		
		dao.delete(1);
	}
	
	@Test
	public void tesListPage() throws Exception{
		
		Criteria cri = new Criteria();
		
		
		dao.listPage(900, cri);
	}


}
