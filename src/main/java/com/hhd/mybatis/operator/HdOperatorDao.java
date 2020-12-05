package com.hhd.mybatis.operator;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tk.mybatis.mapper.common.Mapper;

@Repository
@Transactional
public interface HdOperatorDao extends Mapper<HdOperator> {

	HdOperator queryOperatorByAccAndPwd(@Param(value = "userName") String userName, @Param(value = "userPwd") String userPwd);
	List<HdOperator> queryOperatorByPage(@Param(value = "pageSize") int pageSize, @Param(value = "startNo") int startNo);
	HdOperator queryByOperatorId(@Param(value = "hdOperatorId") int hdOperatorId);
	void insertOperator(HdOperator hdOperator);


}