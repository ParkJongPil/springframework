package com.spring.javagreenS.vo;

import lombok.Data;

public @Data class GuestVO {
	private int idx;
	private String name;
	private String email;
	private String homepage;
	private String vDate;
	private String hostIp;
	private String content;
}
