package cn.teng.member.controller;

import java.util.HashMap;
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

import cn.teng.member.entity.Teacher;
import cn.teng.member.mapper.TeacherMapper;
import cn.teng.utils.PageInfo;

@Controller
@RequestMapping("/teacher")
public class TeacherController extends BaseController {
	private static final Logger log=LoggerFactory.getLogger(TeacherController.class);
	
	@Autowired
	TeacherMapper teacherMapper;
	
	PageInfo pageList=null;
	
	@RequestMapping(value="/info",method=RequestMethod.GET)
	public String info(){
		
		return "teacher/info";
	}
	
	/**
	 * 所有数据
	 * 教师
	 * 
	 * @return
	 */
	@ResponseBody
	@Transactional
	@RequestMapping(value="/datagrid",method=RequestMethod.POST)
	public Object datagrid(Integer page, Integer rows, String sort, String order){
		 PageInfo pageInfo = new PageInfo(page, rows, sort, order);
	        Map<String, Object> condition = new HashMap<String, Object>();
	        pageInfo.setCondition(condition);
		/*Teacher teacher=new Teacher();
		String username="AAA";
		String password="AAA";
		String major="AAA";
		String teacherId="AAA";
		Integer teachAge=5;
		Integer age=22;
		String freeTime=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		String description="AAA";
		Integer status=1;
		
		teacher.setUsername(username);
		teacher.setPassword(password);
		teacher.setMajor(major);
		teacher.setTeacherId(teacherId);
		teacher.setTeachAge(teachAge);
		teacher.setAge(age);
		teacher.setFreeTime(freeTime);
		teacher.setDescription(description);
		teacher.setStatus(status);
		teacherMapper.insert(teacher);
		log.info(teacher.toString());*/
		List<Teacher> list=teacherMapper.findDataGrid(pageInfo);
		
		pageList.setRows(list);
		pageList.setTotal(31);
		log.info(pageList.toString());
		return pageList;
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Object add(@Param("username")String username,
			@Param("password")String password,
			@Param("studentId")String studentId,
			@Param("departdent")String departdent,
			@Param("major")String major,
			@Param("className")String className,
			@Param("status")Integer status){
		
		
		return renderSuccess("保存成功");
	}
	
	
}
