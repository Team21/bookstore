package com.bookstore.order.dao;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.bookstore.book.domain.Book;
import com.bookstore.order.domain.Order;
import com.bookstore.order.domain.OrderItem;

import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;

public class OrderDao {
	private QueryRunner qr = new TxQueryRunner();
	
	/**
	 * 添加订单
	 * @param order
	 */
	public void addOrder(Order order) {
		try {
			String sql = "insert into orders values(?,?,?,?,?,?)";
			/*
			 * 处理util的Date转换成sql的Timestamp
			 */
			Timestamp timestamp = new Timestamp(order.getOrdertime().getTime());
			Object[] params = {order.getOid(), timestamp, order.getTotal(),
					order.getState(), order.getOwner().getUid(),
					order.getAddress()};
			qr.update(sql, params);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 插入订单条目
	 * @param orderItemList
	 */
	public void addOrderItemList(List<OrderItem> orderItemList) {
		
		try {
			String sql = "insert into orderitem values(?,?,?,?,?)";
			Object[][] params = new Object[orderItemList.size()][];
			for(int i = 0; i < orderItemList.size(); i++) {
				OrderItem item = orderItemList.get(i);
				params[i] = new Object[]{item.getIid(), item.getCount(), 
						item.getSubtotal(), item.getOrder().getOid(),
						item.getBook().getBid()}; 
			}
			qr.batch(sql, params);//执行批处理
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 按uid查询订单
	 * @param uid
	 * @return
	 */
	public List<Order> findByUid(String uid) {
		try {
			String sql = "select * from orders where uid=?";
			List<Order> orderList = qr.query(sql, new BeanListHandler<Order>(Order.class), uid);
			
			for(Order order : orderList) {
				loadOrderItems(order);//为order对象添加它的所有订单条目
			}
			
			return orderList;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 加载指定的订单所有的订单条目
	 * @param order
	 * @throws SQLException 
	 */
	private void loadOrderItems(Order order) throws SQLException {

		String sql = "select * from orderitem i, book b where i.bid=b.bid and oid=?";

		List<Map<String,Object>> mapList = qr.query(sql, new MapListHandler(), order.getOid());

		List<OrderItem> orderItemList = toOrderItemList(mapList);
		order.setOrderItemList(orderItemList);
	}

	/**
	 * 把mapList中每个Map转换成两个对象，并建立关系
	 * @param mapList
	 * @return
	 */
	private List<OrderItem> toOrderItemList(List<Map<String, Object>> mapList) {
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		for(Map<String,Object> map : mapList) {
			OrderItem item = toOrderItem(map);
			orderItemList.add(item);
		}
		return orderItemList;
	}

	/**
	 * 把一个Map转换成一个OrderItem对象
	 * @param map
	 * @return
	 */
	private OrderItem toOrderItem(Map<String, Object> map) {
		OrderItem orderItem = CommonUtils.toBean(map, OrderItem.class);
		Book book = CommonUtils.toBean(map, Book.class);
		orderItem.setBook(book);
		return orderItem;
	}

	/**
	 * 加载订单
	 * @param oid
	 * @return
	 */
	public Order load(String oid) {
		try {

			String sql = "select * from orders where oid=?";
			Order order = qr.query(sql, new BeanHandler<Order>(Order.class), oid);
			loadOrderItems(order);
			return order;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 *  通过oid查询订单状态
	 * @param oid
	 * @return
	 */
	public int getStateByOid(String oid) {
		try {
			String sql = "select state from orders where oid=?";
			return (Integer)qr.query(sql, new ScalarHandler(), oid);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 修改订单状态
	 * @param oid
	 * @param state
	 * @return
	 */
	public void updateState(String oid, int state) {
		try {
			String sql = "update orders set state=? where oid=?";
			qr.update(sql, state, oid);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Order> findAll() {
		try{
			String sql = "select * from orders ";
			List<Order> orderList = qr.query(sql, new BeanListHandler<Order>(Order.class));
			
			for(Order order : orderList) {
				loadOrderItems(order);//为order对象添加它的所有订单条目
			}
			
			return orderList;
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Order> find1() {
		try{
			String sql = "select * from orders where state = ?";
			List<Order> orderList = qr.query(sql, new BeanListHandler<Order>(Order.class),1);
			
			for(Order order : orderList) {
				loadOrderItems(order);//为order对象添加它的所有订单条目
			}
			
			return orderList;
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<Order> find2() {
		try{
			String sql = "select * from orders where state = ?";
			List<Order> orderList = qr.query(sql, new BeanListHandler<Order>(Order.class),2);
			
			for(Order order : orderList) {
				loadOrderItems(order);//为order对象添加它的所有订单条目
			}
			
			return orderList;
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<Order> find3() {
		try{
			String sql = "select * from orders where state = ?";
			List<Order> orderList = qr.query(sql, new BeanListHandler<Order>(Order.class),3);
			
			for(Order order : orderList) {
				loadOrderItems(order);//为order对象添加它的所有订单条目
			}
			
			return orderList;
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<Order> find4() {
		try{
			String sql = "select * from orders where state = ?";
			List<Order> orderList = qr.query(sql, new BeanListHandler<Order>(Order.class),4);
			
			for(Order order : orderList) {
				loadOrderItems(order);//为order对象添加它的所有订单条目
			}
			
			return orderList;
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
