package cn.teng.member.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.teng.utils.DigestUtils;
import cn.teng.utils.StringUtils;




@Controller
@RequestMapping("/")
public class LoginController extends BaseController {
    private  static  final Logger log = LoggerFactory.getLogger(LoginController. class);
    /**
     * 首页
     *
     * @return
     */
    @RequestMapping(value = "/")
    public String index() {
        return "redirect:/login";
    }

    /**
     * 首页
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/index")
    public String index(Model model) {
        return "login";
    } 

    /**
     * GET 登录
     * @return {String}
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        log.info("GET请求登录");
        if (SecurityUtils.getSubject().isAuthenticated()) {
            return "redirect:/system";
        }
        return "login";
    }

    /**
     * POST 登录 shiro检查
     *
     * @param username 用户名
     * @param password 密码
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Object loginPost(String username, String password) {
        log.info("POST请求登录");

        if (StringUtils.isBlank(username)) {
            return renderError("用户名不能为空");
        }
        if (StringUtils.isBlank(password)) {
            return renderError("密码不能为空");
        }
        Subject user = SecurityUtils.getSubject();
     /*   UsernamePasswordToken token = new UsernamePasswordToken(username, DigestUtils.md5Hex(password).toCharArray());*/
        UsernamePasswordToken token = new UsernamePasswordToken(username,DigestUtils.md5Hex(password).toCharArray());
        // 默认设置为记住密码，你可以自己在表单中加一个参数来控制
        token.setRememberMe(true);
        try {
            user.login(token);
        } catch (UnknownAccountException e) {
        	log.error("账号不存在！", e);
            return renderError("账号不存在");
        } catch (DisabledAccountException e) {
        	log.error("账号未启用！", e);
            return renderError("账号未启用");
        } catch (IncorrectCredentialsException e) {
        	log.error("密码错误！", e);
            return renderError("密码错误");
        } catch (RuntimeException e) {
        	log.error("未知错误,请联系管理员！", e);
            return renderError("未知错误,请联系管理员");
        }
        //model.setViewName("system");
       // model.setViewName("system");
       // model.addObject("member", getCurrentUser());
        log.info("login-----in");
        return renderSuccess();
    }
   
    /**
     * 进入系统主页
     * 
     * @return 
     */
    @RequestMapping(value="/home",method=RequestMethod.GET)
    public String system(HttpServletResponse response, HttpServletRequest resquest){
    	log.info("start------------------");
    	try{
    	resquest.getSession().setAttribute("member",getCurrentUser());
    	}catch (Exception e){
    		resquest.getSession().setAttribute("error",e.getStackTrace());
    		return "login";
    	}
    	log.info("stop-------------------");
    	return "home";
    }

    /**
     * 未授权
     * @return {String}
     */
    @RequestMapping(value = "/unauth")
    public String unauth() {
        if (SecurityUtils.getSubject().isAuthenticated() == false) {
            return "redirect:/login";
        }
        return "unauth";
    }

    /**
     * 退出
     * @return {Result}
     */
    @RequestMapping(value = "/logout")
    public String logout() {
        log.info("登出");
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "login";
    }

}
