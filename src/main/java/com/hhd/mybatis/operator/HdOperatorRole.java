package com.hhd.mybatis.operator;

import javax.persistence.Id;


public class HdOperatorRole {
	@Id
	private int hdRoleId;
	
	private String hdPermissionId;

	public int getHdRoleId() {
		return hdRoleId;
	}

	public void setHdRoleId(int hdRoleId) {
		this.hdRoleId = hdRoleId;
	}

	public String getHdPermissionId() {
		return hdPermissionId;
	}

	public void setHdPermissionId(String hdPermissionId) {
		this.hdPermissionId = hdPermissionId;
	}

}