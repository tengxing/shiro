/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.teng.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author tengxing
 */
@Controller
@RequestMapping("/sign")
public class SingController extends BaseController {
   /*  @Autowired
    private SignMapper signMapper;
     
    @RequestMapping("/doSign")
    @ResponseBody
    public Object doSign(HttpServletRequest request, HttpServletResponse response) {
        
        try {
            // 先查询是否已经签到
            boolean ifHasSigned = signMapper.ifHasSigned();
            if(ifHasSigned) {
                renderError("fd");
            } else {
                Sign signEntity = new Sign();
                Date signDate = new Date();
                signEntity.setSignDate(signDate);
                signEntity.setSignDay(Long.valueOf(signDate.getDate()));
                signEntity.setIpAddress(HttpUtil.getIpAddress(request));
                signEntity.setSigner("zhoukun");
                signEntity.setStatus(1);
              //  signService.signTX(signEntity);
                //view.addObject("result", "0");
            }
            //列出这个月的所有签到 1：status
         //   List<Sign> signList = signService.listSign();
           // view.addObject("signList", signList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }*/
}
