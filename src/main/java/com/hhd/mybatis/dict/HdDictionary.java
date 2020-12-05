package com.hhd.mybatis.dict;

import java.util.Date;

import javax.persistence.Id;

public class HdDictionary {

	@Id
	private Integer dictId;
	private String typeName;
	private String typeCode;
	private String typeNote;
	private String typeForeignNote;
	private Date createTime;
	private Date updateTime;
	private Integer createOpId;
	private Integer updateOpId;
	private int nodeType;
	private int nodeStatus;
	public Integer getDictId() {
		return dictId;
	}
	public void setDictId(Integer dictId) {
		this.dictId = dictId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
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
	public String getTypeForeignNote() {
		return typeForeignNote;
	}
	public void setTypeForeignNote(String typeForeignNote) {
		this.typeForeignNote = typeForeignNote;
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
	public int getNodeType() {
		return nodeType;
	}
	public void setNodeType(int nodeType) {
		this.nodeType = nodeType;
	}
	public int getNodeStatus() {
		return nodeStatus;
	}
	public void setNodeStatus(int nodeStatus) {
		this.nodeStatus = nodeStatus;
	}

   


}
