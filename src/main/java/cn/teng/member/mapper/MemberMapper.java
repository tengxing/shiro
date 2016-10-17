package cn.teng.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.teng.member.entity.Member;
import cn.teng.utils.PageInfo;

public interface MemberMapper {
	
	/**
     * 删除用户
     *
     * @param id
     * @return
     */
    int deleteById(Long id);

    /**
     * 添加用户
     *
     * @param member
     * @return
     */
    int insert(Member member);

    /**
     * 修改用户
     *
     * @param member
     * @return
     */
    int updateUser(Member member);

    /**
     * 根据用户名查询用户
     *
     * @param username
     * @return
     */
    Member findUserByLoginName(String username);

    /**
     * 根据用户id查询用户
     *
     * @param id
     * @return
     */
    Member findUserById(Long id);

     /**
     * 用户列表
     *
     * @param pageInfo
     * @return
     */
    List findUserPageCondition(PageInfo pageInfo);

    /**
     * 统计用户
     *
     * @param pageInfo
     * @return
     */
    int findUserPageCount(PageInfo pageInfo);

    /**
     * 修改用户密码
     *
     * @param userId
     * @param pwd
     */
    void updateUserPwdById(@Param("userId") Long userId, @Param("pwd") String pwd);

    /**
     * 根据用户id查询用户带部门
     *
     * @param id
     * @return
     */
   /* Member findUserVoById(Long id);*/

}
