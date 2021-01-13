package com.lcomputerstudy3.example.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.lcomputerstudy3.example.domain.Board;
import com.lcomputerstudy3.example.domain.Comment;
import com.lcomputerstudy3.example.domain.Pagination;

@Mapper
public interface BoardMapper {
	//public List<Board> selectBoardList(int page);
	public Board readBoard(String bId);
	public void createBoard(Board board);
	public int selectBoardCount();
	public int selectBoardSearchCount(Pagination pagination);
	public Board selectBoardDetail(int bId);
	public Board selectWriteEdit();
	public void Editprocess(Board board);
	public void WriteDelete(Board board);
	public void ReplyComment(Comment comment);
	public List<Comment> selectCommentList(int bId);
	public Comment selectCommentDetail(int cId);
	public void CommentDelete(Comment comment);
	public void CommentEditProcess(Comment comment);
	public void updateGroup(Board board);
	public void createReply(Board board);
	public Board selectMaxOrder(Board board);
	public void updateOrder(Board board);
	public List<Board> selectSearchPost(Pagination pagination);
	//public int selectSearchCount();

}






