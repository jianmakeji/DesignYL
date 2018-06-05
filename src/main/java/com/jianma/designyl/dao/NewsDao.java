package com.jianma.designyl.dao;

import java.util.List;
import java.util.Optional;

import com.jianma.designyl.model.News;

public interface NewsDao {

	public void createNews(News news);
	
	public void deleteNews(int id);
	
	public void updateNews(News news);
	
	public Optional<News> findNewsById(int id);
	
	public List<News> findNewsByPage(int offset, int limit,int language);
	
	public int getCountNews(int language);
	
	public List<News> getTopNews(int language, int top);
}
