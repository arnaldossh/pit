package com.pit.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.pit.bean.User;

public class UserDao {

	public static Connection getConnection() {
		Connection con = null;
		try {
			// Class.forName("com.mysql.jdbc.Driver");
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://192.168.15.69:3306", "arnaldo", "pass");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}

	public static int save(User u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(
					// "insert into test.register(name,password,email,sex,country)
					// values(?,?,?,?,?)");
					"insert into test.register(name,password,email,sex,country,address,cep,phone,cpf,birthdate) values(?,?,?,?,? ,?,?,?,?,?)");
			ps.setString(1, u.getName());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getSex());
			ps.setString(5, u.getCountry());

			ps.setString(6, u.getAddress());
			ps.setString(7, u.getCep());
			ps.setString(8, u.getPhone());
			ps.setString(9, u.getCpf());
			ps.setString(10, u.getBirthdate());

			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int update(User u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(
					"update test.register set name=?,password=?,email=?,sex=?,country=?,  address=?,cep=?,phone=?,cpf=?,birthdate=?    where id=?");
			ps.setString(1, u.getName());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getSex());
			ps.setString(5, u.getCountry());

			ps.setString(6, u.getAddress());
			ps.setString(7, u.getCep());
			ps.setString(8, u.getPhone());
			ps.setString(9, u.getCpf());
			ps.setString(10, u.getBirthdate());

			ps.setInt(11, u.getId());

			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int delete(User u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("delete from test.register where id=?");
			ps.setInt(1, u.getId());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}

		return status;
	}

	public static List<User> getAllRecords() {
		List<User> list = new ArrayList<User>();

		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from test.register");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("name"));
				u.setPassword(rs.getString("password"));
				u.setEmail(rs.getString("email"));
				u.setSex(rs.getString("sex"));
				u.setCountry(rs.getString("country"));

				u.setAddress(rs.getString("address"));
				u.setCep(rs.getString("cep"));
				u.setPhone(rs.getString("phone"));
				u.setCpf(rs.getString("cpf"));
				u.setBirthdate(rs.getString("birthdate"));

				list.add(u);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public static User getRecordById(int id) {
		User u = null;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from test.register where id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u = new User();
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("name"));
				u.setPassword(rs.getString("password"));
				u.setEmail(rs.getString("email"));
				u.setSex(rs.getString("sex"));
				u.setCountry(rs.getString("country"));
				
				u.setAddress(rs.getString("address"));
				u.setCep(rs.getString("cep"));
				u.setPhone(rs.getString("phone"));
				u.setCpf(rs.getString("cpf"));
				u.setBirthdate(rs.getString("birthdate"));
				
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return u;
	}

	public static List<User> getRecordsByName(String name) {
		List<User> list = new ArrayList<User>();

		try {
			Connection con = getConnection();
			String query = "select * from test.register where name like '%" + name + "%'";
			PreparedStatement ps = con.prepareStatement(query);
			// ps.setString(1,name);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("name"));
				u.setPassword(rs.getString("password"));
				u.setEmail(rs.getString("email"));
				u.setSex(rs.getString("sex"));
				u.setCountry(rs.getString("country"));

				u.setAddress(rs.getString("address"));
				u.setCep(rs.getString("cep"));
				u.setPhone(rs.getString("phone"));
				u.setCpf(rs.getString("cpf"));
				u.setBirthdate(rs.getString("birthdate"));

				list.add(u);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
}