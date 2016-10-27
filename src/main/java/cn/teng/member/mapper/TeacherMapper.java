package cn.teng.member.mapper;

import java.util.List;

import cn.teng.member.entity.Teacher;
import cn.teng.utils.PageInfo;

public interface TeacherMapper {

    /**
     * 教师列表
     *
     * @return
     */
    List<Teacher> findTeacherAll();
    /**
     * 添加教师
     * 
     * @param teacher
     */
    void insert(Teacher teacher);
    /**
     * 查询教师列表
     * 
     * @param pageInfo
     * @return
     */
	List<Teacher> findPageCondition(PageInfo pageInfo);
	 /**
     * 教师统计
     *
     * @param pageInfo
     * @return
     */
    int findPageCount(PageInfo pageInfo);
}
