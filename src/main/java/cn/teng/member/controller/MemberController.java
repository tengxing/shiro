package cn.teng.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController extends BaseController{
	private static final Logger log=LoggerFactory.getLogger(MemberController.class);
	
	
}
