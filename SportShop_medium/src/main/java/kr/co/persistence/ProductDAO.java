package kr.co.persistence;

import java.util.List;

import kr.co.domain.BoardVO;
import kr.co.domain.OwnerPageVO;
import kr.co.domain.ProductCriteria;
import kr.co.domain.ProductSearchCriteria;
import kr.co.domain.ProductVO;
import kr.co.domain.SearchCriteria;

public interface ProductDAO {
	public abstract void insertProduct(ProductVO vo) throws Exception;
	public abstract int getPno() throws Exception;
	public abstract List<ProductVO> ListAllProduct() throws Exception;
	
	public abstract void updateProduct(ProductVO vo) throws Exception;
	public abstract ProductVO readProduct(int pno);
	public abstract void deleteProduct(int pno);
	public abstract List<ProductVO> listCriteria(ProductCriteria cri);
	public abstract int totalCount();
	
	public abstract int listSearchCount(ProductSearchCriteria cri) throws Exception;	
	public abstract List<ProductVO> listSearch(ProductSearchCriteria cri) throws Exception;
	public abstract void insertOwnerPage(OwnerPageVO opvo);
	public abstract int getOpnum() throws Exception;
	public abstract void insertOwnerPage2(OwnerPageVO opvo) throws Exception;
	public abstract OwnerPageVO getBeforeInfo(int opnum) throws Exception;
}
