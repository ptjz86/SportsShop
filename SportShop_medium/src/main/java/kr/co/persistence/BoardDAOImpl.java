package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.BoardVO;
import kr.co.domain.Criteria;
import kr.co.domain.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession session;
	
	private final String NAMESPACE= "kr.co.mapper.BoardMapper";

	@Override
	public void create(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		
		/*위에 메서드를 하나 더 만들어서 bno 올려주는것을 해줄꺼임.*/
		/*근데 vo를 넣어줘야하는데 bno를 넣어주는게 없음 일단 나중에*/		
		session.insert(NAMESPACE+".create", vo);

	}

	@Override
	public BoardVO read(int bno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".read", bno);
	}
	
	@Override
	public List<BoardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".listAll");
	}

	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		
		session.delete(NAMESPACE+".delete", bno);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		session.update(NAMESPACE+".update", vo);

	}

	/*새로운 bno 만들기*/
	@Override
	public int getBno() throws Exception {
		// TODO Auto-generated method stub		
		Integer maxBno=session.selectOne(NAMESPACE+".getBno");
		
		if(maxBno==null){
			maxBno=0;			
		}
		
		return maxBno+1;
	}

	@Override
	public void addViewCnt(int bno) throws Exception {
		// TODO Auto-generated method stub		
		session.update(NAMESPACE+".addviewcnt", bno);		
	}

	@Override
	public List<BoardVO> listPage(int page/*, int displayPerPageCount*/) throws Exception {
		// TODO Auto-generated method stub
			
		int displayPerPageCount = 10;	

		int startRow = (page-1)* displayPerPageCount + 1;
		int endRow = startRow+(displayPerPageCount-1);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startrow", startRow);
		map.put("endrow", endRow);
		
		return session.selectList(NAMESPACE+".listPage", map);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri,String orderType) throws Exception {
		// TODO Auto-generated method stub
		/*int startRow=cri.getStartRow();
		int endRow = cri.getEndRow();*/
		
		//		Map<"", V>
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("cri", cri);
		
		if(orderType == null){
			orderType = "order by bno desc";
		}else{
			if(orderType.equalsIgnoreCase("old")){
				orderType = "order by bno asc";			
			}else if(orderType.equalsIgnoreCase("recently")){
				orderType = "order by bno desc";
			}else if(orderType.equalsIgnoreCase("countasc")){
				orderType = "order by viewcnt asc";
			}else if(orderType.equalsIgnoreCase("countdesc")){
				orderType = "order by viewcnt desc";
			}			
		}
		
		
		
		
		System.out.println("99999999999");
		System.out.println(orderType);
		
		map.put("orderType", orderType);
		
		
		return session.selectList(NAMESPACE+".listCriteria", map);

		
	}

	@Override
	public int totalCount() throws Exception {
		// TODO Auto-generated method stub
		
		Integer i =session.selectOne(NAMESPACE+".totalCount");
		
		if(i==null){
			return 0;
		}
		
		return i;
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		Integer cnt = session.selectOne(NAMESPACE+".listSearchCount", cri);
		
		if(cnt == null){
			return 0;
		}
		
		
		return cnt;
	}

	@Override
	public List<BoardVO> listSearch(SearchCriteria cri,String orderType) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("cri", cri);
		
		if(orderType == null){
			orderType = "order by bno desc";
		}else{
			if(orderType.equalsIgnoreCase("old")){
				orderType = "order by bno asc";			
			}else if(orderType.equalsIgnoreCase("recently")){
				orderType = "order by bno desc";
			}else if(orderType.equalsIgnoreCase("countasc")){
				orderType = "order by viewcnt asc";
			}else if(orderType.equalsIgnoreCase("countdesc")){
				orderType = "order by viewcnt desc";
			}			
		}
			
		map.put("orderType", orderType);
	

		return session.selectList(NAMESPACE+".listSearch",  map);
	}

	@Override
	public void updateReplyCnt(int bno, int amount) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		
		/*amount는 replyCnt값에 더해주어야할 값임*/
		
		map.put("amount", amount);
		
		session.update(NAMESPACE+".updateReplyCnt", map);
		
	}

	@Override
	public void addAttach(String fullName, int bno) throws Exception {
		// TODO Auto-generated method stub
		
		int id= getId();
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("fullName", fullName);
		map.put("bno", bno);
		map.put("id", id);
		
		
		session.insert(NAMESPACE+".addAttach", map);
		
	}
	
	private int getId() throws Exception{		
		Integer id =session.selectOne(NAMESPACE+".getId");
		
		if(id == null){
			id =0;
		}
		
		return ++id;
	}

	@Override
	public List<String> getAttach(int bno) throws Exception {
		// TODO Auto-generated method stub		
		
		return session.selectList(NAMESPACE+".getAttach", bno);
	}

	@Override
	public void deleteAllAttach(int bno) throws Exception {
		// TODO Auto-generated method stub
		
		session.delete(NAMESPACE+".deleteAllAttach", bno);
		
	}

	@Override
	public void deleteAttach(String fullName, int bno) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fullName", fullName);
		map.put("bno", bno);
		
		session.delete(NAMESPACE+".deleteAttach", map);
		
		
	}

	

/*	@Override
	public void deleteAttach(String fullname) throws Exception {
		// TODO Auto-generated method stub
		
		session.delete(NAMESPACE+".deleteAttach", fullname);
		
	}*/

	/*@Override
	public void getReplyCnt() throws Exception {
		// TODO Auto-generated method stub
		
		session.update(NAMESPACE+".getReplyCnt");
		
	}
	*/
	

}
