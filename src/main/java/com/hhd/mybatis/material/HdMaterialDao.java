package com.hhd.mybatis.material;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tk.mybatis.mapper.common.Mapper;

@Repository
@Transactional
public interface HdMaterialDao extends Mapper<HdMaterial> {


}