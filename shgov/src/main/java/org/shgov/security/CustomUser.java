package org.shgov.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.shgov.domain.User;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import lombok.Getter;

@Getter
public class CustomUser extends org.springframework.security.core.userdetails.User{
	private static final long serialVersionUID = 1L;

	private User member;

	public CustomUser(String username, String password,  Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	public CustomUser(User vo) {
		super(vo.getUserId(), vo.getUserPassword(), vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getUserRole())).collect(Collectors.toList()));
		this.member = vo;
	}

}
