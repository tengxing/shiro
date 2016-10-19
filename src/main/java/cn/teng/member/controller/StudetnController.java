package cn.teng.member.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.teng.member.entity.Member;
import cn.teng.member.mapper.MemberMapper;
import cn.teng.member.mapper.StudentMapper;
/**
 * 学生控制类
 * 
 * @author tx
 *
 */
@Controller
@RequestMapping("/student")
public class StudetnController extends BaseController{
	private static final Logger log=LoggerFactory.getLogger(StudetnController.class);
	/**
	 * 注入学生Mapper
	 */
	@Autowired
	private StudentMapper studentMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	/**
	 * 修改密码
	 * 
	 * @return
	 */
	@RequestMapping(value="/updatePassword",method=RequestMethod.GET)
	public String updatePassword(){
		System.out.println("sssss");
		
		return "student/updatePassword";
	}
	
	/**
	 * 保存密码
	 * 
	 * @return
	 */
	@RequestMapping(value="/savePassword",method=RequestMethod.GET)
	public String savePassword(){
		System.out.println("sssss");
		
		return "student/updatePassword";
	}
	
	@RequestMapping("/info")
	public String info(Map<String,Object> map){
		
		//map.put("member", getCurrentUser());
		return "student/info";
	}
	
	/**
	 * 学生数据
	 * 
	 * 事务操作 
	 * @return
	 */
	@RequestMapping("/datagrid")
	@ResponseBody
	@Transactional 
	public Object datagrid(){
		List<Member> list=memberMapper.findStudentAll();
		log.info((list.toString()==null)? "null":"not null");
		return list;
	}
	
	
	
}
