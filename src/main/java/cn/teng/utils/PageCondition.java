package cn.teng.utils;

import java.util.Map;
/**
 * 分页规则
 * 
 * @author tx
 *
 */
public class PageCondition {
    private int from;
    private int size;
    private int nowpage; // 当前页 
    private int pagesize; // 每页显示的记录数 
    private Map<String, Object> condition; //查询条件

    private String sort = "seq";// 排序字段
    private String order = "asc";// asc，desc mybatis Order 关键字
	public PageCondition(int from, int size, int nowpage, int pagesize, Map<String, Object> condition, String sort,
			String order) {
		super();
		this.from = from;
		this.size = size;
		this.nowpage = nowpage;
		this.pagesize = pagesize;
		this.condition = condition;
		this.sort = sort;
		this.order = order;
	}
	public PageCondition() {
		// TODO Auto-generated constructor stub
	}
	public int getFrom() {
		return from;
	}
	public void setFrom(int from) {
		this.from = from;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getNowpage() {
		return nowpage;
	}
	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public Map<String, Object> getCondition() {
		return condition;
	}
	public void setCondition(Map<String, Object> condition) {
		this.condition = condition;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
    
}
