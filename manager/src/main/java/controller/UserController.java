package controller;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.UserDao;
import pojo.User;
@Controller
public class UserController {
	@Autowired
	UserDao ud;
	@RequestMapping("userManage")
	public String toUser(String search,Model model,HttpSession session) {
		if(((session.getAttribute("admin")!=null))&&(boolean)session.getAttribute("admin")) {
			search=search==null ? "":search;
			model.addAttribute("search",search);
			List<User>list=ud.getUserList(search);
			model.addAttribute("list",list);
			return "userManage";
		}
		else {
			model.addAttribute("msg2","您不是管理员");
			return "main";
		}	
	}
	@RequestMapping("close")
	public String close(String userId,Model model) {
		if(ud.close(userId)==1) {
			model.addAttribute("msg","用户已禁用");
			return "forward:userManage";
		}
		return "forward:userManage";
	}
	@RequestMapping("open")
	public String open(String userId,Model model) {
		if(ud.open(userId)==1) {
			model.addAttribute("msg","用户已启用");
			return "forward:userManage";
		}
		return "forward:userManage";
	}
	
	@RequestMapping("selectuser")
	public String selectuser(String userId,Model model) {
		User selectuser=ud.getUser(userId);
		model.addAttribute("selectuser", selectuser);
		return "forward:userManage";
	}
	
	@PostMapping("update")
	public String update(String id,String userName,String password,Model model) {
		if(ud.check(userName)!=null) {
			if(!ud.getUser(id).getUserPwd().equals(password)) {
				if(ud.update(userName, password, id)==1) {
					model.addAttribute("msg","修改成功");
					return "forward:userManage";
				}
			}
			model.addAttribute("msg","该用户名已存在");
			return "forward:userManage";
		}
		if(ud.update(userName, password, id)==1) {
			model.addAttribute("msg","修改成功");
			return "forward:userManage";
		}
		return "forward:userManage";
	}
	@RequestMapping("delete")
	public String delete(String userId,Model model) {
		if(ud.delete(userId)==1) {
			model.addAttribute("msg","删除成功");
			return "forward:userManage";
		}
		return "forward:userManage";
	}
	@PostMapping("add")
	public String add(String userName,String password,Model model) {
		if(ud.check(userName)!=null) {
			model.addAttribute("msg","用户已存在");
			return "forward:userManage";
		}
		else {
			if(ud.insert(userName, password)==1) {
				model.addAttribute("msg","添加成功");
				return "forward:userManage";
			}
			return "forward:userManage";
		}
		
	}
	
	
}
