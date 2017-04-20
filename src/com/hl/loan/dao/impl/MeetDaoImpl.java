package com.hl.loan.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.hl.loan.dao.MeetDao;
import com.hl.loan.pojo.Meet;
import com.hl.loan.util.PageModel;

@Repository
public class MeetDaoImpl extends BaseDaoImpl<Meet> implements MeetDao{
	public void addMeet(Meet meet){
		this.getHibernateTemplate().persist(meet);
	}
	public void updateMeet(Meet meet){
		this.getHibernateTemplate().update(meet);
	}
	public PageModel<Meet> showFiles(PageModel<Meet> pm, Meet meet) {
		
		int size = pm.getPageSize();
		int pageno = pm.getPageNo();
		if(pageno<=0){
			 pageno=1;
		}
		int startNumber = (pageno - 1) * size;
		StringBuffer sb=new StringBuffer("from Meet where 1=1 ");
		StringBuffer csb=new StringBuffer("select count(*) from Meet where 1=1 ");
		 List ulist = new ArrayList();
		if(meet!=null){
			if(meet.getCompnyName()!=null && meet.getCompnyName().length()>0){
				sb.append(" and compnyName like :compnyName");
				csb.append(" and compnyName like :compnyName");
			}
			if(meet.getMeetName()!=null && meet.getMeetName().length()>0){
				sb.append(" and meetName like :meetName");
				csb.append(" and meetName like :meetName");
			}
			if(meet.getPhone()!=null && meet.getPhone().length()>0){
				sb.append(" and phone like :phone");
				csb.append(" and phone like :phone");
			}
			if(meet.getState()!=null){
				sb.append(" and state =?");
				csb.append(" and state =?");
				ulist.add(meet.getState());
			}
			if(meet.getResultState()!=null){
				sb.append(" and resultState =?");
				csb.append(" and resultState =?");
				ulist.add(meet.getResultState());
			}
		}
		sb.append(" order by id desc");
		Query query = this.getSession().createQuery(sb.toString()).setFirstResult(startNumber).setMaxResults(size);
	    Query querys = this.getSession().createQuery(csb.toString());
	    if ((ulist != null) && (ulist.size() > 0)) {
	        for (int i = 0; i < ulist.size(); i++) {
	          query.setParameter(i, ulist.get(i));
	          querys.setParameter(i, ulist.get(i));
	        }
	      }
	    if(meet!=null){
	    	if(meet.getCompnyName()!=null && meet.getCompnyName().length()>0){
	    		query.setParameter("compnyName", "%" + meet.getCompnyName().trim() + "%");
	    		querys.setParameter("compnyName", "%" + meet.getCompnyName().trim() + "%");
	    	}
	    	if(meet.getMeetName()!=null && meet.getMeetName().length()>0){
	    		query.setParameter("meetName", "%" + meet.getMeetName().trim() + "%");
	    		querys.setParameter("meetName", "%" + meet.getMeetName().trim() + "%");
	    	}
	    	if(meet.getPhone()!=null && meet.getPhone().length()>0){
	    		query.setParameter("phone", "%" + meet.getPhone().trim() + "%");
	    		querys.setParameter("phone", "%" + meet.getPhone().trim() + "%");
	    	}
	    }
	    List<Meet> list = query.list();
	    long count=(long) querys.iterate().next();
	    int countSum = (int) count;
	    pm.setDatas(list);
	    pm.setPageNo(pageno);
	    pm.setPageSize(size);
	    pm.setRecordCount(countSum);
	    return pm;
	}
	public Meet getMeetById(Long id){
		String hql="from Meet where id=?";
		Query query=this.getSession().createQuery(hql);
		query.setParameter(0, id);
		if(query.list()!=null && query.list().size()>0){
			return (Meet) query.list().get(0);
		}
		return null;
	}
}









