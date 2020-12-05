package com.hhd.mybatis.inteceptor;

import java.sql.Connection;
import java.util.Properties;

import javax.naming.ConfigurationException;

import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.RowBounds;
import org.apache.log4j.Logger;

import com.hhd.mybatis.base.dialect.Dialect;
import com.hhd.mybatis.base.dialect.MySQL5Dialect;
import com.hhd.mybatis.base.dialect.OrcaleDialect;
import com.hhd.mybatis.base.dialect.SqlServerDialect;
import com.hhd.spring.web.OperatorController;

@Intercepts({@Signature(type=StatementHandler.class,method="prepare",args={Connection.class})})
public class PaginationInterceptor implements Interceptor {
 
	private Logger logger=Logger.getLogger(OperatorController.class);
    @Override
    public Object intercept(Invocation invocation) throws Throwable {
       StatementHandler statmentHandler = (StatementHandler) invocation.getTarget();
       BoundSql boundSql = statmentHandler.getBoundSql();
       MetaObject metaStatementHandler = MetaObject.forObject(statmentHandler,null,null,null);
       RowBounds rowBounds = (RowBounds) metaStatementHandler.getValue("delegate.rowBounds");
       if(rowBounds == null || rowBounds == RowBounds.DEFAULT) {
           return invocation.proceed();
       }
       Configuration configuration = (Configuration) metaStatementHandler
                                                          .getValue("delegate.configuration");
       Dialect.Type databaseType = null;
       try{          
           databaseType = Dialect.Type.valueOf(configuration.getVariables()
                                      .getProperty("dialect").toUpperCase());      
       } catch(Exception e){        
           throw new ConfigurationException(
                  "the value of the dialect property in mybatis-config.xml is not defined : "
                  + configuration.getVariables().getProperty("dialect")); 
       }      
      
       Dialect dialect =null;
       switch(databaseType){         
           case MYSQL: dialect =new MySQL5Dialect(); break;
           case SQLSERVER : dialect = new SqlServerDialect(); break;
           case ORACLE : dialect = new OrcaleDialect(); break;
       }
      
       String originalSql = (String)metaStatementHandler.getValue("delegate.boundSql.sql");     
       metaStatementHandler.setValue("delegate.boundSql.sql", dialect.getPaginationSql(originalSql,
                                       rowBounds.getOffset(), rowBounds.getLimit()) );      
       metaStatementHandler.setValue("delegate.rowBounds.offset", RowBounds.NO_ROW_OFFSET );      
       metaStatementHandler.setValue("delegate.rowBounds.limit", RowBounds.NO_ROW_LIMIT );      
       if(logger.isDebugEnabled()){          
    	   logger.debug("生成分页SQL : "+ boundSql.getSql());      
       }
       return invocation.proceed();
    }
 
    @Override
    public Object plugin(Object target) {
       return Plugin.wrap(target, this);
    }
 
    @Override
    public void setProperties(Properties properties) {
    }
}