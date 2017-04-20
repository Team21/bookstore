package com.bookstore.category.service;

import java.util.List;

import com.bookstore.book.dao.BookDao;
import com.bookstore.category.dao.CategoryDao;
import com.bookstore.category.domain.Category;
import com.bookstore.category.web.servlet.admin.CategoryException;



public class CategoryService {
	private CategoryDao categoryDao = new CategoryDao();
	private BookDao bookDao = new BookDao();

	/**
	 * 查询所有分类
	 * @return
	 */
	public List<Category> findAll() {
		return categoryDao.findAll();
	}

	/**
	 * 添加分类
	 * @param category
	 */
	public void add(Category category) {
		categoryDao.add(category);
	}

	/**
	 * 删除分类
	 * @param cid
	 * @throws CategoryException 
	 */
	public void delete(String cid) throws CategoryException {
		int count = bookDao.getCountByCid(cid);
		if(count > 0) throw new CategoryException("该分类下还有图书，不能删除！");
		categoryDao.delete(cid);
	}

	/**
	 * 加载分类
	 * @param cid
	 * @return
	 */
	public Category load(String cid) {
		return categoryDao.load(cid);
	}

	/**
	 * 修改分类
	 * @param category
	 */
	public void edit(Category category) {
		categoryDao.edit(category);
	} 
}
