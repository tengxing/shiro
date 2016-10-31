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
	/**
	 * 
	 * 保存学生
	 */
	void insert(Student student);
	/**
	 * 通过id删除学生
	 * @param id
	 */
	void deleteById(Integer id);
}
