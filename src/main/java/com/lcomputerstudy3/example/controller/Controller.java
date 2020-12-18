package com.lcomputerstudy3.example.controller;

import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.lcomputerstudy3.example.domain.Board;
import com.lcomputerstudy3.example.domain.Pagination;
import com.lcomputerstudy3.example.domain.User;
import com.lcomputerstudy3.example.domain.Comment;
import com.lcomputerstudy3.example.service.BoardService;
import com.lcomputerstudy3.example.service.UserService;

@org.springframework.stereotype.Controller
public class Controller {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired UserService userservice;
	@Autowired BoardService boardservice;

	private int boardcount;

	
   @RequestMapping("/")
   public String home(Model model) {
       
//	   List<Board> list = boardservice.selectBoardList();
//	   model.addAttribute("list", list);
	   logger.debug("debug");
	   logger.info("info");
	   logger.error("error");
	   return "/index";
   }
   
 //  @RequestMapping("/board/list")
   //public String boardList(Model model) {
	 //  List<Board> list = boardservice.selectBoardList();
	   //model.addAttribute("list", list);
	   
	   //return "/board/list";
  // }
   
   @RequestMapping("/beforeSignUp")
   public String beforeSignUp() {
	   return "/signup";
   }
   
   @RequestMapping("/signup")
   public String signup(User user) {
	   String encodedPassword = new BCryptPasswordEncoder().encode(user.getPassword());
	   
	   user.setPassword(encodedPassword);
	   user.setAccountNonExpired(true);
	   user.setEnabled(true);
	   user.setAccountNonLocked(true);
	   user.setCredentialsNonExpired(true);
	   user.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER"));
	   
	   userservice.createUser(user);
	   userservice.createAuthorities(user);
	   
	   return "/login";
   }
   
   @RequestMapping(value="/login")
   public String beforeLogin(Model model) {
      return "/login";
   }
   
   @Secured({"ROLE_ADMIN"})
   @RequestMapping(value="/admin")
   public String admin(Model model) {
	   	return "/admin";
   }

   @RequestMapping(value="/user/info")
   public String userInfo(Model model) {
	   	return "/user_info";
   }
  
   @RequestMapping(value="/denied")
   public String denied(Model model) {
	   return "/denied";
   }
   @RequestMapping(value="/write")
   public String write(Board board) {
	   return "/write";
   }
   
   @GetMapping({"/write-list", "/write-list/{pageObject}"})
   public String writeList(Model model, @PathVariable("pageObject") Optional<Integer> pageObject) {
	   int page = pageObject.isPresent() ? pageObject.get() : 1;
	   
	   List<Board> list =boardservice.selectBoardList(page);
	   
	   boardcount=boardservice.selectBoardCount();
	   Pagination pagination = new Pagination(page, boardcount);
	   
	   model.addAttribute("list",list);
	   model.addAttribute("pagination",pagination);
	   
	   return "/write-list";
   }
   
   @RequestMapping("/write-process")
   public String writeprocess(Model model,Board board) {
 
	   //board.setbId("b_id"));
	   
	   boardservice.createBoard(board);
	   System.out.println("lastinsertid::::: "+board.getbId());
	 
	   return "/write-result";
   }
   @RequestMapping("/board-detail/{bId}")
   public String boardDetail(Model model, @PathVariable("bId") int bId) {
	   Board board = boardservice.selectBoardDetail(bId);
	   List<Comment> list=boardservice.selectCommentList(bId);
	   model.addAttribute("board", board);
	   model.addAttribute("list",list);
//	   System.out.println("bId: " + bId);
	   return "/board-detail";
   }
   @RequestMapping("/write-edit/{bId}")
   public String writeEdit(Model model, @PathVariable("bId") int bId) {
	   Board board = boardservice.selectBoardDetail(bId);
	   model.addAttribute("board", board);
	   return "/write-edit";
   }
   @RequestMapping("/editProcess")
   public String editprocess(Board board) {	   
	   boardservice.Editprocess(board);
	   return "/editProcess";
   }
   @RequestMapping("/write-delete/{bId}")
   public String  writedelete(Board board, @PathVariable("bId") int bId) {
	   boardservice.WriteDelete(board);
	   return "/write-delete";
   }
   @RequestMapping("/comment-result")
   public String replyComment(Model model, Comment comment) {
	   boardservice.ReplyComment(comment);
	   return "/comment-result";
   }
   @RequestMapping("/comment-detail/{cId}")
   public String commentDetail(Model model, @PathVariable("cId") int cId) {
	   Comment comment = boardservice.selectCommentDetail(cId);
	   model.addAttribute("comment", comment);
	   return "/comment-detail";
   }
   @RequestMapping("/comment-delete/{cId}")
   public String commentdelete(Comment comment, @PathVariable("cId") int cId) {
	   boardservice.CommentDelete(comment);
	   return "/comment-delete";
   }
   @RequestMapping("/comment-edit/{cId}")
   public String commentEdit(Model model, @PathVariable("cId") int cId, Comment comment) {
	   boardservice.ReplyComment(comment);
	   return "/comment-list";
   }
   @RequestMapping("/commentProcess")
   public String commentEditprocess(Comment comment) {
	   boardservice.CommentEditProcess(comment);
	   return "/commentProcess";
   }
   @RequestMapping("/reply/{bId}")
   public String reply(Board board, @PathVariable("bId") int bId) {
	   return "/reply";
   }
 
   @RequestMapping("/reply-process")
   public String createReply(Model model, Board board) {
	   boardservice.createReply(board);
	   // boardservice.createReply(board);
	   //model.addAttribute("board", board);
	   
	   // max order 가져오기
	   //Board tmpBoard = boardservice.selectMaxOrder(board);
	   // 해당 bId 게시물의 bOrder +1로 업데이트 하기
	   boardservice.updateOrder(board);
	   return "redirect:/board-detail/" + board.getbId();
   }
   
   @RequestMapping("/comment-list")
   public String commentList(Model model, Comment comment) {
	   boardservice.ReplyComment(comment);
	   List<Comment> list=boardservice.selectCommentList(comment.getbId());
	   model.addAttribute("list",list);
	   
	   return "/comment-list";
   }
   @RequestMapping("/comment-remove")
   public String commentdelete(Model model,Comment comment) {
	   boardservice.CommentDelete(comment);
	   List<Comment> list=boardservice.selectCommentList(comment.getbId());
	   model.addAttribute("list",list);
	   return "/comment-list";
   }

}