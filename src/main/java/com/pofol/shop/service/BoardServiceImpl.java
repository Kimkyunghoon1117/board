package com.pofol.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pofol.shop.dao.BoardDao;
import com.pofol.shop.domain.BoardDto;
import com.pofol.shop.domain.SearchCondition;

@Service
public class BoardServiceImpl implements BoardService {
    @Autowired
    BoardDao boardDao;
    
    public int getCount()
        throws Exception
    {
        return boardDao.count();
    }

    public int remove(Integer bno, String writer)
        throws Exception
    {
        return boardDao.delete(bno, writer);
    }

    public int write(BoardDto boardDto)
        throws Exception
    {
        return boardDao.insert(boardDto);
    }

    public List getList()
        throws Exception
    {
        return boardDao.selectAll();
    }

    public BoardDto read(Integer bno)
        throws Exception
    {
        BoardDto boardDto = boardDao.select(bno);
        boardDao.increaseViewCnt(bno);
        return boardDto;
    }

    public List getPage(Map map)
        throws Exception
    {
        return boardDao.selectPage(map);
    }

    public int modify(BoardDto boardDto)
        throws Exception
    {
        return boardDao.update(boardDto);
    }

    public int getSearchResultCnt(SearchCondition sc)
        throws Exception
    {
        return boardDao.searchResultCnt(sc);
    }

    public List getSearchResultPage(SearchCondition sc)
        throws Exception
    {
        return boardDao.searchSelectPage(sc);
    }
}
