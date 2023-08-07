package com.pofol.shop.domain;

import java.util.Objects;
import org.springframework.web.util.UriComponentsBuilder;

public class SearchCondition
{

    public SearchCondition()
    {
        page = Integer.valueOf(1);
        pageSize = Integer.valueOf(10);
        option = "";
        keyword = "";
    }

    public SearchCondition(Integer page, Integer pageSize)
    {
        this(page, pageSize, "", "");
    }

    public SearchCondition(Integer page, Integer pageSize, String option, String keyword)
    {
        this.page = Integer.valueOf(1);
        this.pageSize = Integer.valueOf(10);
        this.option = "";
        this.keyword = "";
        this.page = page;
        this.pageSize = pageSize;
        this.option = option;
        this.keyword = keyword;
    }

    public String getQueryString()
    {
        return getQueryString(page);
    }

    public String getQueryString(Integer page)
    {
        return UriComponentsBuilder.newInstance().queryParam("page", new Object[] {
            page
        }).queryParam("pageSize", new Object[] {
            pageSize
        }).queryParam("option", new Object[] {
            option
        }).queryParam("keyword", new Object[] {
            keyword
        }).build().toString();
    }

    public Integer getPage()
    {
        return page;
    }

    public void setPage(Integer page)
    {
        this.page = page;
    }

    public Integer getPageSize()
    {
        return pageSize;
    }

    public void setPageSize(Integer pageSize)
    {
        this.pageSize = (Integer)Objects.requireNonNullElse(pageSize, Integer.valueOf(10));
        this.pageSize = Integer.valueOf(Math.max(5, Math.min(this.pageSize.intValue(), 50)));
    }

    public String getOption()
    {
        return option;
    }

    public void setOption(String option)
    {
        this.option = option;
    }

    public String getKeyword()
    {
        return keyword;
    }

    public void setKeyword(String keyword)
    {
        this.keyword = keyword;
    }

    public Integer getOffset()
    {
        return Integer.valueOf((page.intValue() - 1) * pageSize.intValue());
    }

    public String toString()
    {
        return (new StringBuilder("SearchCondition{page=")).append(page).append(", pageSize=").append(pageSize).append(", option='").append(option).append('\'').append(", keyword='").append(keyword).append('\'').append('}').toString();
    }

    private Integer page;
    private Integer pageSize;
    private String option;
    private String keyword;
    public static final int MIN_PAGE_SIZE = 5;
    public static final int DEFAULT_PAGE_SIZE = 10;
    public static final int MAX_PAGE_SIZE = 50;
}
