package com.hunau.sbroad.service;

import java.util.List;
import com.hunau.sbroad.domain.SysDomains;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author lxy
 * @date 2020-03-28
 */
public interface ISysDomainsService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param domainid 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public SysDomains selectSysDomainsById(Long domainid);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param sysDomains 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<SysDomains> selectSysDomainsList(SysDomains sysDomains);

    /**
     * 新增【请填写功能名称】
     * 
     * @param sysDomains 【请填写功能名称】
     * @return 结果
     */
    public int insertSysDomains(SysDomains sysDomains);

    /**
     * 修改【请填写功能名称】
     * 
     * @param sysDomains 【请填写功能名称】
     * @return 结果
     */
    public int updateSysDomains(SysDomains sysDomains);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysDomainsByIds(String ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param domainid 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteSysDomainsById(Long domainid);
}
