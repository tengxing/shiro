package cn.teng.shiro;

import java.io.Serializable;
import java.util.List;

public class ShiroUser implements Serializable {

	    private static final long serialVersionUID = -1373760761780840081L;
	    public Long id;
	    public String loginName;
	    public String name;
	    public List<Long> roleList;

	    public ShiroUser(Long id, String loginName, String name, List<Long> roleList) {
	        this.id = id;
	        this.loginName = loginName;
	        this.name = name;
	        this.roleList = roleList;
	    }

	    public String getName() {
	        return name;
	    }

	    /**
	     * 本函数输出将作为默认的<shiro:principal/>输出.
	     */
	    @Override
	    public String toString() {
	        return loginName;
	    }
	
}
