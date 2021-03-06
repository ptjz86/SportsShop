package kr.co.persistence;



import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.IdFindDTO;
import kr.co.domain.LoginDTO;
import kr.co.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Inject
	private SqlSession session;
	private final String NAMESPACE="kr.co.mapper.UserMapper";
	
	

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".login", dto);
		
	}



	@Override
	public void join(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(NAMESPACE+".join", vo);
	}



	@Override
	public UserVO idck(String id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".idck", id);
	}



	@Override
	public UserVO mypage(String id) throws Exception {
		// TODO Auto-generated method stub
	
		return session.selectOne(NAMESPACE+".mypage", id);
	}


/*
	@Override
	public UserVO delete(String id) throws Exception {
		// TODO Auto-generated method stub
	
		return session.delete(NAMESPACE+".delete", id);
	}
*/


	@Override
	public void update(UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		
		session.update(NAMESPACE+".update", userVO);
	}



	@Override
	public void delete(String id) throws Exception {
		// TODO Auto-generated method stub
		session.delete(NAMESPACE+".delete", id);
	}



	@Override
	public UserVO idfind(UserVO dto) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".idfind", dto);
	}



	@Override
	public UserVO pwfind(UserVO dto) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".pwfind", dto);
	}






	


}
