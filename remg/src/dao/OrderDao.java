package dao;

import java.util.List;

import bean.orders;

public abstract interface OrderDao {

	 //�����ӿ����ݿ�Ĳ�ѯ
	public abstract int add_orders(orders acti)throws Exception;
	public abstract int del_orders(String id)throws Exception;
	public abstract List<orders> que_orders(String info)throws Exception;
	public abstract List<orders> main_orders()throws Exception;
}
