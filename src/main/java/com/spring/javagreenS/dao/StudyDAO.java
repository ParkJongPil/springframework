package com.spring.javagreenS.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javagreenS.vo.OperatorVO;

public interface StudyDAO {

	public OperatorVO getOperator(@Param("oid") String oid);

	public String getOperatorHashKey(@Param("keyIdx") int keyIdx);

	public void setOperatorInputOk(@Param("vo") OperatorVO vo);

	public ArrayList<OperatorVO> getOperatorList();

	public void setOperatorDelete(@Param("oid") String oid);

	public ArrayList<OperatorVO> getOperatorVos(@Param("oid") String oid);
	
}
