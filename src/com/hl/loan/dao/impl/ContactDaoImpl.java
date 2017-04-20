package com.hl.loan.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.hl.loan.dao.ContactDao;
import com.hl.loan.pojo.Contact;
import com.hl.loan.util.PageModel;

import org.hibernate.Query;

@SuppressWarnings("unchecked")
@Repository
public class ContactDaoImpl extends BaseDaoImpl<Contact> implements ContactDao {

	@Override
	public PageModel<Contact> showContact(PageModel<Contact> pm, Contact contact) {
		int size = pm.getPageSize();
	    int pageno = pm.getPageNo();
	    if(pageno<=0){
	    	pageno=1;
	    }
	    int startNumber = (pageno - 1) * size;
		StringBuffer hql = new StringBuffer("from Contact where 1=1");
		  StringBuffer chql = new StringBuffer("select count(*) from Contact ");
		List ulist = new ArrayList();
		if (contact != null) {
			if (contact.getContactName() != null && !contact.getContactName().equals("")) {
				hql.append(" and contactName like :contactName");
				chql.append(" and contactName like :contactName");
			}
			if (contact.getActivity() != null && !contact.getActivity().equals("")) {
				hql.append(" and activity like :activity");
				chql.append(" and activity like :activity");
			}
			if (contact.getActivityTime() != null && !contact.getActivityTime().equals("")) {
				hql.append(" and activityTime like :activityTime");
				chql.append(" and activityTime like :activityTime");
			}
		}
		Query query = this.getSession().createQuery(hql.toString()).setFirstResult(startNumber).setMaxResults(size);
		Query querys = this.getSession().createQuery(chql.toString());
		if (ulist != null && ulist.size() > 0) {
			for (int i = 0; i < ulist.size(); i++) {
				query.setParameter(i, ulist.get(i));
				querys.setParameter(i, ulist.get(i));
			}
		}
		if (contact != null) {
			if (contact.getContactName() != null && !contact.getContactName().equals("")) {
				query.setParameter("contactName", "%" + contact.getContactName() + "%");
				querys.setParameter("contactName", "%" + contact.getContactName() + "%");
			}
			if (contact.getActivity() != null && !contact.getActivity().equals("")) {
				query.setParameter("activity", "%" + contact.getActivity() + "%");
				querys.setParameter("activity", "%" + contact.getActivity() + "%");
			}
			if (contact.getActivityTime() != null && !contact.getActivityTime().equals("")) {
				query.setParameter("activityTime", "%" + contact.getActivityTime() + "%");
				querys.setParameter("activityTime", "%" + contact.getActivityTime() + "%");
			}
		}
		List<Contact> list = query.list();
		long count=(long) querys.iterate().next();
		int countSum = (int) count;
		pm.setDatas(list);
		pm.setPageNo(pageno);
		pm.setPageSize(size);
		pm.setRecordCount(countSum);
		return pm;
	}

	@Override
	public List<Contact> getAllContact() {
		return this.getHibernateTemplate().find(" from Contact");
	}

	@Override
	public void addContact(Contact contact) {
		this.getHibernateTemplate().persist(contact);
	}

	@Override
	public int delContact(String contactID) {
		Query query = this.getSession().createQuery("delete Contact where ContactID=?");
		query.setParameter(0, contactID);
		return query.executeUpdate();
	}

	@Override
	public int updateContactByID(String contactID, Contact contact) {
		this.getSession().saveOrUpdate(contactID, contact);
		return 1;
	}

	@Override
	public Contact load(String contactID) {
		return (Contact) this.getHibernateTemplate().get(Contact.class, Long.parseLong(contactID));
	}
}
