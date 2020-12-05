package com.hhd.mybatis.operator;

import java.util.Date;

import javax.persistence.Id;

/**
 * 操作员
 * 
 * @author alex
 *
 */
public class HdOperator {
	@Id
	private Integer operatorId;

	private String operatorCode;

	private String operatorName;

	private String operatorStatus;

	private String operatorPwd;

	private Date updateTime;

	private Date createTime;

	private Integer createOpId;

	private Integer updateOpId;

	private String notes;

	private String foreignNotes;

	private Integer opGroupId;

	private Integer cargoOwnerId;

	public Integer getOperatorId() {
		return operatorId;
	}

	public void setOperatorId(Integer operatorId) {
		this.operatorId = operatorId;
	}

	public String getOperatorCode() {
		return operatorCode;
	}

	public void setOperatorCode(String operatorCode) {
		this.operatorCode = operatorCode;
	}

	public String getOperatorName() {
		return operatorName;
	}

	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}

	public String getOperatorStatus() {
		return operatorStatus;
	}

	public void setOperatorStatus(String operatorStatus) {
		this.operatorStatus = operatorStatus;
	}

	public String getOperatorPwd() {
		return operatorPwd;
	}

	public void setOperatorPwd(String operatorPwd) {
		this.operatorPwd = operatorPwd;
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

	public Integer getCreateOpId() {
		return createOpId;
	}

	public void setCreateOpId(Integer createOpId) {
		this.createOpId = createOpId;
	}

	public Integer getUpdateOpId() {
		return updateOpId;
	}

	public void setUpdateOpId(Integer updateOpId) {
		this.updateOpId = updateOpId;
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

	public Integer getOpGroupId() {
		return opGroupId;
	}

	public void setOpGroupId(Integer opGroupId) {
		this.opGroupId = opGroupId;
	}

	public Integer getCargoOwnerId() {
		return cargoOwnerId;
	}

	public void setCargoOwnerId(Integer cargoOwnerId) {
		this.cargoOwnerId = cargoOwnerId;
	}

}