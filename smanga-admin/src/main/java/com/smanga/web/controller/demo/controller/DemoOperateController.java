package com.smanga.web.controller.demo.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.smanga.common.core.controller.BaseController;
import com.smanga.common.core.domain.AjaxResult;
import com.smanga.common.core.page.PageDomain;
import com.smanga.common.core.page.TableDataInfo;
import com.smanga.common.core.page.TableSupport;
import com.smanga.common.core.text.Convert;
import com.smanga.common.exception.BusinessException;
import com.smanga.common.utils.StringUtils;
import com.smanga.common.utils.poi.ExcelUtil;
import com.smanga.web.controller.demo.domain.CustomerModel;
import com.smanga.web.controller.demo.domain.UserOperateModel;

/**
 * Operational control
 * 
 * @author Trong Hieu
 */
@Controller
@RequestMapping("/demo/operate")
public class DemoOperateController extends BaseController
{
    private String prefix = "demo/operate";

    private final static Map<Integer, UserOperateModel> users = new LinkedHashMap<Integer, UserOperateModel>();
    {
        users.put(1, new UserOperateModel(1, "1000001", "test 1", "0", "15888888888", "smanga@vn.com", 150.0, "0"));
        users.put(2, new UserOperateModel(2, "1000002", "test 2", "1", "15666666666", "smanga@vn.com", 180.0, "1"));
        users.put(3, new UserOperateModel(3, "1000003", "test 3", "0", "15666666666", "smanga@vn.com", 110.0, "1"));
        users.put(4, new UserOperateModel(4, "1000004", "test 4", "1", "15666666666", "smanga@vn.com", 220.0, "1"));
        users.put(5, new UserOperateModel(5, "1000005", "test 5", "0", "15666666666", "smanga@vn.com", 140.0, "1"));
        users.put(6, new UserOperateModel(6, "1000006", "test 6", "1", "15666666666", "smanga@vn.com", 330.0, "1"));
        users.put(7, new UserOperateModel(7, "1000007", "test 7", "0", "15666666666", "smanga@vn.com", 160.0, "1"));
        users.put(8, new UserOperateModel(8, "1000008", "test 8", "1", "15666666666", "smanga@vn.com", 170.0, "1"));
        users.put(9, new UserOperateModel(9, "1000009", "test 9", "0", "15666666666", "smanga@vn.com", 180.0, "1"));
        users.put(10, new UserOperateModel(10, "1000010", "test 10", "0", "15666666666", "smanga@vn.com", 210.0, "1"));
        users.put(11, new UserOperateModel(11, "1000011", "test 11", "1", "15666666666", "smanga@vn.com", 110.0, "1"));
        users.put(12, new UserOperateModel(12, "1000012", "test 12", "0", "15666666666", "smanga@vn.com", 120.0, "1"));
        users.put(13, new UserOperateModel(13, "1000013", "test 13", "1", "15666666666", "smanga@vn.com", 380.0, "1"));
        users.put(14, new UserOperateModel(14, "1000014", "test 14", "0", "15666666666", "smanga@vn.com", 280.0, "1"));
        users.put(15, new UserOperateModel(15, "1000015", "test 15", "0", "15666666666", "smanga@vn.com", 570.0, "1"));
        users.put(16, new UserOperateModel(16, "1000016", "test 16", "1", "15666666666", "smanga@vn.com", 260.0, "1"));
        users.put(17, new UserOperateModel(17, "1000017", "test 17", "1", "15666666666", "smanga@vn.com", 210.0, "1"));
        users.put(18, new UserOperateModel(18, "1000018", "test 18", "1", "15666666666", "smanga@vn.com", 340.0, "1"));
        users.put(19, new UserOperateModel(19, "1000019", "test 19", "1", "15666666666", "smanga@vn.com", 160.0, "1"));
        users.put(20, new UserOperateModel(20, "1000020", "test 20", "1", "15666666666", "smanga@vn.com", 220.0, "1"));
        users.put(21, new UserOperateModel(21, "1000021", "test 21", "1", "15666666666", "smanga@vn.com", 120.0, "1"));
        users.put(22, new UserOperateModel(22, "1000022", "test 22", "1", "15666666666", "smanga@vn.com", 130.0, "1"));
        users.put(23, new UserOperateModel(23, "1000023", "test 23", "1", "15666666666", "smanga@vn.com", 490.0, "1"));
        users.put(24, new UserOperateModel(24, "1000024", "test 24", "1", "15666666666", "smanga@vn.com", 570.0, "1"));
        users.put(25, new UserOperateModel(25, "1000025", "test 25", "1", "15666666666", "smanga@vn.com", 250.0, "1"));
        users.put(26, new UserOperateModel(26, "1000026", "test 26", "1", "15666666666", "smanga@vn.com", 250.0, "1"));
    }

    /**
     * form
     */
    @GetMapping("/table")
    public String table()
    {
        return prefix + "/table";
    }

    /**
     * other
     */
    @GetMapping("/other")
    public String other()
    {
        return prefix + "/other";
    }

    /**
     * Query data
     */
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(UserOperateModel userModel)
    {
        TableDataInfo rspData = new TableDataInfo();
        List<UserOperateModel> userList = new ArrayList<UserOperateModel>(users.values());
        // Query filter
        if (StringUtils.isNotEmpty(userModel.getSearchValue()))
        {
            userList.clear();
            for (Map.Entry<Integer, UserOperateModel> entry : users.entrySet())
            {
                if (entry.getValue().getUserName().equals(userModel.getSearchValue()))
                {
                    userList.add(entry.getValue());
                }
            }
        }
        else if (StringUtils.isNotEmpty(userModel.getUserName()))
        {
            userList.clear();
            for (Map.Entry<Integer, UserOperateModel> entry : users.entrySet())
            {
                if (entry.getValue().getUserName().equals(userModel.getUserName()))
                {
                    userList.add(entry.getValue());
                }
            }
        }
        PageDomain pageDomain = TableSupport.buildPageRequest();
        if (null == pageDomain.getPageNum() || null == pageDomain.getPageSize())
        {
            rspData.setRows(userList);
            rspData.setTotal(userList.size());
            return rspData;
        }
        Integer pageNum = (pageDomain.getPageNum() - 1) * 10;
        Integer pageSize = pageDomain.getPageNum() * 10;
        if (pageSize > userList.size())
        {
            pageSize = userList.size();
        }
        rspData.setRows(userList.subList(pageNum, pageSize));
        rspData.setTotal(userList.size());
        return rspData;
    }

    /**
     * New users
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        return prefix + "/add";
    }

    /**
     * Add save user
     */
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(UserOperateModel user)
    {
        Integer userId = users.size() + 1;
        user.setUserId(userId);
        return AjaxResult.success(users.put(userId, user));
    }

    /**
     * Added save main and sub-table information
     */
    @PostMapping("/customer/add")
    @ResponseBody
    public AjaxResult addSave(CustomerModel customerModel)
    {
        System.out.println(customerModel.toString());
        return AjaxResult.success();
    }

    /**
     * Modify user
     */
    @GetMapping("/edit/{userId}")
    public String edit(@PathVariable("userId") Integer userId, ModelMap mmap)
    {
        mmap.put("user", users.get(userId));
        return prefix + "/edit";
    }

    /**
     * Modify save user
     */
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(UserOperateModel user)
    {
        return AjaxResult.success(users.put(user.getUserId(), user));
    }

    /**
     * Export
     */
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(UserOperateModel user)
    {
        List<UserOperateModel> list = new ArrayList<UserOperateModel>(users.values());
        ExcelUtil<UserOperateModel> util = new ExcelUtil<UserOperateModel>(UserOperateModel.class);
        return util.exportExcel(list, "User data");
    }

    /**
     * Download template
     */
    @GetMapping("/importTemplate")
    @ResponseBody
    public AjaxResult importTemplate()
    {
        ExcelUtil<UserOperateModel> util = new ExcelUtil<UserOperateModel>(UserOperateModel.class);
        return util.importTemplateExcel("User data");
    }

    /**
     * Import Data
     */
    @PostMapping("/importData")
    @ResponseBody
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception
    {
        ExcelUtil<UserOperateModel> util = new ExcelUtil<UserOperateModel>(UserOperateModel.class);
        List<UserOperateModel> userList = util.importExcel(file.getInputStream());
        String message = importUser(userList, updateSupport);
        return AjaxResult.success(message);
    }

    /**
     * delete users
     */
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        Integer[] userIds = Convert.toIntArray(ids);
        for (Integer userId : userIds)
        {
            users.remove(userId);
        }
        return AjaxResult.success();
    }

    /**
     * View details
     */
    @GetMapping("/detail/{userId}")
    public String detail(@PathVariable("userId") Integer userId, ModelMap mmap)
    {
        mmap.put("user", users.get(userId));
        return prefix + "/detail";
    }

    @PostMapping("/clean")
    @ResponseBody
    public AjaxResult clean()
    {
        users.clear();
        return success();
    }

    /**
     * Import user data
     * 
     * @param userList User data list
     * @param isUpdateSupport Whether to update support, if it already exists, update the data
     * @return result
     */
    public String importUser(List<UserOperateModel> userList, Boolean isUpdateSupport)
    {
        if (StringUtils.isNull(userList) || userList.size() == 0)
        {
            throw new BusinessException("Import user data cannot be empty!");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (UserOperateModel user : userList)
        {
            try
            {
                // Verify if this user exists
                boolean userFlag = false;
                for (Map.Entry<Integer, UserOperateModel> entry : users.entrySet())
                {
                    if (entry.getValue().getUserName().equals(user.getUserName()))
                    {
                        userFlag = true;
                        break;
                    }
                }
                if (!userFlag)
                {
                    Integer userId = users.size() + 1;
                    user.setUserId(userId);
                    users.put(userId, user);
                    successNum++;
                    successMsg.append("<br/>" + successNum + ", user " + user.getUserName() + " imported successfully");
                }
                else if (isUpdateSupport)
                {
                    users.put(user.getUserId(), user);
                    successNum++;
                    successMsg.append("<br/>" + successNum + ", user " + user.getUserName() + " update completed");
                }
                else
                {
                    failureNum++;
                    failureMsg.append("<br/>" + failureNum + ", user " + user.getUserName() + " existed");
                }
            }
            catch (Exception e)
            {
                failureNum++;
                String msg = "<br/>" + failureNum + ", account number " + user.getUserName() + " import failed: ";
                failureMsg.append(msg + e.getMessage());
            }
        }
        if (failureNum > 0)
        {
            failureMsg.insert(0, "Sorry, the import failed! Total " + failureNum + " The data format is incorrect, the error is as follows: ");
            throw new BusinessException(failureMsg.toString());
        }
        else
        {
            successMsg.insert(0, "Congratulations, the data has been imported successfully! Total " + successNum + " Article, the data is as follows: ");
        }
        return successMsg.toString();
    }
}
