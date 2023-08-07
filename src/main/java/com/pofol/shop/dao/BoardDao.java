package com.pofol.shop.dao;

import com.pofol.shop.domain.BoardDto;
import com.pofol.shop.domain.SearchCondition;
import java.util.List;
import java.util.Map;


public interface BoardDao
{

    public abstract BoardDto select(Integer integer)
        throws Exception;

    public abstract int delete(Integer integer, String s)
        throws Exception;

    public abstract int insert(BoardDto boarddto)
        throws Exception;

    public abstract int update(BoardDto boarddto)
        throws Exception;

    public abstract int increaseViewCnt(Integer integer)
        throws Exception;

    public abstract List selectPage(Map map)
        throws Exception;

    public abstract List selectAll()
        throws Exception;

    public abstract int deleteAll()
        throws Exception;

    public abstract int count()
        throws Exception;

    public abstract int searchResultCnt(SearchCondition searchcondition)
        throws Exception;

    public abstract List searchSelectPage(SearchCondition searchcondition)
        throws Exception;

    public abstract int updateCommentCnt(Integer integer, int i)
        throws Exception;
}
