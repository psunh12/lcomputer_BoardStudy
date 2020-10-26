package com.lcomputerstudy3.example.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.GrantedAuthority;
import com.lcomputerstudy3.example.domain.User;

@Mapper
public interface UserMapper {
		public User readUser(String username);
		public void creatUser(User user);
		public List<GrantedAuthority> readAuthorities(String username);
		public void createAuthority(User user);

}
