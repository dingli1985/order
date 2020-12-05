package com.hhd.mybatis.cargo;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tk.mybatis.mapper.common.Mapper;

@Repository
@Transactional
public interface HdCargoOwnerDao extends Mapper<HdCargoOwner> {

}