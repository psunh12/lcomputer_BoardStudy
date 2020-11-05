package com.lcomputerstudy3.example.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.lcomputerstudy3.example.domain.Board;


@Mapper
public interface BoardMapper {
	public List<Board> selectBoardList(int pageNum);
	public Board readBoard(String bId);
	public void createBoard(Board board);
	public int selectBoardCount();
	public int page = 1;
	public int pageNum = (page-1)*3;
}






