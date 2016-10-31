<%-- 
    Document   : sign
    Created on : 2016-10-29, 16:37:56
    Author     : tengxing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .singer_r_img{display:block;width:114px;height:52px;line-height:45px;background:url(notebook/notebook_files/avatar.jpg) right 2px no-repeat;vertical-align:middle;*margin-bottom:-10px;text-decoration:none;}
.singer_r_img:hover{background-position:right -53px;text-decoration:none;}
.singer_r_img span{margin-left:14px;font-size:16px;font-family:'Hiragino Sans GB','Microsoft YaHei',sans-serif !important;font-weight:700;color:#165379;}
.singer_r_img.current{background:url(images/sing_sing.gif) no-repeat 0 2px;border:0;text-decoration:none;}
.sign table{border-collapse: collapse;border-spacing: 0;width:100%;}
.sign th,.sign td {width: 30px;height: 40px;text-align: center;line-height: 40px;border:1px solid #e3e3e3;}
.sign th {font-size: 16px;}
.sign td {color: #404040;vertical-align: middle;}            
.sign .on {background: url(images/sign_have.gif) no-repeat center;}
.calendar_month_next,.calendar_month_prev{width: 34px;height: 40px;cursor: pointer;background:url(images/sign_arrow.png) no-repeat;}
.calendar_month_next {float: right;background-position:-42px -6px;}
.calendar_month_span {display: inline;line-height: 40px;font-size: 16px;color: #656565;letter-spacing: 2px;font-weight: bold;}
.calendar_month_prev {float: left;background-position:-5px -6px;}
.sign_succ_calendar_title {text-align: center;width:398px;border-left:1px solid #e3e3e3;border-right:1px solid #e3e3e3;background:#fff;}
.sign_main {width: 400px;/**background-color: #FBFEFE;**/border-top:1px solid #e3e3e3;font-family: "Microsoft YaHei",SimHei;display: none;}
        </style>
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script>
    
</script>
        <script>
            var calUtil = {
        getDaysInmonth : function(iMonth, iYear){
            var dPrevDate = new Date(iYear, iMonth, 0);
            return dPrevDate.getDate();
        },
        bulidCal : function(iYear, iMonth) {
            var aMonth = new Array();
            aMonth[0] = new Array(7);
            aMonth[1] = new Array(7);
            aMonth[2] = new Array(7);
            aMonth[3] = new Array(7);
            aMonth[4] = new Array(7);
            aMonth[5] = new Array(7);
            aMonth[6] = new Array(7);
            var dCalDate = new Date(iYear, iMonth - 1, 1);
            var iDayOfFirst = dCalDate.getDay();
            var iDaysInMonth = calUtil.getDaysInmonth(iMonth, iYear);
            var iVarDate = 1;
            var d, w;
            aMonth[0][0] = "日";
            aMonth[0][1] = "一";
            aMonth[0][2] = "二";
            aMonth[0][3] = "三";
            aMonth[0][4] = "四";
            aMonth[0][5] = "五";
            aMonth[0][6] = "六";
            for (d = iDayOfFirst; d < 7; d++) {
                aMonth[1][d] = iVarDate;
                iVarDate++;
            }
            for (w = 2; w < 7; w++) {
                for (d = 0; d < 7; d++) {
                    if (iVarDate <= iDaysInMonth) {
                        aMonth[w][d] = iVarDate;
                        iVarDate++;
                    }
                }
            }
            return aMonth;
        },
        ifHasSigned : function(signList,day){
            var signed = false;
            $.each(signList,function(index,item){
                if(item.signDay == day) {
                    signed = true;
                    return false;
                }
            });
            return signed ;
        },
        drawCal : function(iYear, iMonth ,signList) {
            var myMonth = calUtil.bulidCal(iYear, iMonth);
            var htmls = new Array();
            htmls.push("<div class='sign_main' id='sign_layer'>");
            htmls.push("<div class='sign_succ_calendar_title'>");
            // htmls.push("<div class='calendar_month_next'>&nbsp;</div>");
            // htmls.push("<div class='calendar_month_prev'>&nbsp;</div>");
            htmls.push("<div class='calendar_month_span'>2015年04月</div>");
            htmls.push("</div>");
            htmls.push("<div class='sign' id='sign_cal'>");
            htmls.push("<table>");
            htmls.push("<tr>");
            htmls.push("<th>" + myMonth[0][0] + "</th>");
            htmls.push("<th>" + myMonth[0][1] + "</th>");
            htmls.push("<th>" + myMonth[0][2] + "</th>");
            htmls.push("<th>" + myMonth[0][3] + "</th>");
            htmls.push("<th>" + myMonth[0][4] + "</th>");
            htmls.push("<th>" + myMonth[0][5] + "</th>");
            htmls.push("<th>" + myMonth[0][6] + "</th>");
            htmls.push("</tr>");
            var d, w;
            for (w = 1; w < 7; w++) {
                htmls.push("<tr>");
                for (d = 0; d < 7; d++) {
                    var ifHasSigned = calUtil.ifHasSigned(signList,myMonth[w][d]);
                    console.log(ifHasSigned);
                    if(ifHasSigned){
                        htmls.push("<td class='on'>" + (!isNaN(myMonth[w][d]) ? myMonth[w][d] : "&nbsp;") + "</td>");
                    } else {
                        htmls.push("<td>" + (!isNaN(myMonth[w][d]) ? myMonth[w][d] : "&nbsp;") + "</td>");
                    }
                }
                htmls.push("</tr>");
            }
            htmls.push("</table>");
            htmls.push("</div>");
            htmls.push("</div>");
            return htmls.join('');
        }
};
            
        </script>
    <script type="text/javascript">
var ctx = "${pageContext.request.contextPath}";
/*签到模块日期捕捉：*/
function week(){
    var objDate= new Date();
    var week = objDate.getDay();
    switch(week)
        {
            case 0:
            week="周日";
            break;
            case 1:
            week="周一";
            break;
            case 2:
            week="周二";
            break;
            case 3:
            week="周三";
            break;
            case 4:
            week="周四";
            break;
            case 5:
            week="周五";
            break;
            case 6:
            week="周六";
            break;
        }
    $("#sing_for_number").html( week );
}
$(function(){
    week();
    var current = new Date();
    $(".singer_r_img").click(function(){
        var s = this;
       
        $.ajax({
            url : "${pageContext.request.contextPath}/sign/doSign",
            type : "POST",
            dataType : "json",
            error : function(data) {
                loadingComplete();
                var rst = data.result;
                if(rst == 1) {
                    showError("今天您已经签到，无须再次签到！",function(){
                        var signList = data.signList;
                        $(s).addClass("current");
                        var str = calUtil.drawCal(current.getFullYear(),current.getMonth() + 1,signList);
                        $(str).layerModel({title:"签到日历"});
                    });
                } else {
                    showSuccess("签到成功！",function(){
                        var signList = data.signList;
                        $(s).addClass("current");
                        var str = calUtil.drawCal(current.getFullYear(),current.getMonth() + 1,signList);
                        $(str).layerModel({title:"签到日历"});
                    });
                }
            }
        });
    });
});
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/layer-v1.9.2//layer/layer.js"></script>
</head>
 
<body>
        <a class="singer_r_img" href="###">       
            <span id="sing_for_number">签到</span>
        </a>
</body>
</html>
