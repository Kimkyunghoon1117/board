package com.pofol.shop.service;

import com.pofol.shop.domain.BoardDto;
import com.pofol.shop.domain.SearchCondition;
import java.util.List;
import java.util.Map;

public interface BoardService {

    public abstract int getCount() throws Exception;

    public abstract int remove(Integer integer, String s)
        throws Exception;

    public abstract int write(BoardDto boarddto)
        throws Exception;

    public abstract List getList()
        throws Exception;

    public abstract BoardDto read(Integer integer)
        throws Exception;

    public abstract List getPage(Map map)
        throws Exception;

    public abstract int modify(BoardDto boarddto)
        throws Exception;

    public abstract int getSearchResultCnt(SearchCondition searchcondition)
        throws Exception;

    public abstract List getSearchResultPage(SearchCondition searchcondition)
        throws Exception;
}
