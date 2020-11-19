package com.lcomputerstudy3.example.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.lcomputerstudy3.example.domain.Board;
import com.lcomputerstudy3.example.domain.Comment;
@Mapper
public interface BoardMapper {
	public List<Board> selectBoardList(int pageNum);
	public Board readBoard(String bId);
	public void createBoard(Board board);
	public int selectBoardCount();
	public Board selectBoardDetail(int bId);
	public Board selectWriteEdit();
	public void Editprocess(Board board);
	public void WriteDelete(Board board);
	public void ReplyComment(Comment comment);
	public List<Comment> selectCommentList(int bId);
	public Comment selectCommentDetail(int cId);
	public void CommentDelete(Comment comment);
	public void CommentEditProcess(Comment comment);
	
}






