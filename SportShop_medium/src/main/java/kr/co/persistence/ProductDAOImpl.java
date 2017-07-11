package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.OwnerPageVO;
import kr.co.domain.ProductCriteria;
import kr.co.domain.ProductSearchCriteria;
import kr.co.domain.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO{

	@Inject
	private SqlSession session;
	
	private final String NAMESPACE= "kr.co.mapper.ProductMapper";
	
	@Override
	public void insertProduct(ProductVO vo) throws Exception {
		
		session.insert(NAMESPACE+".insertProduct", vo);
	}

	@Override
	public int getPno() throws Exception {
		// TODO Auto-generated method stub
		 Integer maxPno = session.selectOne(NAMESPACE+".getPno");
		
		 if (maxPno == null) {
			maxPno = 0;
		}
		 
		 return maxPno+1;
	}

	@Override
	public List<ProductVO> ListAllProduct() throws Exception {
		
		
		return session.selectList(NAMESPACE+".listAllProduct");
	}
	
	@Override
	public void updateProduct(ProductVO vo) throws Exception {
		
		session.update(NAMESPACE+".updateProduct", vo);
	}

	@Override
	public ProductVO readProduct(int pno) {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".readProduct", pno);
	
	}

	@Override
	public void deleteProduct(int pno) {
		
		session.delete(NAMESPACE+".deleteProduct", pno);
		
	}

	@Override
	public List<ProductVO> listCriteria(ProductCriteria cri) {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".listCriteria", cri);
	}

	@Override
	public int totalCount() {
		// TODO Auto-generated method stub
		Integer i =session.selectOne(NAMESPACE+".totalCount");
		
		if(i==null){
			return 0;
		}
		
		return i;
	}

	@Override
	public int listSearchCount(ProductSearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		Integer cnt = session.selectOne(NAMESPACE+".listSearchCount", cri);
		
		if(cnt == null){
			return 0;
		}
		
		
		return cnt;
	}

	@Override
	public List<ProductVO> listSearch(ProductSearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub

	

		return session.selectList(NAMESPACE+".listSearch",  cri);
	}

	@Override
	public void insertOwnerPage(OwnerPageVO opvo) {
		session.insert(NAMESPACE + ".insertOwnerPage", opvo);
		
	}

	@Override
	public int getOpnum() throws Exception {
		Integer maxOpnum = session.selectOne(NAMESPACE+".getOpnum");
		
		if (maxOpnum == null) {
			maxOpnum = 0;
		}
		
		return maxOpnum+1;
	}

	@Override
	public void insertOwnerPage2(OwnerPageVO opvo) throws Exception {
		
		session.update(NAMESPACE+ ".insertOwnerPage2", opvo);
	}

	@Override
	public OwnerPageVO getBeforeInfo(int opnum) throws Exception {
		return session.selectOne(NAMESPACE + ".getBeforeInfo", opnum);
	
	}
	


	
}
