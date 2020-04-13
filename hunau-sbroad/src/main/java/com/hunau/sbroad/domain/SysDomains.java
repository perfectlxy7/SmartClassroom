package com.hunau.sbroad.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.hunau.common.annotation.Excel;
import com.hunau.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 sys_domains
 * 
 * @author lxy
 * @date 2020-03-28
 */
public class SysDomains extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long parentdomainid;

    /** 区域ID号 */
    private Long domainid;

    /** 区域的名字 */
    @Excel(name = "区域的名字")
    private String domainname;

    /** $column.columnComment */
    @Excel(name = "区域的名字")
    private boolean isuse;

    public void setParentdomainid(Long parentdomainid) 
    {
        this.parentdomainid = parentdomainid;
    }

    public Long getParentdomainid() 
    {
        return parentdomainid;
    }
    public void setDomainid(Long domainid) 
    {
        this.domainid = domainid;
    }

    public Long getDomainid() 
    {
        return domainid;
    }
    public void setDomainname(String domainname) 
    {
        this.domainname = domainname;
    }

    public String getDomainname() 
    {
        return domainname;
    }
    public void setIsuse(boolean isuse) 
    {
        this.isuse = isuse;
    }

    public boolean getIsuse() 
    {
        return isuse;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("parentdomainid", getParentdomainid())
            .append("domainid", getDomainid())
            .append("domainname", getDomainname())
            .append("isuse", getIsuse())
            .toString();
    }
}
