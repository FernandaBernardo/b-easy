package br.com.beasy.controller;

import javax.inject.Inject;

import br.com.beasy.dao.UserDao;
import br.com.beasy.model.User;
import br.com.beasy.model.LoggedUser;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;

@Controller
public class LoginController {

	@Inject private Result result;
	@Inject private LoggedUser loggedUser;
	@Inject private UserDao dao;

	@Get("/login")
	public void login() {
	}
	
	@Post("/login")
	public void login(User user) {
		User loadUser = dao.loadUser(user);
		if(loadUser == null) {
			result.include("validate", "Login e/ou senha inválidos");
		} else {
			loggedUser.login(loadUser);
			result.redirectTo(DashboardController.class).dashboard();
		}
	}
	
	@Get("/cadastro")
	public void newUser() {
	}
	
	@Post("/cadastro")
	public void newUser(User user) {
		if(dao.userExist(user)){
			System.out.println("Login já existe!");
		} else {
			dao.addUser(user);
		}
	}

	@Get("/logout")
	public void logout() {
		loggedUser.logout();
		result.redirectTo(HomeController.class).home();
	}
}