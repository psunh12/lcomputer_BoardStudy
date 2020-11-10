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
	public List<Board> selectBoardList(int page){
		int pageNum = (page-1)*3;
		return boardMapper.selectBoardList(pageNum);
	}
	@Override
	public Board readBoard(String bId) {
		return boardMapper.readBoard(bId);
	}
	@Override
	public void createBoard(Board board) {
		boardMapper.createBoard(board);
		
	}
	@Override
	public int selectBoardCount() {
		return boardMapper.selectBoardCount();
	}
	@Override
	public int getBoardCount() {
		return 0;
	}
	@Override
	public Board selectBoardDetail(int bId) {
		return boardMapper.selectBoardDetail(bId);
	}
	@Override
	public Board selectWriteEdit() {
		return null;
	}
	@Override
	public void Editprocess(Board board) {
		boardMapper.Editprocess(board);
	}
	@Override
	public void WriteDelete(Board board) {
		
	}
	
}

