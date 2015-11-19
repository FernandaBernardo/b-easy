package br.com.beasy.controller;

import javax.inject.Inject;

import br.com.beasy.dao.UserDao;
import br.com.beasy.model.User;
import br.com.caelum.vraptor.Consumes;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;

@Controller
public class MobileController {
	@Inject
	private Result result;
	@Inject 
	private UserDao userDao;
	
	@Post("/mobile/login/")
	@Consumes("application/json")
	public void login(String email, String password) {
		User user = new User();
		user.setEmail(email);
		user.setPassword(password);
		
		user = userDao.loadNativeUser(user);

		result.use(Results.json()).from(user).serialize();
		result.nothing();
	}
	
}
