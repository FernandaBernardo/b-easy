package br.com.beasy.model;

import java.io.Serializable;

import javax.enterprise.context.SessionScoped;

@SessionScoped
public class WebUser implements Serializable{
	private User logged;
	
	public void login(User user) {
		this.logged = user;
	}
	
	public String getName() {
		return logged.getName();
	}
	
	public boolean isLogged() {
		return logged != null;
	}

	public void logout() {
		this.logged = null;
	}
}
