package com.hunau.web.controller.operation;

import com.hunau.common.annotation.Log;
import com.hunau.common.core.controller.BaseController;
import com.hunau.common.core.domain.AjaxResult;
import com.hunau.common.core.page.TableDataInfo;
import com.hunau.common.enums.BusinessType;
import com.hunau.common.utils.poi.ExcelUtil;
import com.hunau.system.domain.SysOperLog;
import com.hunau.system.service.ISysOperLogService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/operation/curtain")
public class CurtainController extends BaseController
{
    private String prefix = "operation/curtain";

    @Autowired
    private ISysOperLogService operLogService;

    @RequiresPermissions("operation:facility:view")
    @GetMapping()
    public String operlog()
    {
        return prefix;
    }



}