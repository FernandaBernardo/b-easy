package br.com.beasy.controller;

import javax.inject.Inject;

import org.scribe.model.Response;

import br.com.beasy.dao.UserDao;
import br.com.beasy.model.LoggedUser;
import br.com.beasy.model.User;
import br.com.beasy.social.FacebookAPI;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.environment.Environment;

@Controller
public class LoginController {
	@Inject private Result result;
	@Inject private LoggedUser loggedUser;
	@Inject private UserDao dao;
	@Inject private Environment env;

	@Get("/login")
	public void login() {
	}
	
	@Post("/login")
	public void login(User user) {
		User loadUser = dao.loadNativeUser(user);
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
			result.forwardTo(LoginController.class).newUser();
		} else {
			result.redirectTo(LoginController.class).moreInformation(user);;
		}
	}
	
	@Get("/cadastro-mais")
	public void moreInformation(User user) {
		result.include("user", user);
	}
	
	@Post("/cadastro-mais")
	public void saveMoreInformation(User user) {
		dao.addUser(user);
		loggedUser.login(user);
		result.redirectTo(DashboardController.class).dashboard();
	}
	
	@Get("/facebook")
	public void requestToken() {
		FacebookAPI facebookApi = new FacebookAPI(env);
		String url = facebookApi.getOAuthService().getAuthorizationUrl(null);
		result.redirectTo(url);
	}
	
	@Get("/facebook/login")
	public void loginFacebook(String code) {
		FacebookAPI facebookApi = new FacebookAPI(env);
		facebookApi.getOAuthService();
		facebookApi.getAccessToken(code);
		
		Response response = facebookApi.makeRequest("https://graph.facebook.com/me?fields=email,name,id,picture");
		
	    User user = facebookApi.getUserFromFacebookJson(response.getBody());
	    if(!dao.userExist(user)){
	    	result.redirectTo(LoginController.class).moreInformation(user);
		} else {
			dao.mergeAndUpdateUser(user);
			loggedUser.login(user);
			result.redirectTo(DashboardController.class).dashboard();
		}
	}
	
	@Get("/logout")
	public void logout() {
		loggedUser.logout();
		result.redirectTo(HomeController.class).home();
	}
}