package com.epbooks.www.mypage.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.epbooks.www.mypage.service.MypageService;

@Service
@Transactional
public class MypageServiceImpl implements MypageService {
	private static final Logger logger = LoggerFactory.getLogger(MypageServiceImpl.class);

	@Autowired
	MypageDao mypageDao;

	@Override

	// 구매내역조회
	public List<Map<String, String>> selectPurchaseHistoryList(String memberid) {
		List<Map<String, String>> purchaseHistoryList = mypageDao.selectPurchaseHistoryList(memberid);
		return purchaseHistoryList;
	}

	@Override
	// 개인정보수정 페이지 리스트
	public Map<String, String> selectMemberInfoForChangeMemberInfo(String memberid) {

		// DB에서 Member의 정보를 조회하여 반환받은 값을 List Map에 저장
		List<Map<String, String>> memberInfoListMap = mypageDao.selectMemberInfoForChangeMemberInfo(memberid);

		// List Map을 Map으로 변환하여 컨트롤러에 반환
		Map<String, String> memberInfoMap = new HashMap<>(); // Map 생성

		memberInfoListMap.stream().forEach(map -> {
			memberInfoMap.putAll(map.entrySet().stream()
						 .collect(Collectors.toMap(entry -> entry.getKey(), entry -> entry.getValue())));

		});
		return memberInfoMap;
	}

	@Override
	public int updateMemberEmail(@Param("info") String info, @Param("memberid") String memberid) {
		int updateEamilResult = mypageDao.updateMemberEmail(info, memberid);
		return updateEamilResult;
	}

	@Override
	public int updateMemberAddress(String info, String memberid) {
		int updateAddressResult = mypageDao.updateMemberAddress(info, memberid);
		return updateAddressResult;
	}

	@Override
	public int updateMemberPhone(String info, String memberid) {
		int updatePhoneResult = mypageDao.updateMemberPhone(info, memberid);
		return updatePhoneResult;
	}

}
