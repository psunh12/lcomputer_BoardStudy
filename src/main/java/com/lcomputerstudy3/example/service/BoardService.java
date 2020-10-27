package com.lcomputerstudy3.example.service;

import java.util.List;
import com.lcomputerstudy3.example.domain.Board;
import com.lcomputerstudy3.example.domain.User;

public interface BoardService {
	public List<Board> selectBoardList();

	public void createAuthorities(User user);

	public void createUser(User user);
}
