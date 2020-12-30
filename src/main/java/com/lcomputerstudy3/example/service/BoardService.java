package com.lcomputerstudy3.example.service;

import java.util.List;
import com.lcomputerstudy3.example.domain.Board;
import com.lcomputerstudy3.example.domain.Comment;
import com.lcomputerstudy3.example.domain.Pagination;


public interface BoardService {
	public List<Board> selectBoardList(int page);
	public Board readBoard(String bId);
	public void createBoard(Board board);
	public int selectBoardCount();
	public int getBoardCount();
	public Board selectBoardDetail(int bId);
	public Board selectWriteEdit();
	public void Editprocess(Board board);
	public void WriteDelete(Board board);
	public void ReplyComment(Comment comment);
	public List<Comment> selectCommentList(int bId);
	public Comment selectCommentDetail(int cId);
	public void CommentDelete(Comment comment);
	public void CommentEditProcess(Comment comment);
	public void createReply(Board board);
	public Board selectMaxOrder(Board board);
	public void updateOrder(Board board);
	public List<Board> selectSearchPost(Pagination pagination);
	
}
