// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CommentDao.java

package com.pofol.shop.dao;

import com.pofol.shop.domain.CommentDto;
import com.pofol.shop.domain.SearchCondition;
import java.util.List;

public interface CommentDao
{

    public abstract int count(Integer integer)
        throws Exception;

    public abstract int deleteAll(Integer integer);

    public abstract int delete(Integer integer, String s)
        throws Exception;

    public abstract int insert(CommentDto commentdto)
        throws Exception;

    public abstract List selectAll(Integer integer)
        throws Exception;

    public abstract CommentDto select(Integer integer)
        throws Exception;

    public abstract List searchSelect(Integer integer, SearchCondition searchcondition)
        throws Exception;

    public abstract int update(CommentDto commentdto)
        throws Exception;
}
