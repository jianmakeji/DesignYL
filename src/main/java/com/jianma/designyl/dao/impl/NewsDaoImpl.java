package com.jianma.designyl.dao.impl;

import java.util.List;
import java.util.Optional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.jianma.designyl.dao.NewsDao;
import com.jianma.designyl.model.News;

@Repository
@Component
@Qualifier(value = "newsDaoImpl")
public class NewsDaoImpl implements NewsDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	@Override
	public void createNews(News news) {
		sessionFactory.getCurrentSession().save(news);
	}

	@Override
	public void deleteNews(int id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = " delete from News n  where n.id = ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, id);
		query.executeUpdate();
	}

	@Override
	public void updateNews(News news) {
		sessionFactory.getCurrentSession().update(news);
	}

	@Override
	public Optional<News> findNewsById(int id) {
		News news = (News) sessionFactory.getCurrentSession().get(News.class, id);
		return Optional.ofNullable(news);
	}

	@Override
	public List<News> findNewsByPage(int offset, int limit,int language) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "";
		if (language == -1){
			hql = " from News n order by publishTime desc";
		}
		else{
			hql = " from News n where n.language = ? order by publishTime desc";
		}
		
		Query query = session.createQuery(hql);
		if (language != -1){
			query.setParameter(0, (byte)language);
		}
		
		query.setFirstResult(offset);
		query.setMaxResults(limit);
		return query.list();
	}

	@Override
	public int getCountNews(int language) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "";
		if (language == -1){
			hql = "select count(n) from News n ";
		}
		else{
			hql = "select count(n) from News n where n.language = ? ";
		}
		
		Query query = session.createQuery(hql); 
		
		if (language != -1){
			query.setParameter(0, (byte)language);
		}
        return (int)((Long)query.uniqueResult()).longValue();
	}


	@Override
	public List<News> getTopNews(int language, int top) {
		Session session = sessionFactory.getCurrentSession();
		String hql = " from News where language = ? order by publishTime desc";
		Query query = session.createQuery(hql);
		query.setParameter(0, (byte)language);
		query.setMaxResults(2);
		return query.list();
	}

}
