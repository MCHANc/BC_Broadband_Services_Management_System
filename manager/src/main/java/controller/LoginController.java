package controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.AdminDao;
import dao.UserDao;
@Controller
public class LoginController {

	@Autowired
	UserDao ud;
	@Autowired
	AdminDao ad;
	@RequestMapping("login")
	public String toLogin() {
		return "login";
	}
	@PostMapping("login")
	public String tocheck(String userName,String password,String admin,Model model,HttpSession session) {
		if(userName.equals("")) {
			model.addAttribute("msg","用户名不能为空");
			return "login";
		}
		if(password.equals("")) {
			model.addAttribute("msg","密码不能为空");
			model.addAttribute("userName",userName);
			return "login";
		}
		if(admin!=null) {
			if(ad.check(userName)==null) {
				model.addAttribute("msg","用户不存在");
				model.addAttribute("userName",userName);
				return "login";
			}
			else if(!ad.chekpwd(userName).getAdminPwd().equals(password)){
				model.addAttribute("msg","密码错误");
				model.addAttribute("userName",userName);
				return "login";
			}
			else {
				session.setAttribute("userName", userName);
				session.setAttribute("islogin", "true");
				session.setAttribute("admin", true);
				return "forward:main";
			}
				
		}
		else {
			if(ud.check(userName)==null) {
				model.addAttribute("msg","用户不存在");
				model.addAttribute("userName",userName);
				return "login";
			}
			else if(!ud.chekpwd(userName).getUserPwd().equals(password)){
				model.addAttribute("msg","密码错误");
				model.addAttribute("userName",userName);
				return "login";
			}
			else {
				session.setAttribute("userName", userName);
				session.setAttribute("islogin", "true");
				return "forward:main";
			}
		}
	}
	//退出
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "forward:login";
	}
}
