package com.hunau.sbroad.mapper;

import java.util.List;
import com.hunau.sbroad.domain.SysDomains;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author lxy
 * @date 2020-03-28
 */
public interface SysDomainsMapper 
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
     * 删除【请填写功能名称】
     * 
     * @param domainid 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteSysDomainsById(Long domainid);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param domainids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysDomainsByIds(String[] domainids);
}
