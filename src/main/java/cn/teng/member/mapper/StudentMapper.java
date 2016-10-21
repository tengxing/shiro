package cn.teng.member.mapper;

import java.util.List;

import cn.teng.member.entity.Student;

public interface StudentMapper {
	
	/**
	 * 所有学生
	 * 
	 * @return
	 */
	List<Student> findStudentAll();
	/**
	 * 查找学生通过学号
	 * 
	 * @param studentId
	 * @return
	 */
	Student findStudentByStudentId(String studentId);
}
