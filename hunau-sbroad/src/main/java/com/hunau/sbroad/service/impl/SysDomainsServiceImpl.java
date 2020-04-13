package com.hunau.sbroad.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hunau.sbroad.mapper.SysDomainsMapper;
import com.hunau.sbroad.domain.SysDomains;
import com.hunau.sbroad.service.ISysDomainsService;
import com.hunau.common.core.text.Convert;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author lxy
 * @date 2020-03-28
 */
@Service
public class SysDomainsServiceImpl implements ISysDomainsService 
{
    @Autowired
    private SysDomainsMapper sysDomainsMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param domainid 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public SysDomains selectSysDomainsById(Long domainid)
    {
        return sysDomainsMapper.selectSysDomainsById(domainid);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param sysDomains 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<SysDomains> selectSysDomainsList(SysDomains sysDomains)
    {
        return sysDomainsMapper.selectSysDomainsList(sysDomains);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param sysDomains 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertSysDomains(SysDomains sysDomains)
    {
        return sysDomainsMapper.insertSysDomains(sysDomains);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param sysDomains 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateSysDomains(SysDomains sysDomains)
    {
        return sysDomainsMapper.updateSysDomains(sysDomains);
    }

    /**
     * 删除【请填写功能名称】对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteSysDomainsByIds(String ids)
    {
        return sysDomainsMapper.deleteSysDomainsByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param domainid 【请填写功能名称】ID
     * @return 结果
     */
    @Override
    public int deleteSysDomainsById(Long domainid)
    {
        return sysDomainsMapper.deleteSysDomainsById(domainid);
    }
}
