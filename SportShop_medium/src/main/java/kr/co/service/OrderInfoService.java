package kr.co.service;

import kr.co.domain.OrderInfoVO;

public interface OrderInfoService {

	public abstract void insertOrderInfo(OrderInfoVO oVO) throws Exception;
	public abstract int getOno() throws Exception;
	public abstract void insertOrderInfo2(OrderInfoVO oVO) throws Exception;
}
