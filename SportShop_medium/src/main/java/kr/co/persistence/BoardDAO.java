package kr.co.persistence;

import java.util.List;

import kr.co.domain.BoardVO;
import kr.co.domain.Criteria;
import kr.co.domain.SearchCriteria;

public interface BoardDAO {

	public abstract void create(BoardVO vo) throws Exception;

	public abstract BoardVO read(int bno) throws Exception;

	public abstract List<BoardVO> listAll() throws Exception;

	public abstract void delete(int bno) throws Exception;

	public abstract void update(BoardVO vo) throws Exception;
	
	public abstract int getBno() throws Exception;
	
	public abstract void addViewCnt(int bno) throws Exception;
	
	public abstract List<BoardVO> listPage(int page) throws Exception;
	
	public abstract List<BoardVO> listCriteria(Criteria cri,String orderType) throws Exception;
	
	public abstract int totalCount() throws Exception;
	
	public abstract int listSearchCount(SearchCriteria cri) throws Exception;
	
	public abstract List<BoardVO> listSearch(SearchCriteria cri,String orderType) throws Exception;
	
	
	public abstract void updateReplyCnt(int bno, int amount) throws Exception;
		
/*	public abstract void getReplyCnt() throws Exception;*/
	
	/*fullName - 업로드 폴더의 UUID*/
	public abstract void addAttach(String fullName, int bno) throws Exception;
	
	public abstract List<String> getAttach(int bno) throws Exception;
	
	
	//수정시 파일 지우기.
	//public abstract void deleteAttach(String fullname) throws Exception;
	
	public abstract void deleteAllAttach(int bno) throws Exception;
	
	
	
	public abstract void deleteAttach(String fullName, int bno) throws Exception;
	
	
	//public abstract List<BoardVO> listOrder(OrderCriteria cri) throws Exception;
	

}
