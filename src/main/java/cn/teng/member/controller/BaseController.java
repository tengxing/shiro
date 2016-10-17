package cn.teng.member.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;

import cn.teng.member.entity.Member;
import cn.teng.member.mapper.MemberMapper;
import cn.teng.shiro.ShiroUser;
import cn.teng.utils.HttpUtil;
import cn.teng.utils.JsonObject;
import cn.teng.utils.Result;
import cn.teng.utils.WriteJsonContainer;

/**
 * @description：基础 controller
 * @author：tx
 * @date：2015/10/1 14:51
 */
public abstract class BaseController {
	private static Logger logger = LoggerFactory.getLogger(BaseController.class);
    @Autowired
    private MemberMapper memberMapper;
    
    private HttpServletRequest request;
	private HttpServletResponse response;
	
	public static final String DEFAULT_PAGE = "DEFAULT_PAGE";
	
	
	@ModelAttribute
	private void init(HttpServletRequest request,HttpServletResponse response){
		this.request = request;
		this.response = response;
	}

    @InitBinder
    public void initBinder(ServletRequestDataBinder binder) {
        /**
         * 自动转换日期类型的字段格式
         */
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));

        /**
         * 防止XSS攻击
         */
        //binder.registerCustomEditor(String.class, new StringEscapeEditor(true, false));
    }

    /**
     * 获取当前登录用户对象
     * @return
     */
    public Member getCurrentUser() {
        ShiroUser user = (ShiroUser)SecurityUtils.getSubject().getSession().getAttribute("shiroUser");
        System.out.println(user.getName());
        Member currentUser = memberMapper.findUserById(user.id);
        return currentUser;
    }

    /**
     * 获取当前登录用户id
     * @return
     */
    public Long getUserId() {
        return this.getCurrentUser().getId();
    }

    /**
     * 获取当前登录用户名
     * @return
     */
    public String getStaffName() {
        return this.getCurrentUser().getName();
    }
    
    protected String getDeviceType(){
		return HttpUtil.getParameter("deviceType");
	}
	 /**
	 * 根据前端类型转换view
	 * @param viewPath
	 * @return
	 */
	protected String transView(String viewPath){
		
		String prefix = "";
		if(getDeviceType() == null){
			prefix = "web";
		}else{
			prefix = "phone";
		}
		return prefix + viewPath;
		
	}
	
	/**
	 * 获得HttpServletRequest对象
	 * @return
	 */
	protected HttpServletRequest getRequest() {
		return request;
	}




	/**
	 * 获得HttpServletResponse对象
	 * @return
	 */
	protected HttpServletResponse getResponse() {
		return response;
	}
	
	
	/**
	 * 添加基本对象到json输出
	 * @param key
	 * @param obj
	 */
	protected void writeObject(String key,Object obj){
		
		JsonObject jObj = getJsonObject();
		
		jObj.addObject(key, obj);
	}
	
	
	protected void writeData(Object obj){
		writeObject("data",obj);
	}
	
	private JsonObject getJsonObject(){
		JsonObject jObj = WriteJsonContainer.get();
		
		if(jObj == null){
			jObj = new JsonObject();
			WriteJsonContainer.set(jObj);
		}
		
		return jObj;
	}

    /**
     * ajax失败
     * @param msg 失败的消息
     * @return {Object}
     */
    public Object renderError(String msg) {
        Result result = new Result();
        result.setMsg(msg);
        return result;
    }

    /**
     * ajax成功
     * @return {Object}
     */
    public Object renderSuccess() {
        Result result = new Result();
        result.setSuccess(true);
        return result;
    }

    /**
     * ajax成功
     * @param msg 消息
     * @return {Object}
     */
    public Object renderSuccess(String msg) {
        Result result = new Result();
        result.setSuccess(true);
        result.setMsg(msg);
        return result;
    }

    /**
     * ajax成功
     * @param obj 成功时的对象
     * @return {Object}
     */
    public Object renderSuccess(Object obj) {
        Result result = new Result();
        result.setSuccess(true);
        result.setObj(obj);
        return result;
    }
}
