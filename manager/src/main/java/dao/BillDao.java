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


public interface BillDao {
	//添加一条付款记录
	@Insert("insert into bill(paymentDate,price) values(#{arg0},#{arg1})")
	public int insert(String paymentDate,Double price );
	//统计金额
	@Select("SELECT SUM(price) FROM bill where paymentDate=#{paymentDate}")
	public String sum(String paymentDate);
}
