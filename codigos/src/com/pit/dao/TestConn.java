package com.pit.dao;

public class TestConn {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(UserDao.getConnection());
		System.out.println(UserDao.getAllRecords().get(1).getName());
	}

}
