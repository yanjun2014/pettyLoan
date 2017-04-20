package com.hl.loan.dao.impl;

import com.hl.loan.dao.ExcelDao;
import com.hl.loan.pojo.Excel;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ExcelDaoImpl extends BaseDaoImpl<Excel>
  implements ExcelDao
{
	public Excel saveExcel(Excel excel){
	  this.getHibernateTemplate().saveOrUpdate(excel);
      return excel;
	}

  	public List<Excel> getExcel(Long fileId,int states) {
	   String sql = "from Excel where 1=1 ";
	    List list=new ArrayList<>();
	    if(fileId!=null){
	    	sql=sql+" and fileId=?";
	    	list.add(fileId);
	    }
	    if(states!=-99){
	    	sql=sql+" and clss=?";
	    	list.add(states);
	    }
	    sql=sql+" order by downTime desc";
	    Query query = getSession().createQuery(sql);
	    if(list!=null && list.size()>0){
	    	for(int i=0;i<=list.size();i++){
	    		query.setParameter(i, list.get(i));
	    	}
	    }
	    return query.list();
  	}
  	public void updateExcel(Long id){
  		Query query = getSession().createQuery("update Excel set status=2 where id=?");
  		query.setParameter(0, id);
  		query.executeUpdate();
  	}
  	public void updateState(Long id,int status){
  		Query query = getSession().createQuery("update Excel set status=? where id=?");
	  	query.setParameter(0,status);
	  	query.setParameter(1, id);
	  	query.executeUpdate();
  	}
}


