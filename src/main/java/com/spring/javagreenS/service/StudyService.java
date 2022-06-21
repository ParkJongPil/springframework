package com.spring.javagreenS.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.spring.javagreenS.vo.OperatorVO;

public interface StudyService {

	public OperatorVO getOperator(String oid);

	public void setOperatorInputOk(OperatorVO vo);

	public ArrayList<OperatorVO> getOperatorList();

	public void setOperatorDelete(String oid);

	public String setOperatorSearch(OperatorVO vo);

	public String[] getCityStringArr(String dodo);

	public ArrayList<String> getCityArrayListStr(String dodo);

	public ArrayList<OperatorVO> getOperatorVos(String oid);

	public int fileUpload(MultipartFile fName);

}
