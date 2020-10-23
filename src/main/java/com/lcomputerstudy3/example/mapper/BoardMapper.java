package com.lcomputerstudy3.example.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.lcomputerstudy3.example.domain.Board;

@Mapper
public interface BoardMapper {
	public List<Board> selectBoardList();
}

