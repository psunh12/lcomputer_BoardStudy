package com.lcomputerstudy3.example.service;

import java.util.List;
import com.lcomputerstudy3.example.domain.Board;


public interface BoardService {
	public List<Board> selectBoardList(int page);
	public Board readBoard(String bId);
	public void createBoard(Board board);
	public int selectBoardCount();
	public static BoardService getInstance() {
		return null;
	}
	public int getBoardCount();

}
