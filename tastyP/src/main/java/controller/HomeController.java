package controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import controller.HomeController;
import com.my.dto.MemberVO;
import com.my.service.MemberService;

/*@Controller
public class HomeController {

	@RequestMapping("/hello")
	public String hello(Model model,@RequestParam(value="name",required=false) String name) {
		model.addAttribute("greeting","æ»≥Á«œººø‰,"+name);
		return "hello";
	}
		
}*/
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private MemberService service;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception{

		logger.info("home");
		
		List<MemberVO> memberList = service.selectMember();
		
		model.addAttribute("memberList", memberList);

		return "home";
	}
	
}


