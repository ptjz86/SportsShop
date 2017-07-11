package kr.co.persistence;

import java.util.List;

import kr.co.domain.UserVO;

public interface UserManageDAO {

	public abstract List<UserVO> getListUser() throws Exception;

	public abstract void delete(String id) throws Exception;

	public abstract List<UserVO> getGenderCnt() throws Exception;
	
	/*public abstract List<UserVO> getlistAnalysis() throws Exception;*/

}
