package com.lcomputerstudy3.example.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import com.lcomputerstudy3.example.domain.Board;

import org.springframework.stereotype.Service;
import com.lcomputerstudy3.example.mapper.BoardMapper;


@Service("BoardServiceImpl")
public abstract class BoardServiceImpl implements BoardService {

	@Autowired BoardMapper boardmapper;
	@Override
	public List<Board> selectBoardList(){
		return boardmapper.selectBoardList();
	}

	}
