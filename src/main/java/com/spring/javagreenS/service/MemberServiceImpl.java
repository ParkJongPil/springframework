package com.spring.javagreenS.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javagreenS.common.ProjectSupport;
import com.spring.javagreenS.dao.MemberDAO;
import com.spring.javagreenS.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO memberDAO;

	@Override
	public MemberVO getMemIdCheck(String mid) {
		return memberDAO.getMemIdCheck(mid);
	}

	@Override
	public MemberVO getNickNameCheck(String nickName) {
		return memberDAO.getNickNameCheck(nickName);
	}

	@Override
	public int setMemInputOk(MultipartFile fName, MemberVO vo) {
		// 사진작업 처리후 DB에 저장
		int res = 0;
		try {
			String oFileName = fName.getOriginalFilename();
			if(oFileName.equals("")) {
				vo.setPhoto("noimage.jpg");
			}
			else {
				UUID uid = UUID.randomUUID();
				String saveFileName = uid + "_" + oFileName;
				ProjectSupport ps = new ProjectSupport();
				ps.writeFile(fName, saveFileName,"member");
				vo.setPhoto(saveFileName);
			}
			memberDAO.setMemInputOk(vo);
			res = 1;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public void setMemberVisitProcess(MemberVO vo) {
		// 오늘 날짜 편집
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strToday = sdf.format(today);
		
		// DB에 저장된 최종 방문일 편집
		String lastDate = vo.getLastDate().substring(0,10);
			
		// 최종방문일과 오늘날짜가 다르다면, todayCnt를 0으로 셋팅
		// 방문포인터는 1일 5회까지만 10점씩 증가처리..
		int todayCnt = vo.getTodayCnt();
		int newPoint = 0;
		if(strToday.equals(lastDate)) {
			if(todayCnt >= 5) newPoint = 0;
			else newPoint = 10;
			todayCnt++;
		}
		else {
			todayCnt = 1;
			newPoint = 10;
		}
		
		memberDAO.setMemberVisitProcess(vo.getMid(), todayCnt, newPoint);
	}
}
