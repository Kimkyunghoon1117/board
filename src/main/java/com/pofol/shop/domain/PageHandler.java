package com.pofol.shop.domain;

import org.springframework.web.util.UriComponentsBuilder;

public class PageHandler
{

    public PageHandler(int totalCnt, Integer page)
    {
        this(totalCnt, new SearchCondition(page, Integer.valueOf(10)));
    }

    public PageHandler(int totalCnt, Integer page, Integer pageSize)
    {
        this(totalCnt, new SearchCondition(page, pageSize));
    }

    public PageHandler(int totalCnt, SearchCondition sc)
    {
        showNext = false;
        showPrev = false;
        this.totalCnt = totalCnt;
        this.sc = sc;
        doPaging(totalCnt, sc);
    }

    private void doPaging(int totalCnt, SearchCondition sc)
    {
        totalPage = totalCnt / sc.getPageSize().intValue() + (totalCnt % sc.getPageSize().intValue() != 0 ? 1 : 0);
        this.sc.setPage(Integer.valueOf(Math.min(sc.getPage().intValue(), totalPage)));
        beginPage = ((this.sc.getPage().intValue() - 1) / 10) * 10 + 1;
        endPage = Math.min((beginPage + 10) - 1, totalPage);
        showPrev = beginPage != 1;
        showNext = endPage != totalPage;
    }

    public String getQueryString()
    {
        return getQueryString(sc.getPage());
    }

    public String getQueryString(Integer page)
    {
        return UriComponentsBuilder.newInstance().queryParam("page", new Object[] {
            page
        }).queryParam("pageSize", new Object[] {
            sc.getPageSize()
        }).queryParam("option", new Object[] {
            sc.getOption()
        }).queryParam("keyword", new Object[] {
            sc.getKeyword()
        }).build().toString();
    }

    void print()
    {
        System.out.println((new StringBuilder("page=")).append(sc.getPage()).toString());
        System.out.print(showPrev ? "PREV " : "");
        for(int i = beginPage; i <= endPage; i++)
            System.out.print((new StringBuilder(String.valueOf(i))).append(" ").toString());

        System.out.println(showNext ? " NEXT" : "");
    }

    public SearchCondition getSc()
    {
        return sc;
    }

    public void setSc(SearchCondition sc)
    {
        this.sc = sc;
    }

    public int getTotalCnt()
    {
        return totalCnt;
    }

    public void setTotalCnt(int totalCnt)
    {
        this.totalCnt = totalCnt;
    }

    public boolean isShowNext()
    {
        return showNext;
    }

    public void setShowNext(boolean showNext)
    {
        this.showNext = showNext;
    }

    public int getBeginPage()
    {
        return beginPage;
    }

    public void setBeginPage(int beginPage)
    {
        this.beginPage = beginPage;
    }

    public int getNAV_SIZE()
    {
        return 10;
    }

    public int getTotalPage()
    {
        return totalPage;
    }

    public void setTotalPage(int totalPage)
    {
        this.totalPage = totalPage;
    }

    public int getEndPage()
    {
        return endPage;
    }

    public void setEndPage(int endPage)
    {
        this.endPage = endPage;
    }

    public boolean isShowPrev()
    {
        return showPrev;
    }

    public void setShowPrev(boolean showPrev)
    {
        this.showPrev = showPrev;
    }

    public String toString()
    {
        return (new StringBuilder("PageHandler{sc=")).append(sc).append(", totalCnt=").append(totalCnt).append(", showNext=").append(showNext).append(", beginPage=").append(beginPage).append(", NAV_SIZE=").append(10).append(", totalPage=").append(totalPage).append(", endPage=").append(endPage).append(", showPrev=").append(showPrev).append('}').toString();
    }

    private SearchCondition sc;
    public final int NAV_SIZE = 10;
    private int totalCnt;
    private int totalPage;
    private int beginPage;
    private int endPage;
    private boolean showNext;
    private boolean showPrev;
}
