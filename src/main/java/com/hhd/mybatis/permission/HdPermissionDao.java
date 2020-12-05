package com.hhd.mybatis.permission;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tk.mybatis.mapper.common.Mapper;

@Repository
@Transactional
public interface HdPermissionDao extends Mapper<HdPermission> {

    List<HdPermission> queryPermissionByUserId(@Param(value = "hdOperatorId") int hdUserId);
    List<HdPermission> queryPermissionByRoleId(@Param(value = "roleId") int roleId);

}