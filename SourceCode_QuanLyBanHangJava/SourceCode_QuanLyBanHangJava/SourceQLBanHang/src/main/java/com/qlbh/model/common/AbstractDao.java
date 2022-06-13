package com.qlbh.model.common;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.qlbh.app.MainApp;
import com.qlbh.model.NhatkyHome;
import com.qlbh.pojo.Keeplogged;
import com.qlbh.pojo.Nhatky;
import com.qlbh.util.DataAccessLayerException;
import com.qlbh.util.HibernateFactory;

public abstract class AbstractDao {
	private Session session;
	private Transaction tx;
	final static Logger logger = Logger.getLogger(AbstractDao.class);

	public AbstractDao() {
		HibernateFactory.buildIfNeeded();
	}

	// protected void saveOrUpdate(Object obj) {
	// try {
	// startOperation();
	// session.saveOrUpdate(obj);
	// tx.commit();
	// } catch (HibernateException e) {
	// handleException(e);
	// } finally {
	// HibernateFactory.close(session);
	// }
	// }

	protected void update(Object obj) {
		try {
			startOperation();
			session.update(obj);
			tx.commit();
		} catch (HibernateException e) {
			handleException(e);
		} finally {
			HibernateFactory.close(session);
		}
	}

	protected void save(Object obj) {
		try {
			startOperation();
			session.save(obj);
			tx.commit();
		} catch (HibernateException e) {
			handleException(e);
		} finally {
			HibernateFactory.close(session);
		}
	}

	// save return object.
	protected Integer saveReturnID(Object obj) {
		try {
			startOperation();
			Integer resultID = (Integer) session.save(obj);
			tx.commit();
			return resultID;
		} catch (HibernateException e) {
			handleException(e);
		} finally {
			HibernateFactory.close(session);
		}
		return null;
	}

	protected void delete(Object obj) {
		try {
			startOperation();
			session.delete(obj);
			tx.commit();
		} catch (HibernateException e) {
			handleException(e);
		} finally {
			HibernateFactory.close(session);
		}
	}

	protected Object find(Class clazz, Integer id) {
		Object obj = null;
		try {
			startOperation();
			obj = session.load(clazz, id);
			tx.commit();
		} catch (HibernateException e) {
			handleException(e);
		} finally {
			HibernateFactory.close(session);
		}
		return obj;
	}

	protected Integer getLastID(Class clazz) {
		Integer lastID = null;
		try {
			startOperation();
			Query query = session.createQuery("select distinct max(id) from " + clazz.getName());
			List objects = query.list();
			Object a = query.getFirstResult();
			lastID = (Integer) query.getFirstResult();
			tx.commit();
		} catch (HibernateException e) {
			handleException(e);
		} finally {
			HibernateFactory.close(session);
		}
		return lastID;
	}

	protected Object findById(Class clazz, Integer id) {
		Object obj = null;
		try {
			startOperation();
			Query query = session.createQuery("from " + clazz.getName() + " where id=:id");
			query.setInteger("id", id);
			List objects = query.list();
			if (objects.size() > 0) {
				obj = objects.get(0);
			}
			tx.commit();
		} catch (HibernateException e) {
			handleException(e);
		} finally {
			HibernateFactory.close(session);
		}
		return obj;
	}

	protected List findAll(Class clazz) {
		List objects = null;
		try {
			startOperation();
			Query query = session.createQuery("from " + clazz.getName() + " where Activity=true");
			System.out.println(query.getQueryString());
			objects = query.list();
			tx.commit();
		} catch (HibernateException e) {
			handleException(e);
		} finally {
			HibernateFactory.close(session);
		}
		return objects;
	}

	protected void handleException(HibernateException e) {
		HibernateFactory.rollback(tx);
		throw new DataAccessLayerException(e);
	}

	protected void startOperation() throws HibernateException {
		session = HibernateFactory.openSession();
		tx = session.beginTransaction();
	}

	public void saveNhatKy(String table, String hanhDong) {
		System.out.println("save nhật ký");
		Nhatky nk = new Nhatky();
		nk.setActivity(true);
		nk.setBang(table);
		nk.setHanhdong(hanhDong);
		nk.setNgay(new Date());
		nk.setNguoidung(MainApp.loginUser.getTennd());
		this.save(nk);
	}
}