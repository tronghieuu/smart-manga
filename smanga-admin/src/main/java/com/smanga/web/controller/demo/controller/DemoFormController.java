package com.smanga.web.controller.demo.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSON;
import com.smanga.common.core.domain.AjaxResult;
import com.smanga.common.core.domain.CxSelect;
import com.smanga.common.json.JSONObject;
import com.smanga.common.json.JSONObject.JSONArray;
import com.smanga.common.utils.StringUtils;

/**
 * Form related
 * 
 * @author Trong Hieu
 */
@Controller
@RequestMapping("/demo/form")
public class DemoFormController
{
    private String prefix = "demo/form";

    private final static List<UserFormModel> users = new ArrayList<UserFormModel>();
    {
        users.add(new UserFormModel(1, "1000001", "Test 1", "15888888888"));
        users.add(new UserFormModel(2, "1000002", "Test 2", "15666666666"));
        users.add(new UserFormModel(3, "1000003", "Test 3", "15666666666"));
        users.add(new UserFormModel(4, "1000004", "Test 4", "15666666666"));
        users.add(new UserFormModel(5, "1000005", "Test 5", "15666666666"));
    }

    /**
     * Button page
     */
    @GetMapping("/button")
    public String button()
    {
        return prefix + "/button";
    }

    /**
     * Drop down box
     */
    @GetMapping("/select")
    public String select()
    {
        return prefix + "/select";
    }

    /**
     * Timeline
     */
    @GetMapping("/timeline")
    public String timeline()
    {
        return prefix + "/timeline";
    }

    /**
     * Form validation
     */
    @GetMapping("/validate")
    public String validate()
    {
        return prefix + "/validate";
    }

    /**
     * Function extension (including file upload)
     */
    @GetMapping("/jasny")
    public String jasny()
    {
        return prefix + "/jasny";
    }

    /**
     * Drag sort
     */
    @GetMapping("/sortable")
    public String sortable()
    {
        return prefix + "/sortable";
    }

    /**
     * Tabs & Panels
     */
    @GetMapping("/tabs_panels")
    public String tabs_panels()
    {
        return prefix + "/tabs_panels";
    }

    /**
     * Grid
     */
    @GetMapping("/grid")
    public String grid()
    {
        return prefix + "/grid";
    }

    /**
     * Form wizard
     */
    @GetMapping("/wizard")
    public String wizard()
    {
        return prefix + "/wizard";
    }

    /**
     * File Upload
     */
    @GetMapping("/upload")
    public String upload()
    {
        return prefix + "/upload";
    }

    /**
     * Date and time page
     */
    @GetMapping("/datetime")
    public String datetime()
    {
        return prefix + "/datetime";
    }

    /**
     * Mutual selection of components
     */
    @GetMapping("/duallistbox")
    public String duallistbox()
    {
        return prefix + "/duallistbox";
    }

    /**
     * Basic form
     */
    @GetMapping("/basic")
    public String basic()
    {
        return prefix + "/basic";
    }

    /**
     * Card list
     */
    @GetMapping("/cards")
    public String cards()
    {
        return prefix + "/cards";
    }

    /**
     * summernote rich text editor
     */
    @GetMapping("/summernote")
    public String summernote()
    {
        return prefix + "/summernote";
    }

    /**
     * Search auto completion
     */
    @GetMapping("/autocomplete")
    public String autocomplete()
    {
        return prefix + "/autocomplete";
    }

    /**
     * Multi-level linkage pull-down
     */
    @GetMapping("/cxselect")
    public String cxselect(ModelMap mmap)
    {
        CxSelect cxSelectTB = new CxSelect();
        cxSelectTB.setN("Taobao");
        cxSelectTB.setV("taobao");
        CxSelect cxSelectTm = new CxSelect();
        cxSelectTm.setN("Tmall");
        cxSelectTm.setV("tm");
        CxSelect cxSelectJhs = new CxSelect();
        cxSelectJhs.setN("Cost-effective");
        cxSelectJhs.setV("jhs");
        List<CxSelect> tmList = new ArrayList<CxSelect>();
        tmList.add(cxSelectTm);
        tmList.add(cxSelectJhs);
        cxSelectTB.setS(tmList);

        CxSelect cxSelectJD = new CxSelect();
        cxSelectJD.setN("Jingdong");
        cxSelectJD.setV("jd");
        CxSelect cxSelectCs = new CxSelect();
        cxSelectCs.setN("JD Supermarket");
        cxSelectCs.setV("jdcs");
        CxSelect cxSelectSx = new CxSelect();
        cxSelectSx.setN("Jingdong Fresh");
        cxSelectSx.setV("jdsx");
        List<CxSelect> jdList = new ArrayList<CxSelect>();
        jdList.add(cxSelectCs);
        jdList.add(cxSelectSx);
        cxSelectJD.setS(jdList);

        List<CxSelect> cxList = new ArrayList<CxSelect>();
        cxList.add(cxSelectTB);
        cxList.add(cxSelectJD);

        mmap.put("data", JSON.toJSON(cxList));
        return prefix + "/cxselect";
    }

    /**
     * Partial refresh
     */
    @GetMapping("/localrefresh")
    public String localRefresh(ModelMap mmap)
    {
    	JSONArray list = new JSONArray();
    	JSONObject item = new JSONObject();
    	item.put("name", "This task data is passed to the page by ModelMap. After clicking the Add button, this data will be replaced with new data");
    	item.put("type", "default");
    	item.put("date", "2020.06.10");
    	list.add(item);
    	mmap.put("tasks",list);
    	mmap.put("min",2);
    	mmap.put("max",10);
        return prefix + "/localrefresh";
    }
    
    /**
     * Partial refresh-add task
     * @param	fragment	Template name in the page
     * @param	taskName	mission name
     */
    @PostMapping("/localrefresh/task")
    public String localRefreshTask(String fragment,String taskName,ModelMap mmap)
    {
    	JSONArray list = new JSONArray();
    	JSONObject item = new JSONObject();
    	item.put("name", StringUtils.defaultIfBlank(taskName, "Understand the use of equipment, purchases and related important trackers in various cities through the telephone sales process"));
    	item.put("type", "Add");
    	item.put("date", "2018.06.10");
    	list.add(item);
    	item = new JSONObject();
    	item.put("name", "Improve your telemarketing skills and communicate with customers flexibly and professionally");
    	item.put("type", "Add");
    	item.put("date", "2018.06.12");
    	list.add(item);
    	mmap.put("tasks",list);
        return prefix + "/localrefresh::" + fragment;
    }
    
    /**
     * Simulation data
     */
    @GetMapping("/cityData")
    @ResponseBody
    public String cityData()
    {
        String data = "[{\"n\":\"Hunan Province\",\"s\":[{\"n\":\"Changsha City\",\"s\":[{\"n\":\"Furong District\"},{\"n\":\"Tianxin District\"},{\"n\":\"Yuelu District\"},{\"n\":\"Kaifu District\"},{\"n\":\"Yuhua District\"},{\"n\":\"Wangcheng District\"},{\"n\":\"Changsha County\"},{\"n\":\"Ningxiang County\"},{\"n\":\"Liuyang City\"}]},{\"n\":\"Zhuzhou City\",\"s\":[{\"n\":\" Lotus pond\"},{\"n\":\"Lusong District\"},{\"n\":\"Shifeng District\"},{\"n\":\"Tianyuan District\"},{\"n\":\"Zhuzhou County\" },{\"n\":\"You County\"},{\"n\":\"Chaling County\"},{\"n\":\"Yanling County\"},{ \"n\":\"Liling City\"}]},{\"n\":\"Xiangtan City\",\"s\":[{\"n\":\"Yuhu District\" },{\"n\":\"Yuetang District\"},{\"n\":\"Xiangtan County\"},{\"n\":\"Xiangxiang City\"},{ \"n\":\"Shaoshan City\"}]},{\"n\":\"Hengyang City\",\"s\":[{\"n\":\"Zhuhui District\"},{\"n\":\"Yanfeng District\"},{\"n\":\"Shigu District\"},{\"n\":\"Zongxiang District\"} ,{\"n\":\"Nanyue District\"},{\"n\":\"Hengyang County\"},{\"n\":\"Hengnan County\"},{\" n\":\"Hengshan County\"},{\"n\":\"Hengdong County\"},{\"n\":\"Qidong County\"},{\"n\" :\"Leiyang City\"},{\"n\":\"Changning City\"}]},{\"n\":\"Shaoyang City\",\"s\":[{\"n\":\"Shuangqing District\"},{\"n\":\"Daxiang District\"},{\"n\":\"North Tower District\"},{\"n\":\"Shaodong County \"},{\"n\":\"Xinshao County\"},{\"n\":\"Shaoyang County\"},{\"n\":\"Longhui County\"} ,{\"n\":\"Dongkou County\"},{\"n\":\"Suining County\"},{\"n\":\"Xinning County\"},{\"n \":\"Chengbu Miao Autonomous County\"},{\"n\":\"Wugang City\"}]},{\"n\":\"Yueyang City\",\"s\" :[{\"n\":\"Yueyang Tower District\"},{\"n\":\"Yunxi District\"},{\"n\":\"Junshan District\"},{\"n\":\"Yueyang County\"},{\"n\":\"Huarong County\"},{\"n\":\"Xiangyin County\"},{\"n\" :\"Pingjiang County\"},{\"n\":\"Miluo City\"},{\"n\":\"Linxiang City\"}]},{\"n\":\"Changde City\",\"s\":[{\"n\":\"Wuling District\"},{\"n\":\"Dingcheng District\"},{\"n\": \"Anxiang County\"},{\"n\":\"Hanshou County\"},{\"n\":\"Lixian\"},{\"n\":\"Linli County\"},{\"n\":\"Taoyuan County\"},{\"n\":\"Shimen County\"},{\"n\":\"Tianjin City\"}]},{\"n\":\"Zhangjiajie City\",\"s\":[{\"n \":\"Yongding District\"},{\"n\":\"Wulingyuan District\"},{\"n\":\"Cili County\"},{\"n\":\"Sangzhi County\"}]},{\"n\":\"Yiyang City\",\"s\":[{\"n\":\"Ziyang District\"},{\"n \":\"Heshan District\"},{\"n\":\"South County\"},{\"n\":\"Taojiang County\"},{\"n\":\" Anhua County\"},{\"n\":\"Yuanjiang City\"}]},{\"n\":\"Chenzhou City\",\"s\":[{\"n\":\"Beihu District\"},{\"n\":\"Su Xian District\"},{\"n\":\"Guiyang County\"},{\"n\":\"Yizhang County\"},{\"n\":\"Yongxing County\"},{\"n\":\"Jiahe County\"},{\"n\":\"Linwu County\"},{\"n\":\"Rucheng County\"},{\"n\":\"Guidong County\"},{\"n\":\"Anren County\" },{\"n\":\"Zixing City\"}]},{\"n\":\"Yongzhou\",\"s\":[{\"n\":\" Lingling District\"},{\"n\":\"Lengshuitan District\"},{\"n\":\"Qiyang County\"},{\"n\":\"Dong'an County\"},{\"n\":\"Shuangpai County\"},{\"n\":\"Dao County\"},{\"n\":\"Jiangyong County\"}, {\"n\":\"Ningyuan County\"},{\"n\":\"Lanshan County\"},{\"n\":\"Xintian County\"},{\" n\":\"Jianghua Yao Autonomous County\"}]},{\"n\":\"Huaihua City\",\"s\":[{\"n\":\"Hecheng District\"},{\"n\":\"Zhongfang County\"},{\"n\":\"Yuanling County\"},{\"n\":\"Chenxi County\"},{\"n\":\"Xupu County\"},{\"n\":\"Huitong County\"},{\"n\":\"Mayang Miao Autonomous County\"},{\"n\":\"Xinhuang Dong Autonomous County\" },{\"n\":\"Zhijiang Dong Autonomous County\"},{\"n\":\"Jingzhou Miao and Dong Autonomous County\"},{\"n\":\"Tong Dong Autonomous County\"},{\"n\":\"Hongjiang City\"}]},{\"n\":\"Loudi City\",\"s\":[{\"n\":\" Louxing District\"},{\"n\":\"Shuangfeng County\"},{\"n\":\"Xinhua County\"},{\"n\":\"Lengshuijiang City\"},{\"n\":\"Lianyuan City\"}]},{\"n\":\"Xiangxi Tujia and Miao Autonomous Prefecture\",\"s\":[{\" n\":\"Jishou City\"},{\"n\":\"Luxi County\"},{\"n\":\"Phoenix County\"},{\"n\": \"Huayuan County\"},{\"n\":\"Baojing County\"},{\"n\":\"Guzhang County\"},{\"n\":\"Yong Shun County\"},{\"n\":\"Longshan County\"}]}]},{\"n\":\"Guangdong Province\",\"s\":[{\"n \":\"Guangzhou City\",\"s\":[{\"n\":\"Liwan District\"},{\"n\":\"Yuexiu District\"},{\" n\":\"Haizhu District\"},{\"n\":\"Tianhe District\"},{\"n\":\"Baiyun District\"},{\"n\":\"Huangpu District\"},{\"n\":\"Panyu District\"},{\"n\":\"Huadu District\"},{\"n\":\"Nansha District\"},{\"n\":\"Luogang District\"},{\"n\":\"Zengcheng\"},{\"n\":\"Conghua City\"}]} ,{\"n\":\"Shaoguan City\",\"s\":[{\"n\":\"Wujiang District\"},{\"n\":\"Zhenjiang District\"},{\"n\":\"Qujiang District\"},{\"n\":\"Shixing County\"},{\"n\":\"Renhua County\"} ,{\"n\":\"Wengyuan County\"},{\"n\":\"Ruyuan Yao Autonomous County\"},{\"n\":\"Xinfeng County\"},{ \"n\":\"Lechang City\"},{\"n\":\"Nanxiong City\"}]},{\"n\":\"Shenzhen\",\"s\":[{\"n\":\"Luohu District\"},{\"n\":\"Futian District\"},{\"n\":\"Nanshan District\"},{\"n\":\"Baoan District\"},{\"n\":\"Longgang District\"},{\"n\":\"Yantian District\" }]},{\"n\":\"Zhuhai City\",\"s\":[{\"n\":\"Xiangzhou District\"},{\"n\":\"Doumen District\"},{\"n\":\"Golden Bay District\"}]},{\"n\":\"Shantou City\",\"s\":[{\"n\" :\"Longhu District\"},{\"n\":\"Jinping District\"},{\"n\":\"Haojiang District\"},{\"n\":\"Chaoyang District\"},{\"n\":\"Chaonan District\"},{\"n\":\"Chenghai District\"},{\"n\":\"Nan'ao County\"} ]},{\"n\":\"Foshan City\",\"s\":[{\"n\":\"Chancheng District\"},{\"n\":\"South China Sea District\"},{\"n\":\"Shunde District\"},{\"n\":\"Sanshui District\"},{\"n\":\"Gaoming District\"} ]},{\"n\":\"Jiangmen City\",\"s\":[{\"n\":\"Pengjiang District\"},{\"n\":\"Jianghai District\"},{\"n\":\"Xinhui District\"},{\"n\":\"Taishan City\"},{\"n\":\"Kaiping City\"} ,{\"n\":\"Heshan City\"},{\"n\":\"Enping City\"}]},{\"n\":\"Zhanjiang City\",\"s \":[{\"n\":\"Chikan District\"},{\"n\":\"Xiashan District\"},{\"n\":\"Potou District\"} ,{\"n\":\"Ma Zhang District\"},{\"n\":\"Suixi County\"},{\"n\":\"Xuwen County\"},{\"n\":\"Lianjiang City\"},{\"n\":\"Leizhou City\"},{\"n\":\"Wuchuan City\"}]},{\"n \":\"Maoming City\",\"s\":[{\"n\":\"Maonan District\"},{\"n\":\"Maogang District\"},{ \"n\":\"Dianbai County\"},{\"n\":\"Gaozhou City\"},{\"n\":\"Huazhou City\"},{\"n\":\"Xinyi City\"}]},{\"n\":\"Zhaoqing City\",\"s\":[{\"n \":\"Duanzhou District\"},{\"n\":\"Dinghu District\"},{\"n\":\"Guangning County\"},{\"n\":\"Huaiji County\"},{\"n\":\"Fengkai County\"},{\"n\":\"Deqing County\"},{\"n\":\"Gao Yao City\"},{\"n\":\"Sihui City\"}]},{\"n\":\"Huizhou\",\"s\":[{\"n\" :\"Huicheng District\"},{\"n\":\"Huiyang District\"},{\"n\":\"Boluo County\"},{\"n\":\"Hui Dong County\"},{\"n\":\"Longmen County\"}]},{\"n\":\"Meizhou City\",\"s\":[{\"n\" :\"Meijiang District\"},{\"n\":\"Mei County\"},{\"n\":\"Dapu County\"},{\"n\":\"Feng Shun County\"},{\"n\":\"Wuhua County\"},{\"n\":\"Pingyuan County\"},{\"n\":\"Jiaoling County \"},{\"n\":\"Xingning City\"}]},{\"n\":\"Shanwei City\",\"s\":[{\"n\": \"Urban City\"},{\"n\":\"Haifeng County\"},{\"n\":\"Luhe County\"},{\"n\":\"Lufeng City\"}]},{\"n\":\"Heyuan City\",\"s\":[{\"n\":\"Yuancheng District\"},{\"n\":\"Zijin County\"},{\"n\":\"Longchuan County\"},{\"n\":\"Lianping County\"},{\"n\":\"Heping County\"},{\"n\":\"Dongyuan County\"}]},{\"n\":\"Yangjiang City\",\"s\":[{\"n\":\"Jiangcheng District\"},{\"n\":\"Yangxi County\"},{\"n\":\"Yangdong County\"},{\"n\":\"Yangchun City \"}]},{\"n\":\"Qingyuan City\",\"s\":[{\"n\":\"Qingcheng District\"},{\"n\":\"Qingxin District\"},{\"n\":\"Fogang County\"},{\"n\":\"Yangshan County\"},{\"n\":\"Lianshan Zhuang and Yao Autonomous County\"},{\"n\":\"Liannan Yao Autonomous County\"},{\"n\":\"Yingde City\"},{\"n\":\"Connect City\"}]},{\"n\":\"Dongguan City\"},{\"n\":\"Zhongshan City\"},{\"n\":\"Chaozhou City\",\"s\":[{\"n\":\"Xiangqiao District\"},{\"n\":\"Chaoan District\"},{\"n\":\" Raoping County\"}]},{\"n\":\"Jieyang City\",\"s\":[{\"n\":\"Rongcheng District\"},{\"n\":\"Jiedong District\"},{\"n\":\"Jiexi County\"},{\"n\":\"Huilai County\"},{\"n\":\"Puning City\"}]},{\"n\":\"Yunfu City\",\"s\":[{\"n\":\"Yuncheng District\"},{\"n\":\"Xingxing County\"},{\"n\":\"Yunan County\"},{\"n\":\"Yunan County\"},{\"n\":\" Luoding City\"}]}]}]";
        return data;
    }

    /**
     * Get user data
     */
    @GetMapping("/userModel")
    @ResponseBody
    public AjaxResult userModel()
    {
        AjaxResult ajax = new AjaxResult();

        ajax.put("code", 200);
        ajax.put("value", users);
        return ajax;
    }

    /**
     * Get data collection
     */
    @GetMapping("/collection")
    @ResponseBody
    public AjaxResult collection()
    {
        String[] array = { "smanga 1", "smanga 2", "smanga 3", "smanga 4", "smanga 5" };
        AjaxResult ajax = new AjaxResult();
        ajax.put("value", array);
        return ajax;
    }
}

class UserFormModel
{
    /** User ID */
    private int userId;

    /** user ID */
    private String userCode;

    /** username */
    private String userName;

    /** User phone */
    private String userPhone;

    public UserFormModel()
    {

    }

    public UserFormModel(int userId, String userCode, String userName, String userPhone)
    {
        this.userId = userId;
        this.userCode = userCode;
        this.userName = userName;
        this.userPhone = userPhone;
    }

    public int getUserId()
    {
        return userId;
    }

    public void setUserId(int userId)
    {
        this.userId = userId;
    }

    public String getUserCode()
    {
        return userCode;
    }

    public void setUserCode(String userCode)
    {
        this.userCode = userCode;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getUserPhone()
    {
        return userPhone;
    }

    public void setUserPhone(String userPhone)
    {
        this.userPhone = userPhone;
    }

}
