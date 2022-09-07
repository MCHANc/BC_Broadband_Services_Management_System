package controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.AdminDao;
import dao.UserDao;

@Controller
public class RegisterController {

	@Autowired
	UserDao ud;
	@Autowired
	AdminDao ad;
	@RequestMapping("register")
	public String toRegister() {
		return "register";
	}
	@PostMapping("register")
	public String toCheck(String userName, String password1, String password2,Model model,String admin) {
		if(userName.equals("")) {
			model.addAttribute("msg","用户名不能为空");
			return "register";
		}
		if(!password1.equals(password2)) {
			model.addAttribute("msg","两次输入密码不一致");
			model.addAttribute("userName",userName);
			return "register";
		}
		if(password1.equals("")) {
			model.addAttribute("msg","密码不能为空");
			model.addAttribute("userName",userName);
			return "register";
		}
		if(admin!=null) {
			if(ad.check(userName)!=null)
				model.addAttribute("msg","用户已存在");
			else
				if(ad.insert(userName, password2)==1) {
					model.addAttribute("msg","注册成功");
				}
				else
					model.addAttribute("msg","注册失败");
					return "register";
		}
		else {
			if(ud.check(userName)!=null) {
				model.addAttribute("msg","用户已存在");
				return "register";
			}	
			else
				if(ud.insert(userName, password2)==1)
				model.addAttribute("msg","注册成功");
				else{
					model.addAttribute("msg","注册失败");
					return "register";
				}
		}
		return "login";
	}
}
