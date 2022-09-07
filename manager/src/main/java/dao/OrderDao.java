package dao;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pojo.Customer;
import pojo.Order;
public interface OrderDao {
	//打印订单表
	@Select("SELECT * FROM myorder INNER JOIN customer ON myorder.`customerId`=customer.customerId where customerName like concat('%',#{search},'%')")
	@ResultMap("CustomerWithOrder")
	public List<Order> getOrderList(String search);
	//形成新订单
	@Insert("insert into myOrder(orderId,paymentDate,expireDate,price,director,customerId) values(#{orderId},#{paymentDate},#{expireDate},#{price},#{director},#{customerId})")
	public int insert(Order order);
	//删除订单
	@Delete("delete from myOrder where orderId=#{orderId}")
	public int delete(String orderId);
	//获取订单信息
	@Select("SELECT * FROM myorder INNER JOIN customer ON myorder.`customerId`=customer.customerId where orderId=#{orderId}")
	@ResultMap("CustomerWithOrder")
	public Order getOrder(String orderId);
	//缴费
	@Update("update myorder set expireDate=#{arg0} , price=#{arg1}  where orderId=#{arg2}")
	public int recharge(String expireDate,Double price,String orderId);
	//删除旧订单
	@Delete("delete from myOrder where customerId=#{customerId}")
	public void delete2(String customerId);
	//通过客户ID查找
	@Select("select * from myorder where customerId=#{customerId}")
	public Order getOrder2(String customerId);
}
