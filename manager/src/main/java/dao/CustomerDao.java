package dao;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pojo.Customer;
import pojo.User;


public interface CustomerDao {
	//客户是否存在
	@Select("select * from Customer where customerName=#{customerName}")
	public Customer check(String customerName);
	//客户名搜索
	@Select("select * from Customer where customerName like concat('%',#{search},'%')")
	public List<Customer> getCustomerList(String search);
	//添加新客户
	@Insert("insert into Customer(customerId,customerName,phone,dorm,type) values(#{arg0},#{arg1},#{arg2},#{arg3},#{arg4})")
	public int insert(String customerId,String customerName,String phone,String dorm,String type);
	//获取客户信息
	@Select("select * from Customer where customerId=#{customerId}")
	public Customer getCustomer(String customerId);
	//修改客户
	@Update("update Customer set customerName=#{arg0} , phone=#{arg1},dorm=#{arg2},type=#{arg3} where customerId=#{arg4}")
	public int update(String customerName,String phone,String dorm,String type,String customerId);
	//删除客户
	@Delete("delete from Customer where customerId=#{customerId}")
	public int delete(String customerId);
	//通过订单管理修改客户信息
	@Update("update Customer set customerName=#{arg0} ,phone=#{arg1},dorm=#{arg2} where customerId=#{arg3}")
	public int update2(String customerName,String phone,String dorm,String customerId);
}
