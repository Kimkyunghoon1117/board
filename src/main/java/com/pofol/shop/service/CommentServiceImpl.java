package com.pofol.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pofol.shop.dao.BoardDao;
import com.pofol.shop.dao.CommentDao;
import com.pofol.shop.domain.CommentDto;
import com.pofol.shop.domain.SearchCondition;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	BoardDao boardDao;
	@Autowired
	CommentDao commentDao;

	public int getCount(Integer bno) throws Exception {
		return commentDao.count(bno);
	}

	public int remove(Integer cno, Integer bno, String commenter) throws Exception {
		int rowCnt = boardDao.updateCommentCnt(bno, -1);
		rowCnt = commentDao.delete(cno, commenter);
		return rowCnt;
	}

	public int write(CommentDto commentDto) throws Exception {
		boardDao.updateCommentCnt(commentDto.getBno(), 1);
		return commentDao.insert(commentDto);
	}

	public List getList(Integer bno) throws Exception {
		return commentDao.selectAll(bno);
	}

	public CommentDto read(Integer cno) throws Exception {
		return commentDao.select(cno);
	}

	public int modify(CommentDto commentDto) throws Exception {
		return commentDao.update(commentDto);
	}

	public List getSearchList(Integer bno, SearchCondition sc) throws Exception {
		return commentDao.searchSelect(bno, sc);
	}
}
