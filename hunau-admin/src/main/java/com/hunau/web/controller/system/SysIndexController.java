package com.hunau.web.controller.system;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import com.hunau.common.config.Global;
import com.hunau.common.core.controller.BaseController;
import com.hunau.framework.util.ShiroUtils;
import com.hunau.system.domain.SysMenu;
import com.hunau.system.domain.SysUser;
import com.hunau.system.service.ISysMenuService;

/**
 * 首页 业务处理
 * 
 * @author hunau
 */
@Controller
public class SysIndexController extends BaseController
{
    @Autowired
    private ISysMenuService menuService;

    // 系统首页
    @GetMapping("/index")
    public String index(ModelMap mmap)
    {
        // 取身份信息
        SysUser user = ShiroUtils.getSysUser();
        // 根据用户id取出菜单
        List<SysMenu> menus = menuService.selectMenusByUser(user);
        mmap.put("menus", menus);
        mmap.put("user", user);
        mmap.put("copyrightYear", Global.getCopyrightYear());
        return "index";
    }

    // 系统介绍
    @GetMapping("/system/main")
    public String main(ModelMap mmap)
    {
        mmap.put("version", Global.getVersion());
        return "main";
    }


    @GetMapping("/system/temp")
    public String temp(ModelMap mmap) {
        mmap.put("version", Global.getVersion());
        return "data/temp";
    }

    @GetMapping("/system/hum")
    public String hum(ModelMap mmap) {
        mmap.put("version", Global.getVersion());
        return "data/hum";
    }


    @GetMapping("/system/amm")
    public String amm(ModelMap mmap) {
        mmap.put("version", Global.getVersion());
        return "data/amm";
    }

    @GetMapping("/system/flame")
    public String flame(ModelMap mmap) {
        mmap.put("version", Global.getVersion());
        return "data/flame";
    }

    @GetMapping("/system/light")
    public String light(ModelMap mmap) {
        mmap.put("version", Global.getVersion());
        return "data/light";
    }
}
