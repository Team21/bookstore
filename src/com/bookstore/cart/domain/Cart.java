package com.bookstore.cart.domain;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;


  //购物车类
 
public class Cart {
	private Map<String,CartItem> map = new LinkedHashMap<String,CartItem>();
	

	public double getTotal() {
		// 合计=所有条目的小计之和
		BigDecimal total = new BigDecimal("0");
		for(CartItem cartItem : map.values()) {
			BigDecimal subtotal = new BigDecimal("" + cartItem.getSubtotal());
			total = total.add(subtotal);
		}
		return total.doubleValue();
	}
	

	public void add(CartItem cartItem) {
		if(map.containsKey(cartItem.getBook().getBid())) {//判断原来车中是否存在该条目
			CartItem _cartItem = map.get(cartItem.getBook().getBid());//返回原条目
			_cartItem.setCount(_cartItem.getCount() + cartItem.getCount());//设置老条目的数量为，其自己数量+新条目的数量
			map.put(cartItem.getBook().getBid(), _cartItem);
		} else {
			map.put(cartItem.getBook().getBid(), cartItem);
		}
	}
	

	public void clear() {
		map.clear();
	}
	
	public void delete(String bid) {
		map.remove(bid);
	}
	
	public Collection<CartItem> getCartItems() {
		return map.values();
	}
}
