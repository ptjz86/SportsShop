package kr.co.persistence;

import kr.co.domain.OrderInfoVO;

public interface OrderInfoDAO {

	public abstract void insertOrderInfo(OrderInfoVO oVO) throws Exception;
	public abstract int getOno() throws Exception;
	public abstract void insertOrderInfo2(OrderInfoVO oVO);
	
	
}
