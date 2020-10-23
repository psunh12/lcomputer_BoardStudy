package com.lcomputerstudy3.example.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import com.lcomputerstudy3.example.domain.Board;
import org.springframework.stereotype.Service;
import com.lcomputerstudy3.example.mapper.BoardMapper;


@Service("BoardServiceImpl")
public class BoardServiceImpl implements BoardService {

	@Autowired BoardMapper boardmapper;
	@Override
	public List<Board> selectBoardList(){
		return boardmapper.selectBoardList();
	}
@Service	
public class UserServiceImpl implements UserService{
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException{
		return null;
		}
	}
}