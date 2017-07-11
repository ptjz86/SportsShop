package com.naver.green;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.BoardVO;
import kr.co.domain.ProductCriteria;
import kr.co.domain.SearchCriteria;
import kr.co.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class MemberDAOTest {

	@Inject
	private BoardDAO dao;

	@Test
	public void testGetBno() throws Exception {

		System.out.println("+++++++++++++++++");
		System.out.println(dao.getBno());
		System.out.println("+++++++++++++++++");

	}

	@Test
	public void testCreate() throws Exception {
		System.out.println("########");
		BoardVO vo = new BoardVO(0,"제목1", "내용1", "user1", null, null, 0);
		int i = dao.getBno();
		vo.setBno(i);
		dao.create(vo);
		
		
		
		/*		BoardVO vo = dao.read(2);
		// 새로운 bno 값으로 세팅 
		vo.setBno(dao.getBno());
		dao.create(vo);*/

		System.out.println("########");
	}

	@Test
	public void testRead() throws Exception {

		dao.read(2);
	}

	@Test
	public void testListAll() throws Exception {
		List<BoardVO> list = dao.listAll();
		
	}

	@Test
	public void testDelete() throws Exception {
		dao.delete(3);
		dao.listAll();
	}

	@Test
	public void testUpdate() throws Exception {
		BoardVO vo = dao.read(3);
		vo.setTitle("제목3");
		vo.setContent("내용3");
		dao.update(vo);
		dao.read(3);

	}
	
	@Test
	public void testListPage() throws Exception{
		dao.listPage(1);
	}
	
	@Test
	public void testListCriteria() throws Exception{
		ProductCriteria cri=new ProductCriteria();
		cri.setPerPageNum(20);
		//dao.listCriteria(cri);
	}
	
	
	@Test
	public void testTotalCount() throws Exception{
		
		dao.totalCount();
		
	}
	
	
	@Test
	public void testListSearchCount() throws Exception{
		SearchCriteria cri = new SearchCriteria();
		cri.setKeyword("22");
		cri.setPage(1);
		cri.setPerPageNum(5);
		cri.setSearchType("writer");		
				
		dao.listSearchCount(cri);
	}
	
	
	@Test
	public void testListSearch() throws Exception{
		SearchCriteria cri = new SearchCriteria();
		cri.setKeyword("sa");
		cri.setPage(1);
		cri.setPerPageNum(5);
		cri.setSearchType("writer");
		
	//	dao.listSearch(cri);
	}

}
