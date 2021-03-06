package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.UserVO;
import kr.co.persistence.UserManageDAO;

@Service
public class UserManageServiceImpl implements UserManageService {
	
	@Inject
	UserManageDAO dao;

	@Transactional
	@Override
	public List<UserVO> userList() throws Exception {
		// TODO Auto-generated method stub
		return dao.getListUser();
	}

	@Override
	public void delete(String id) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(id);
		
	}

	@Override
	public List<UserVO> Analysis() throws Exception {
		// TODO Auto-generated method stub
		return dao.getGenderCnt();
	}

	/*@Override
	public List<UserVO> genderAnalysis(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.getlistAnalysis();
	}*/
	

}
