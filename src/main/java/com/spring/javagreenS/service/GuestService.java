package com.spring.javagreenS.service;

import java.util.ArrayList;

import com.spring.javagreenS.vo.GuestVO;

public interface GuestService {

	public ArrayList<GuestVO> getGuestList(int startIndexNo, int pageSize);

	public void setGuestInput(GuestVO vo);

	public int totRecCnt();

}
