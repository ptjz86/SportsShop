package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.OrderInfoVO;
import kr.co.persistence.OrderInfoDAO;

@Service
public class OrderInfoServiceImpl implements OrderInfoService {

	@Inject
	OrderInfoDAO dao;
	
	
	@Override
	public void insertOrderInfo(OrderInfoVO oVO) throws Exception {
		
		dao.insertOrderInfo(oVO);
		
		
	}

	@Override
	public int getOno() throws Exception {
		
		return dao.getOno();
	}

	@Override
	public void insertOrderInfo2(OrderInfoVO oVO) throws Exception {
	
		dao.insertOrderInfo2(oVO);
	}

}
