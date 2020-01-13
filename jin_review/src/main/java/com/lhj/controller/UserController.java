package com.lhj.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lhj.model.LoginVO;
import com.lhj.model.UserVO;
import com.lhj.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService us;

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@RequestMapping(value = "join", method = RequestMethod.GET)
	public void joinGet() {
		logger.info("joinGet..");

	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public void joinPost(UserVO uvo) throws Exception {
		logger.info("joinPost.." + uvo);
		us.join(uvo);

	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void loginGet() {
		logger.info("loginGet..");

	}

	@RequestMapping(value = "loginPost", method = RequestMethod.POST)
	public void loginPost(LoginVO lvo, Model model) throws Exception {
		logger.info("loginPost..");
		UserVO uv = us.login(lvo);
		logger.info("loginPost" + uv);
		if (uv == null) {
			return;
		}
		model.addAttribute("userVO", uv);

	}

	@RequestMapping("logout")
	public String logoutGet(HttpSession session) throws Exception {
		logger.info("logout");
		session.invalidate();
		return "redirect:/";

	}

}
