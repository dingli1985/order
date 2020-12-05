package com.hhd.mybatis.dept;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tk.mybatis.mapper.common.Mapper;

@Repository
@Transactional
public interface HdDeptDao extends Mapper<HdDept> {
	void insertDept(HdDept hdDept);

}