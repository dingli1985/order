package com.hhd.mybatis.operator;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tk.mybatis.mapper.common.Mapper;

@Repository
@Transactional
public interface HdOperatorRoleDao extends Mapper<HdOperatorRole> {

}