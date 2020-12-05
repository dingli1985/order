package com.hhd.mybatis.dict;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tk.mybatis.mapper.common.Mapper;

@Repository
@Transactional
public interface HdDictionaryDao extends Mapper<HdDictionary> {
	
	List<HdDictionary> queryByCode(@Param(value = "typeCode") String typeCode);


}