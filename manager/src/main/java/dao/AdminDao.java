package dao;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import pojo.Admin;

public interface AdminDao {

	//查找用户是否存在
	@Select("select * from Admin where adminName=#{userName}")
	public Admin check(String userName);
	//添加用户
	@Insert("insert into Admin(adminName,adminPwd) values(#{arg0},#{arg1})")
	public int insert(String userName,String password2);
	//判断密码是否正确
	@Select("select * from Admin where adminName=#{userName}")
	public Admin chekpwd(String userName);
}
