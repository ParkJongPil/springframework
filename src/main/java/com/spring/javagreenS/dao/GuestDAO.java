package com.spring.javagreenS.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javagreenS.vo.GuestVO;

public interface GuestDAO {

	public ArrayList<GuestVO> getGuestList(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize);

	public void setGuestInput(@Param("vo") GuestVO vo);

	public int totRecCnt();
	
}
