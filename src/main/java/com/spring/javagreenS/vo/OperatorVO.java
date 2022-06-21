package com.spring.javagreenS.vo;

import lombok.Data;

public @Data class OperatorVO {
	private String oid;
	private String pwd;
	private String name;
	private int keyIdx;
	
	private int idx;
	private String hashKey;
}
