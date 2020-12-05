package com.hhd.mybatis.dict;

import java.util.Date;

public class HdDictionaryNote {
	private Integer dictId;
	private String typeCode;
	private String typeNote;
	private Date createTime;
	private Date updateTime;
	private Integer createOpId;
	private Integer updateOpId;
	public Integer getDictId() {
		return dictId;
	}
	public void setDictId(Integer dictId) {
		this.dictId = dictId;
	}

	public String getTypeCode() {
		return typeCode;
	}
	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}
	public String getTypeNote() {
		return typeNote;
	}
	public void setTypeNote(String typeNote) {
		this.typeNote = typeNote;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
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
	
	
	
	

}
