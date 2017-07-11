package kr.co.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.UserVO;

@Repository
public class UserManageDAOImpl implements UserManageDAO{
	
	@Inject
	private SqlSession session;
	private final String NAMESPACE= "kr.co.mapper.UserManageMapper";
	
	@Override
	public List<UserVO> getListUser() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".usercheck");
	}

	@Override
	public void delete(String id) throws Exception {
		// TODO Auto-generated method stub
		
		session.delete(NAMESPACE+".delete", id);
		
	}

	@Override
	public List<UserVO> getGenderCnt() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".mAnalysis");
	}

	/*@Override
	public List<UserVO> getlistAnalysis() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".manalysis");
	}*/

}
