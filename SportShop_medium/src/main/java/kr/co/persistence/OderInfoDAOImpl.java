package kr.co.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.OrderInfoVO;

@Repository
public class OderInfoDAOImpl implements OrderInfoDAO {

	@Inject
	private SqlSession session;
	private final String NAMESPACE="kr.co.mapper.OrderInfoMapper";
	
	
	
	
	@Override
	public void insertOrderInfo(OrderInfoVO oVO) throws Exception {
		
		session.insert(NAMESPACE+".insertOrderInfo", oVO);
		
		
		
		
		
	}


	@Override
	public int getOno() throws Exception {
		
		Integer maxOno = session.selectOne(NAMESPACE+".getOno");
		
		if (maxOno == null) {
			maxOno = 0;
		}
		
		return maxOno+1;
	}


	
	@Override
	public void insertOrderInfo2(OrderInfoVO oVO) {
		
		session.update(NAMESPACE + ".insertOrderInfo2", oVO); //동작은 삽입이랑 동시에 이루어져야 하는 insert 지만 순서가 2차 삽입이므로 update를 사용한다
		
		
		
	}

}
