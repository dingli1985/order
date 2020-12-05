package com.hhd.mybatis.unit;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tk.mybatis.mapper.common.Mapper;

@Repository
@Transactional
public interface HdUnitDao extends Mapper<HdUnit> {
	void insertUnit(HdUnit hdUnit);

}