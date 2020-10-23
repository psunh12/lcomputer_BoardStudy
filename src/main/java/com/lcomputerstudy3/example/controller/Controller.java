package com.lcomputerstudy3.example.controller;

//import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
//import com.lcomputerstudy3.example.domain.Board;
import com.lcomputerstudy3.example.domain.User;
import com.lcomputerstudy3.example.service.BoardService;


@org.springframework.stereotype.Controller
public class Controller {
	@Autowired BoardService boardservice;
	
   @RequestMapping("/")
   public String home(Model model) {
       
//	   List<Board> list = boardservice.selectBoardList();
//	   model.addAttribute("list",list);
	   return "/index";
   }
   
   @RequestMapping("/beforeSignUp")
   public String beforeSignUp() {
	   return "/signup";
   }
   @RequestMapping("/signup")
   public String signup(User user) {
	   return "/login";
   }
}

