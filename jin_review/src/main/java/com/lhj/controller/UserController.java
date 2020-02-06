package com.lhj.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.lhj.model.Criteria;
import com.lhj.model.LoginVO;
import com.lhj.model.MailVO;
import com.lhj.model.PageVO;
import com.lhj.model.ReviewVO;
import com.lhj.model.UserVO;
import com.lhj.service.ReviewService;
import com.lhj.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService us;

	@Autowired
	private ReviewService rs;

	@Autowired
	private JavaMailSender mailSender;

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String joinGet() {
		logger.info("joinGet..");
		return "user/join";
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String joinPost(UserVO uvo, RedirectAttributes rttr) throws Exception {
		logger.info("joinPost.." + uvo);
		us.join(uvo);
		rttr.addFlashAttribute("msg", "wsuccess");
		return "redirect:/login";

	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginGet() {
		logger.info("loginGet..");

		return "user/login";
	}

	@RequestMapping(value = "loginPost", method = RequestMethod.POST)
	public String loginPost(LoginVO lvo, HttpSession session, Model model, RedirectAttributes rttr) throws Exception {
		logger.info("loginPost..");
		UserVO uv = us.login(lvo);
		logger.info("loginPost" + uv);

		if (uv == null) {
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:login";
		}

		model.addAttribute("userVO", uv);

		if (lvo.isUseCookie()) {
			int amount = 60 * 60 * 24 * 7;
			Date sessionlimit = new Date(System.currentTimeMillis() + (1000 * amount));
			us.keepLogin(uv.getUid(), session.getId(), sessionlimit);
		}

		return "user/loginPost";
	}

	@RequestMapping("logout")
	public String logoutGet(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {
		logger.info("logout");

		Object obj = session.getAttribute("login");
		if (obj != null) {
			UserVO uv = (UserVO) obj;

			session.removeAttribute("login");
			session.invalidate();

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				us.keepLogin(uv.getUid(), session.getId(), new Date());
			}
		}

		return "redirect:/";

	}

	@ResponseBody
	@RequestMapping(value = "mailSending", method = RequestMethod.POST)
	public int mailSending(String umail) {

		int checkNum = 1;
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

			logger.info("" + umail);
			messageHelper.setFrom("limhyungjin1212@gmail.com"); // 보내는사람
			messageHelper.setSubject("세모리 이메일 인증 번호"); // 제목

			while (true) {

				checkNum = ((int) (Math.random() * 1000000));// 난수 만들기

				if (checkNum > 99999) {
					break;
				}
			}

			messageHelper.setText(("<h1>인증번호 : " + checkNum + " </h1>text/html;charset=EUC-KR")); // 내용

			/*
			 * messageHelper.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
			 * .append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
			 * .append("<a href='http://localhost:8080/lhj/user/join?checkNum="+checkNum+"")
			 * .toString()); // 내용
			 */
			messageHelper.setTo(umail); // 받는사람
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return checkNum;
	}

	@ResponseBody
	@RequestMapping(value = "nameCheck", method = RequestMethod.GET)
	public int nameCheck(String uname) throws Exception {

		logger.info("uname" + uname);

		int result = us.nameCheck(uname);
		logger.info("result" + result);

		return result;
	}

	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypageGET(@RequestParam String uid,@RequestParam String uname,Criteria cri, Model model) throws Exception {
		
		logger.info("uid="+uid);
		logger.info("uname="+uname);
		cri.setAmount(5);
		PageVO pv = new PageVO(cri, rs.myRevCount(uname));
		logger.info("pv" + pv);
		
		List myRevList = new ArrayList();
		myRevList = rs.revMyListPage(uname, cri);
		logger.info("myRevList=" + myRevList);
		
		List<UserVO> followList = new ArrayList();
		followList = us.followList(uid);
		logger.info("followList=" + followList);
		
		List<UserVO> followerList = new ArrayList();
		followerList = us.followerList(uid);
		logger.info("followerList=" + followerList);
		
		model.addAttribute("myRevList", myRevList);
		model.addAttribute("page", pv);
		model.addAttribute("followList", followList);
		model.addAttribute("followerList", followerList);
		
		
		
		return "user/mypage";
	}

	@RequestMapping(value = "userDetail", method = RequestMethod.GET)
	public String userDetail(@RequestParam String uname, HttpServletRequest req, Criteria cri, ReviewVO rv, Model model)
			throws Exception {
		logger.info("+userDetail" + uname);
		req.setAttribute("uri", req.getRequestURI().substring(req.getContextPath().length()));
		logger.info("userdetail req=" + req.getRequestURI().substring(req.getContextPath().length()));

		PageVO pv = new PageVO(cri, rs.myRevCount(uname));
		logger.info("pv" + pv);
		List myRevList = new ArrayList();
		myRevList = rs.revMyListPage(uname, cri);

		model.addAttribute("user", us.userDetail(uname));
		logger.info("user="+us.userDetail(uname));
		model.addAttribute("myRevList", myRevList);
		model.addAttribute("page", pv);

		return "main";
	}

	@RequestMapping(value = "follow", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> follow(String uid, String myid) {
		logger.info("followuname~~" + uid);
		logger.info("followmyname~~" + myid);
		ResponseEntity<String> entity = null;
			try {
				// 서비스 호출하는곳
				us.follow(uid, myid);
				entity = new ResponseEntity<String>("success", HttpStatus.OK);

			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}

		return entity;
	}

}
