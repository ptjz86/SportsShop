package kr.co.service;

import java.util.List;

import kr.co.domain.UserVO;

public interface UserManageService {

	public abstract List<UserVO> userList() throws Exception;

	public abstract void delete(String id) throws Exception;

	public abstract List<UserVO> Analysis() throws Exception;
	
	/*public abstract List<UserVO> genderAnalysis(UserVO vo) throws Exception;*/

}
