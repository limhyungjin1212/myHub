package com.lhj.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lhj.model.LoginVO;
import com.lhj.model.MailVO;
import com.lhj.model.UserVO;
import com.lhj.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService us;

	@Autowired
	private JavaMailSender mailSender;
	
	
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
	
	
	
	@ResponseBody
	@RequestMapping(value="mailSending" , method = RequestMethod.POST)
	public int mailSending(String umail) {
		
		int checkNum=1;
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"utf-8");
			
			logger.info(""+umail);
			messageHelper.setFrom("limhyungjin1212@gmail.com"); //보내는사람
			messageHelper.setSubject("세모리 이메일 인증 번호"); //제목

			while (true) {

				checkNum = ((int) (Math.random() * 1000000));//난수 만들기

				if (checkNum > 99999) {
					break;
				}
			}
			
			messageHelper.setText(("<h1>인증번호 : "+checkNum+" </h1>text/html;charset=EUC-KR")); // 내용
			
			/*
			 * messageHelper.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
			 * .append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
			 * .append("<a href='http://localhost:8080/lhj/user/join?checkNum="+checkNum+"")
			 * .toString()); // 내용
			 */			
			messageHelper.setTo(umail); //받는사람
			mailSender.send(message);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return checkNum;
	}
	
	
	@ResponseBody
	@RequestMapping(value="nameCheck", method = RequestMethod.GET)
	public int nameCheck(String uname) throws Exception	{
		
		logger.info("uname"+uname);
		
		int result = us.nameCheck(uname);
		logger.info("result"+result);
		
		return result;
	}

}
