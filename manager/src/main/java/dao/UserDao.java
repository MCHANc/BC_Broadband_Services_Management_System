package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pojo.User;

public interface UserDao {
	//用户是否存在
	@Select("select * from User where userName=#{userName}")
	public User check(String userName);
	//注册新用户
	@Insert("insert into User(userName,userPwd) values(#{arg0},#{arg1})")
	public int insert(String userName,String password2);
	//判断密码是否正确
	@Select("select * from User where userName=#{userName}")
	public User chekpwd(String userName);
	//用户名搜索
	@Select("select * from User where userName like concat('%',#{search},'%')")
	public List<User> getUserList(String search);
	//获取用户信息
	@Select("select * from User where userId=#{userId}")
	public User getUser(String userId);
	//禁用权限
	@Update("update User set ban='禁用' where userId=#{userId}")
	public int close(String userId);
	//开启权限
	@Update("update User set ban='开启' where userId=#{userId}")
	public int open(String userId);
	//修改用户
	@Update("update User set userName=#{arg0} , userPwd=#{arg1} where userId=#{arg2}")
	public int update(String userName,String userPwd,String userId);
	//删除用户
	@Delete("delete from User where userId=#{userId}")
	public int delete(String userId);
	
}
