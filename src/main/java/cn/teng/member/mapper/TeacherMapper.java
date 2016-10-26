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
     * 分页
     * 
     * @param pageInfo
     * @return
     */
	List<Teacher> findDataGrid(PageInfo pageInfo);
}
