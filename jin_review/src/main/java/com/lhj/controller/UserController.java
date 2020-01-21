package com.lhj.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String joinPost(UserVO uvo,RedirectAttributes rttr) throws Exception {
		logger.info("joinPost.." + uvo);
		us.join(uvo);
		rttr.addFlashAttribute("msg","wsuccess");
		return "redirect:/user/login";

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGet() {
		logger.info("loginGet..");

		return "user/login";
	}

	@RequestMapping(value = "loginPost", method = RequestMethod.POST)
	public String loginPost(LoginVO lvo, Model model,RedirectAttributes rttr) throws Exception {
		logger.info("loginPost..");
		UserVO uv = us.login(lvo);
		logger.info("loginPost" + uv);
		if (uv == null) {
			rttr.addFlashAttribute("msg","fail");
			return "redirect:login";
		}
		model.addAttribute("userVO", uv);
		
		return "user/loginPost";
	}

	@RequestMapping("logout")
	public String logoutGet(HttpSession session) throws Exception {
		logger.info("logout");
		session.removeAttribute("login");
		session.invalidate();
		return "redirect:/";

	}

}
