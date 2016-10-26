package cn.teng.member.controller;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.teng.member.entity.Member;
import cn.teng.member.entity.Student;
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
		List<Student> list=studentMapper.findStudentAll();
		log.info((list.toString()==null)? "null":"not null");
		return list;
	}
	
	/**
	 * 添加学生页
	 * 
	 * @return
	 */
	@RequestMapping(value="/addPage",method=RequestMethod.GET)
	public String addPage(){
		return "student/addPage";
	}
	
	/**
	 * 保存学生
	 * 
	 * @param student
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Object add(@Param("username")String username,
			@Param("password")String password,
			@Param("studentId")String studentId,
			@Param("departdent")String departdent,
			@Param("major")String major,
			@Param("className")String className,
			@Param("status")Integer status){
		Student student=new Student();
		student.setUsername(username);
		student.setPassword(password);
		student.setStudentId(studentId);
		student.setDepartdent(departdent);
		student.setMajor(major);
		student.setClassName(className);
		student.setStatus(status);
		log.info(student.toString());
		try{
		studentMapper.insert(student);
		}catch (Exception e){
			e.printStackTrace();
			return renderError("保存出错");
			
		}
		log.info("ok");
		
		return renderSuccess("保存成功");
	}
	
	
	
}
