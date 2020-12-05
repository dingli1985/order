package com.hhd.mybatis.permission;

import javax.persistence.Id;


public class HdRolePermission {
	@Id
	private int hdRoleId;
	
	private int hdUserId;

	public int getHdUserId() {
		return hdUserId;
	}

	public void setHdUserId(int hdUserId) {
		this.hdUserId = hdUserId;
	}

	public int getHdRoleId() {
		return hdRoleId;
	}

	public void setHdRoleId(int hdRoleId) {
		this.hdRoleId = hdRoleId;
	}



}