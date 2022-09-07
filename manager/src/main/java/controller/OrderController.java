package controller;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.protobuf.TextFormat.ParseException;

import dao.BillDao;
import dao.OrderDao;
import pojo.Customer;
import pojo.Order;
@Controller
public class OrderController {

	@Autowired
	OrderDao od;
	@Autowired
	BillDao bd;
	@RequestMapping("orderManage")
	public String toOrder(String search,Model model) {
		search=search==null ? "":search;
		model.addAttribute("search",search);
		List<Order>list=od.getOrderList(search);
		model.addAttribute("list",list);
		return "orderManage";
	}
	@RequestMapping("delete3")
	public String delete(String orderId,Model model) {
		if(od.delete(orderId)==1) {
			model.addAttribute("msg","删除成功");
			return "forward:orderManage";
		}
		return "forward:orderManage";
	}
	@RequestMapping("selectorder")
	public String selectorder(String orderId,Model model) {
		Order selectorder=od.getOrder(orderId);
		model.addAttribute("selectorder", selectorder);
		return "forward:orderManage";
	}
	@RequestMapping("recharge")
	public String recharge(String orderId,Model model) throws java.text.ParseException {
		Order order=od.getOrder(orderId);
		if(order.getCustomer().getType().equals("包年")) {
			try {
				String expireDate=subYear(order.getExpireDate());
				Double price=600+order.getPrice();
				if(od.recharge(expireDate, price, orderId)==1) {
					Date paymentDate=new Date();
					SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
					if(bd.insert(sdf.format(paymentDate), 600.00)==1) {
						model.addAttribute("msg","续费成功");
						return "forward:orderManage";
					}else {
						model.addAttribute("msg","续费失败");
						return "forward:orderManage";
					}
				}else {
					model.addAttribute("msg","续费失败");
					return "forward:orderManage";
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(order.getCustomer().getType().equals("包月")) {
			try {
				String expireDate=subMonth(order.getExpireDate());
				Double price=50+order.getPrice();
				if(od.recharge(expireDate, price,orderId)==1) {
					Date paymentDate=new Date();
					SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
					if(bd.insert(sdf.format(paymentDate), 50.00)==1) {
						model.addAttribute("msg","续费成功");
						return "forward:orderManage";
					}else {
						model.addAttribute("msg","续费失败");
						return "forward:orderManage";
					}
				}else {
					model.addAttribute("msg","续费失败");
					return "forward:orderManage";
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "forward:orderManage";
	}
	public String subYear(String date)throws ParseException, java.text.ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date dt=sdf.parse(date);
		Calendar rightNow=Calendar.getInstance();
		rightNow.setTime(dt);
		rightNow.add(Calendar.YEAR, 1);
		Date dt1=rightNow.getTime();
		String reStr=sdf.format(dt1);
		return reStr;
	}
	public String subMonth(String date)throws ParseException, java.text.ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date dt=sdf.parse(date);
		Calendar rightNow=Calendar.getInstance();
		rightNow.setTime(dt);
		rightNow.add(Calendar.MONTH, 1);
		Date dt1=rightNow.getTime();
		String reStr=sdf.format(dt1);
		return reStr;
	}
}
