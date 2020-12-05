package com.hhd.mybatis.sql;

import static org.apache.ibatis.jdbc.SqlBuilder.BEGIN;
import static org.apache.ibatis.jdbc.SqlBuilder.DELETE_FROM;
import static org.apache.ibatis.jdbc.SqlBuilder.INSERT_INTO;
import static org.apache.ibatis.jdbc.SqlBuilder.SELECT;
import static org.apache.ibatis.jdbc.SqlBuilder.SET;
import static org.apache.ibatis.jdbc.SqlBuilder.SQL;
import static org.apache.ibatis.jdbc.SqlBuilder.UPDATE;
import static org.apache.ibatis.jdbc.SqlBuilder.VALUES;
import static org.apache.ibatis.jdbc.SqlBuilder.WHERE;

import com.hhd.mybatis.base.MyBatisEntity;

public class SqlTemplate<T extends MyBatisEntity> {
	
    public String findById(T obj) {
		BEGIN();
		
		SELECT(obj.tablename());
		obj.caculationColumnList();
		VALUES(obj.returnInsertColumnsName(), obj.returnInsertColumnsDefine());

		return SQL();
	}
	 
    
    public String insert(T obj) {
		BEGIN();
		
		INSERT_INTO(obj.tablename());
		obj.caculationColumnList();
		VALUES(obj.returnInsertColumnsName(), obj.returnInsertColumnsDefine());

		return SQL();
	}
    

    
   
	public String update(T obj) {
		String idname = obj.id();
		
		BEGIN();
		
		UPDATE(obj.tablename());
		obj.caculationColumnList();
		SET(obj.returnUpdateSet());
		WHERE(idname + "=#{" + idname + "}");
		
		return SQL();
	}
	
	public String delete(T obj) {
		String idname = obj.id();
		
		BEGIN();
		
		DELETE_FROM(obj.tablename());
		WHERE(idname + "=#{" + idname + "}");
		
		return SQL();
	}
}
