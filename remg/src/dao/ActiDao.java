package dao;

import java.util.List;

import bean.activities;

public abstract interface ActiDao {
	    //�����ӿ����ݿ�Ĳ�ѯ
		public abstract int add_activities(activities acti)throws Exception;
		public abstract int del_activities(String id)throws Exception;
		public abstract List<activities> que_activities(String info)throws Exception;
		public abstract int upd_activities(activities acti)throws Exception;
		public abstract List<activities> main_activities()throws Exception;
}
