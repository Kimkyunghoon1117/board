package com.pofol.shop.service;

import com.pofol.shop.domain.CommentDto;
import com.pofol.shop.domain.SearchCondition;
import java.util.List;

public interface CommentService
{

    public abstract int getCount(Integer integer)
        throws Exception;

    public abstract int remove(Integer integer, Integer integer1, String s)
        throws Exception;

    public abstract int write(CommentDto commentdto)
        throws Exception;

    public abstract List getList(Integer integer)
        throws Exception;

    public abstract CommentDto read(Integer integer)
        throws Exception;

    public abstract int modify(CommentDto commentdto)
        throws Exception;

    public abstract List getSearchList(Integer integer, SearchCondition searchcondition)
        throws Exception;
}
