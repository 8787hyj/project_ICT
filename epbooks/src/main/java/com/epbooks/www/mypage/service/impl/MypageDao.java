package com.epbooks.www.mypage.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface MypageDao {
	//select
	public List<Map<String, String>> selectPurchaseHistoryList(String memberid);
	public List<Map<String, String>> selectMemberInfoForChangeMemberInfo(String memberid);
	public List<Object> selectImg(String isbn);
	 
	
	//update
//	public void updateMemberInfo(@Param("updateColumn") String updateColumn, @Param("info") String info, @Param("memberid") String memberid);
	public int updateMemberEmail( @Param("info") String info, @Param("memberid") String memberid);
	public int updateMemberAddress(@Param("info") String info, @Param("memberid") String memberid);
	public int updateMemberPhone(@Param("info") String info, @Param("memberid") String memberid);
	public int insertTest(Map<String, Object> map);
	
}
