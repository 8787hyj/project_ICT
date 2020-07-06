package com.epbooks.www.mypage.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface MypageService {
	//select
	List<Map<String, String>> selectPurchaseHistoryList(String memberid);
	Map<String, String> selectMemberInfoForChangeMemberInfo(String memberid);
	
	//update
	public int updateMemberEmail(@Param("info") String info, @Param("memberid") String memberid);
	public int updateMemberAddress(String info, String memberid);
	public int updateMemberPhone(String info, String memberid);
}
