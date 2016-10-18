package cn.teng.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/student")
public class StudetnController extends BaseController{
	private static final Logger log=LoggerFactory.getLogger(StudetnController.class);
	
	@RequestMapping(value="/updatePassword",method=RequestMethod.GET)
	public String updatePassword(){
		System.out.println("sssss");
		
		return "student/updatePassword";
	}
	
}
