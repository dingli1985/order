package com.hhd.mybatis.base;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

public class SqlSessionWrapper {
 
    private SqlSession sqlSession;
   
    public SqlSessionWrapper(SqlSession sqlSession) {
       this.sqlSession = sqlSession;
    }
    public Pager selectPagination(String s, Object param, Pager pager) {
       if(pager == null) {
           pager = new Pager();
       }
       List resultList = sqlSession.selectList(s, param,
                                   new RowBounds(pager.getPageNo(), pager.getPageSize()));
       int rowCount = PaginationHelper.getRowCount(sqlSession, s, param);
       pager.setResultList(resultList);
       pager.setRowCount(rowCount);
       if(resultList == null || resultList.size() == 0) {
           pager.setPageCount(0);
           pager.setPageNo(0);
       }
       return pager;
    }
   
    public Pager selectPagination(String s, Pager pager) {
       return selectPagination(s, null, pager);
    }
 }