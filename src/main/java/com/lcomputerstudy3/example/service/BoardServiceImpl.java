package com.lcomputerstudy3.example.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import com.lcomputerstudy3.example.domain.Board;

import org.springframework.stereotype.Service;
import com.lcomputerstudy3.example.mapper.BoardMapper;


@Service
public class BoardServiceImpl implements BoardService {

	@Autowired BoardMapper boardMapper;
	@Override
	public List<Board> selectBoardList(){
		return boardMapper.selectBoardList();
	}
	@Override
	public Board readBoard(String bId) {
		return boardMapper.readBoard(bId);
	}
	@Override
	public void createBoard(Board board) {
		boardMapper.createBoard(board);
		
	}

}
