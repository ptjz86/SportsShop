package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.BoardVO;
import kr.co.domain.Criteria;
import kr.co.domain.OwnerPageVO;
import kr.co.domain.ProductCriteria;
import kr.co.domain.ProductSearchCriteria;
import kr.co.domain.ProductVO;
import kr.co.persistence.ProductDAO;


@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	ProductDAO dao;

	@Transactional
	@Override
	public void insertProduct(ProductVO vo) throws Exception {
		
		dao.insertProduct(vo);
	}

	@Override
	public int getPno() throws Exception {
		// TODO Auto-generated method stub
		return dao.getPno();
	}

	@Override
	public List<ProductVO> ListAllProduct() throws Exception {
		
		
		// TODO Auto-generated method stub
		return dao.ListAllProduct();
	}

	@Override
	public void updateProduct(ProductVO vo) throws Exception {
		dao.updateProduct(vo);
		
	}

	@Override
	public ProductVO readProduct(int pno) throws Exception {
		// TODO Auto-generated method stub
		return dao.readProduct(pno);
	}

	@Override
	public void deleteProduct(int pno) {
	
		dao.deleteProduct(pno);
	}

	@Override
	public List<ProductVO> listCriteria(ProductCriteria cri) {
		// TODO Auto-generated method stub
		return dao.listCriteria(cri);
	}

	@Override
	public int totalCount() {
		// TODO Auto-generated method stub
		Integer i = dao.totalCount();
		
		if(i == null){
			return 0;
		}
		return i;
	}

	@Override
	public List<ProductVO> listSearch(ProductSearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(ProductSearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearchCount(cri);
	}

	@Override
	public void insertOwnerPage(OwnerPageVO opvo) throws Exception {
	
		dao.insertOwnerPage(opvo);
	}

	@Override
	public int getOpnum() throws Exception {
		// TODO Auto-generated method stub
		return dao.getOpnum();
	}

	@Override
	public void insertOwnerPage2(OwnerPageVO opvo) throws Exception {
		dao.insertOwnerPage2(opvo);
		
	}

	@Override
	public OwnerPageVO getBeforeInfo(int opnum) throws Exception {
		// TODO Auto-generated method stub
		return dao.getBeforeInfo(opnum);
	}
	
	
}
