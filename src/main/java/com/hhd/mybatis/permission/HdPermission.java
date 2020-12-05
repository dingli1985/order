package com.hhd.mybatis.permission;

import javax.persistence.Id;
import com.hhd.mybatis.base.MyBatisEntity;


public class HdPermission extends MyBatisEntity {
	@Id
	private int hdPermissionId;
	
	private String hdPermissionName;
	private String hdPermissionCode;
	private int hdParentId;
	private String hdPermissionUrl;
	private int hdPermissionType;
	private int hdPermissionStatus;
	public int getHdPermissionId() {
		return hdPermissionId;
	}
	public void setHdPermissionId(int hdPermissionId) {
		this.hdPermissionId = hdPermissionId;
	}
	public String getHdPermissionName() {
		return hdPermissionName;
	}
	public void setHdPermissionName(String hdPermissionName) {
		this.hdPermissionName = hdPermissionName;
	}
	public String getHdPermissionCode() {
		return hdPermissionCode;
	}
	public void setHdPermissionCode(String hdPermissionCode) {
		this.hdPermissionCode = hdPermissionCode;
	}
	public int getHdParentId() {
		return hdParentId;
	}
	public void setHdParentId(int hdParentId) {
		this.hdParentId = hdParentId;
	}
	public String getHdPermissionUrl() {
		return hdPermissionUrl;
	}
	public void setHdPermissionUrl(String hdPermissionUrl) {
		this.hdPermissionUrl = hdPermissionUrl;
	}
	public int getHdPermissionType() {
		return hdPermissionType;
	}
	public void setHdPermissionType(int hdPermissionType) {
		this.hdPermissionType = hdPermissionType;
	}
	public int getHdPermissionStatus() {
		return hdPermissionStatus;
	}
	public void setHdPermissionStatus(int hdPermissionStatus) {
		this.hdPermissionStatus = hdPermissionStatus;
	}
	





}