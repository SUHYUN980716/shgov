package org.shgov.security;

import org.shgov.dao.MemberDao;
import org.shgov.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailService implements UserDetailsService{
	@Setter(onMethod_ = { @Autowired })
	private MemberDao dao;
	

	@Override
	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
		User vo = dao.read(userId);
		System.out.println(vo);
		return vo == null? null : new CustomUser(vo);
	}

}
