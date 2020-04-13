package com.hunau.web.controller.sbroad;

import com.hunau.common.annotation.Log;
import com.hunau.common.core.controller.BaseController;
import com.hunau.common.core.domain.AjaxResult;
import com.hunau.common.core.page.TableDataInfo;
import com.hunau.common.enums.BusinessType;
import com.hunau.common.utils.poi.ExcelUtil;
import com.hunau.sbroad.domain.SysDomains;
import com.hunau.sbroad.service.ISysDomainsService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 【请填写功能名称】Controller
 *
 * @author lxy
 * @date 2020-03-28
 */
@Controller
@RequestMapping("/sbroad/domains")
public class SysDomainsController extends BaseController {
    private String prefix = "sbroad/domains";

    @Autowired
    private ISysDomainsService sysDomainsService;

    @RequiresPermissions("sbroad:domains:view")
    @GetMapping()
    public String domains() {
        return prefix + "/domains";
    }
            /**
         * 查询【请填写功能名称】列表
         */
        @RequiresPermissions("sbroad:domains:list")
        @PostMapping("/list")
        @ResponseBody
        public TableDataInfo list(SysDomains sysDomains) {
            startPage();
            List<SysDomains> list = sysDomainsService.selectSysDomainsList(sysDomains);
            return getDataTable(list);
        }
    
    /**
     * 导出【请填写功能名称】列表
     */
    @RequiresPermissions("sbroad:domains:export")
    @Log(title = "【请填写功能名称】" , businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysDomains sysDomains) {
        List<SysDomains> list = sysDomainsService.selectSysDomainsList(sysDomains);
        ExcelUtil<SysDomains> util = new ExcelUtil<SysDomains>(SysDomains. class);
        return util.exportExcel(list, "domains");
    }

            /**
         * 新增【请填写功能名称】
         */
        @GetMapping("/add")
        public String add() {
            return prefix + "/add";
        }
    
    /**
     * 新增保存【请填写功能名称】
     */
    @RequiresPermissions("sbroad:domains:add")
    @Log(title = "【请填写功能名称】" , businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SysDomains sysDomains) {
        return toAjax(sysDomainsService.insertSysDomains(sysDomains));
    }

    /**
     * 修改【请填写功能名称】
     */
    @GetMapping("/edit/{domainid}")
    public String edit(@PathVariable("domainid") Long domainid, ModelMap mmap) {
        SysDomains sysDomains =sysDomainsService.selectSysDomainsById(domainid);
        mmap.put("sysDomains" , sysDomains);
        return prefix + "/edit";
    }

    /**
     * 修改保存【请填写功能名称】
     */
    @RequiresPermissions("sbroad:domains:edit")
    @Log(title = "【请填写功能名称】" , businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SysDomains sysDomains) {
        return toAjax(sysDomainsService.updateSysDomains(sysDomains));
    }

            /**
         * 删除【请填写功能名称】
         */
        @RequiresPermissions("sbroad:domains:remove")
        @Log(title = "【请填写功能名称】" , businessType = BusinessType.DELETE)
        @PostMapping("/remove")
        @ResponseBody
        public AjaxResult remove(String ids) {
            return toAjax(sysDomainsService.deleteSysDomainsByIds(ids));
        }
        }
