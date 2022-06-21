package com.spring.javagreenS.vo;

import lombok.Data;

public @Data class MemberVO {
	private int idx;
	private String mid;
	private String pwd;
	private String nickName;
	private String name;
	private String gender;
	private String birthday;
	private String tel;
	private String address;
	private String email;
	private String homePage;
	private String job;
	private String hobby;
	private String photo;
	private String content;
	private String userInfor;
	private String userDel;
	private int point;
	private int level;
	private int visitCnt;
	private String startDate;
	private String lastDate;
	private int todayCnt;	//위쪽은 데이터 베이스 필드
	
	private int applyDiff;	//날짜 차이를 저장하는 필드
	
	private String strLevel;	// 회원등급을 문자로 저장하는 필드
	
	}
