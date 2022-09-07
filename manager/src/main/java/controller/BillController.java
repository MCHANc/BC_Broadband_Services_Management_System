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

@Controller
public class BillController {

	@Autowired
	BillDao bd;
	@RequestMapping("count")
	public String count(String date,String date2,Model model) {
		if((bd.sum(date)!=null)&&(bd.sum(date2)!=null)) {
			if(date.equals(date2)) {
				model.addAttribute("count",bd.sum(date));
				return "forward:orderManage";
			}
			Double price=Double.valueOf(bd.sum(date));
			Double price2=Double.valueOf(bd.sum(date2));
			Double price3=price+price2;
			model.addAttribute("count",price3);
			return "forward:orderManage";
		}
		else {
			model.addAttribute("count",0);
			return "forward:orderManage";
		}
	}
}
