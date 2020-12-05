package com.hhd.mybatis.dept;

import java.util.Date;

public class HdDept {
	
	private Integer deptId;
	private String deptCode;
	private String deptName;
	private String deptForeignName;
	private Integer deptStatus;
	private Integer nodeType;
	private Integer corpId;
	private Integer CreateOpId;
	private Integer updateOpId;
	private Date updateTime;
	private Date createTime;
	private String notes;
	private String foreignNotes;
	public Integer getDeptId() {
		return deptId;
	}
	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}
	public String getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getDeptForeignName() {
		return deptForeignName;
	}
	public void setDeptForeignName(String deptForeignName) {
		this.deptForeignName = deptForeignName;
	}
	public Integer getDeptStatus() {
		return deptStatus;
	}
	public void setDeptStatus(Integer deptStatus) {
		this.deptStatus = deptStatus;
	}
	public Integer getNodeType() {
		return nodeType;
	}
	public void setNodeType(Integer nodeType) {
		this.nodeType = nodeType;
	}
	public Integer getCorpId() {
		return corpId;
	}
	public void setCorpId(Integer corpId) {
		this.corpId = corpId;
	}
	public Integer getCreateOpId() {
		return CreateOpId;
	}
	public void setCreateOpId(Integer createOpId) {
		CreateOpId = createOpId;
	}
	public Integer getUpdateOpId() {
		return updateOpId;
	}
	public void setUpdateOpId(Integer updateOpId) {
		this.updateOpId = updateOpId;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public String getForeignNotes() {
		return foreignNotes;
	}
	public void setForeignNotes(String foreignNotes) {
		this.foreignNotes = foreignNotes;
	}

	

}
