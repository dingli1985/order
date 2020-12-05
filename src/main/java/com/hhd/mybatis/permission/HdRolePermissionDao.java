package com.hhd.mybatis.permission;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tk.mybatis.mapper.common.Mapper;

@Repository
@Transactional
public interface HdRolePermissionDao extends Mapper<HdRolePermission> {

	List<HdPermission> query(@Param(value = "pageSize") int pageSize, @Param(value = "startNo") int startNo);

}