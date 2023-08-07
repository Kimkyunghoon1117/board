package com.pofol.shop.dao;

import com.pofol.shop.domain.User;

public interface UserDao
{

    public abstract User selectUser(String s)
        throws Exception;

    public abstract int deleteUser(String s)
        throws Exception;

    public abstract int insertUser(User user)
        throws Exception;

    public abstract int updateUser(User user)
        throws Exception;

    public abstract int count()
        throws Exception;

    public abstract void deleteAll()
        throws Exception;
}
