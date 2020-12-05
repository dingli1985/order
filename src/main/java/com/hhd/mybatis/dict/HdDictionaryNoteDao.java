package com.hhd.mybatis.dict;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tk.mybatis.mapper.common.Mapper;

@Repository
@Transactional
public interface HdDictionaryNoteDao extends Mapper<HdDictionaryNote> {

}