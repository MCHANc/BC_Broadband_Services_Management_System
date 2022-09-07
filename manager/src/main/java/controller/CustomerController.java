package controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.protobuf.TextFormat.ParseException;

import dao.BillDao;
import dao.CustomerDao;
import dao.OrderDao;
import pojo.Customer;
import pojo.Order;
import pojo.User;


@Controller
public class CustomerController {
	@Autowired
	CustomerDao cd;
	@Autowired
	OrderDao od;
	@Autowired
	BillDao bd;
	@RequestMapping("customerManage")
	public String toCustomer(String search,Model model) {
		search=search==null ? "":search;
		model.addAttribute("search",search);
		List<Customer>list=cd.getCustomerList(search);
		model.addAttribute("list",list);
		return "customerManage";
	}
	@RequestMapping("selectcustomer")
	public String selectcustomer(String customerId,Model model) {
		Customer selectcustomer=cd.getCustomer(customerId);
		model.addAttribute("selectcustomer", selectcustomer);
		return "forward:customerManage";
	}
	@PostMapping("update2")
	public String update(String id,String customerName,String phone,String dorm,String type,Model model,HttpSession session) throws java.text.ParseException {
		String type2=cd.getCustomer(id).getType();
		
		if(type2.equals(type)) {
			if(cd.update(customerName, phone, dorm,type,id)==1) {
				if(od.getOrder2(id)==null) {
					Date date=new Date();
					SimpleDateFormat dateFormat = new SimpleDateFormat("MMddhhmmss");
					SimpleDateFormat paymentDate= new SimpleDateFormat("yyyy-MM-dd");
					if(type.equals("包年")) {
						if(cd.update(customerName, phone, dorm,type,id)==1) {
							try {
								String expireDate=subYear(paymentDate.format(date));
								Order order =new Order();
								order.setOrderId(dateFormat.format(date));
								order.setPaymentDate(paymentDate.format(date));
								order.setExpireDate(expireDate);
								order.setPrice(600.00);
								order.setDirector((String)session.getAttribute("userName"));
								order.setCustomerId(id);
								if(od.insert(order)==1) {
									if(bd.insert(paymentDate.format(date), 600.00)==1) {
										model.addAttribute("msg","修改成功");
										return "forward:customerManage";
									}
									else {
										model.addAttribute("msg","修改失败");
										return "forward:customerManage";
									}
								}
								else {
									model.addAttribute("msg","办理失败");
									return "forward:customerManage";
								}
						}catch (ParseException e) {
							// TODO: handle exception
							e.printStackTrace();
						} 
					}	
				}
				if(type.equals("包月")) {
					if(cd.update(customerName, phone, dorm,type,id)==1) {
						try {
						String expireDate=subMonth(paymentDate.format(date));
						Order order =new Order();
						order.setOrderId(dateFormat.format(date));
						order.setPaymentDate(paymentDate.format(date));
						order.setExpireDate(expireDate);
						order.setPrice(50.00);
						order.setDirector((String)session.getAttribute("userName"));
						order.setCustomerId(id);
						if(od.insert(order)==1) {
							if(bd.insert(paymentDate.format(date), 50.00)==1) {
								model.addAttribute("msg","修改成功");
								return "forward:customerManage";
							}else {
								model.addAttribute("msg","修改失败");
								return "forward:customerManage";
							}
						}else {
							model.addAttribute("msg","修改失败");
							return "forward:customerManage";
						}		
					}catch (ParseException e) {
						// TODO: handle exception
						e.printStackTrace();
					} 
				}
			}	
				}
				model.addAttribute("msg","修改成功");
				return "forward:customerManage";
			}
		}else {
				Date date=new Date();
				SimpleDateFormat dateFormat = new SimpleDateFormat("MMddhhmmss");
				SimpleDateFormat paymentDate= new SimpleDateFormat("yyyy-MM-dd");
				if(type.equals("包年")) {
					if(cd.update(customerName, phone, dorm,type,id)==1) {
						try {
							String expireDate=subYear(paymentDate.format(date));
							Order order =new Order();
							order.setOrderId(dateFormat.format(date));
							order.setPaymentDate(paymentDate.format(date));
							order.setExpireDate(expireDate);
							order.setPrice(600.00);
							order.setDirector((String)session.getAttribute("userName"));
							order.setCustomerId(id);
							if(od.getOrder2(id)!=null) {
								od.delete2(id);
							}
							if(od.insert(order)==1) {
								if(bd.insert(paymentDate.format(date), 600.00)==1) {
									model.addAttribute("msg","修改成功");
									return "forward:customerManage";
								}
								else {
									model.addAttribute("msg","修改失败");
									return "forward:customerManage";
								}
							}
							else {
								model.addAttribute("msg","办理失败");
								return "forward:customerManage";
							}
					}catch (ParseException e) {
						// TODO: handle exception
						e.printStackTrace();
					} 
				}	
			}
			if(type.equals("包月")) {
				if(cd.update(customerName, phone, dorm,type,id)==1) {
					try {
					String expireDate=subMonth(paymentDate.format(date));
					Order order =new Order();
					order.setOrderId(dateFormat.format(date));
					order.setPaymentDate(paymentDate.format(date));
					order.setExpireDate(expireDate);
					order.setPrice(50.00);
					order.setDirector((String)session.getAttribute("userName"));
					order.setCustomerId(id);
					if(od.getOrder2(id)!=null) {
						od.delete2(id);
					}
					if(od.insert(order)==1) {
						if(bd.insert(paymentDate.format(date), 50.00)==1) {
							model.addAttribute("msg","修改成功");
							return "forward:customerManage";
						}else {
							model.addAttribute("msg","修改失败");
							return "forward:customerManage";
						}
					}else {
						model.addAttribute("msg","修改失败");
						return "forward:customerManage";
					}		
				}catch (ParseException e) {
					// TODO: handle exception
					e.printStackTrace();
				} 
			}
		}	
	
}
		return "forward:customerManage";
}
	@PostMapping("update3")
	public String update3(String id,String customerName,String phone,String dorm,Model model) {
		if(cd.update2(customerName, phone, dorm,id)==1) {
			model.addAttribute("msg","修改成功");
			return "forward:orderManage";
		}
		return "forward:orderManage";
	}
	@RequestMapping("delete2")
	public String delete(String customerId,Model model) {
		if(cd.delete(customerId)==1) {
			model.addAttribute("msg","删除成功");
			return "forward:customerManage";
		}
		return "forward:customerManage";
	}
	@PostMapping("add2")
	public String add(String customerId,String customerName,String phone,String dorm,String type,Model model,HttpSession session) throws java.text.ParseException {
		if(cd.getCustomer(customerId)!=null) {
			model.addAttribute("msg","学号已存在");
			return "forward:customerManage";
		}
		else {
			if(cd.insert(customerId,customerName, phone,dorm,type)==1) {
				Date date=new Date();
				SimpleDateFormat dateFormat = new SimpleDateFormat("MMddhhmmss");
				SimpleDateFormat paymentDate= new SimpleDateFormat("yyyy-MM-dd");
				if(type.equals("包年")) {
					try {
						String expireDate=subYear(paymentDate.format(date));
						Order order =new Order();
						order.setOrderId(dateFormat.format(date));
						order.setPaymentDate(paymentDate.format(date));
						order.setExpireDate(expireDate);
						order.setPrice(600.00);
						order.setDirector((String)session.getAttribute("userName"));
						order.setCustomerId(customerId);
						if(od.insert(order)==1) {
							if(bd.insert(paymentDate.format(date), 600.00)==1) {
								model.addAttribute("msg","办理成功");
								return "forward:customerManage";
							}
							else {
								model.addAttribute("msg","办理失败");
								return "forward:customerManage";
							}
						}
						else {
							model.addAttribute("msg","办理失败");
							return "forward:customerManage";
						}
					}catch (ParseException e) {
						// TODO: handle exception
						e.printStackTrace();
					} 
				}
				if(type.equals("包月")) {
					try {
						String expireDate=subMonth(paymentDate.format(date));
						Order order =new Order();
						order.setOrderId(dateFormat.format(date));
						order.setPaymentDate(paymentDate.format(date));
						order.setExpireDate(expireDate);
						order.setPrice(50.00);
						order.setDirector((String)session.getAttribute("userName"));
						order.setCustomerId(customerId);
						if(od.insert(order)==1) {
							if(bd.insert(paymentDate.format(date), 50.00)==1) {
								model.addAttribute("msg","办理成功");
								return "forward:customerManage";
							}else {
								model.addAttribute("msg","办理失败");
								return "forward:customerManage";
							}
						}else {
							model.addAttribute("msg","办理失败");
							return "forward:customerManage";
						}
							
					}catch (ParseException e) {
						// TODO: handle exception
						e.printStackTrace();
					} 
				}
				return "forward:customerManage";
			}
			return "forward:customerManage";
		}	
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
