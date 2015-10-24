package br.com.beasy.controller;

import javax.inject.Inject;

import org.scribe.builder.ServiceBuilder;
import org.scribe.builder.api.FacebookApi;
import org.scribe.model.OAuthRequest;
import org.scribe.model.Response;
import org.scribe.model.Token;
import org.scribe.model.Verb;
import org.scribe.model.Verifier;
import org.scribe.oauth.OAuthService;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import br.com.beasy.dao.UserDao;
import br.com.beasy.model.LoggedUser;
import br.com.beasy.model.User;
import br.com.beasy.model.UserType;
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
		} else {
			user.setUserType(UserType.NATIVE);
			dao.addUser(user);
		}
	}
	
	@Get("/facebook")
	public void requestToken() {
		String url = getOAuthService().getAuthorizationUrl(null);
		result.redirectTo(url);
	}
	
	@Get("/facebook/login")
	public void login(String code) {
		OAuthService service = getOAuthService();
		Verifier verifier = new Verifier(code);
		Token token = service.getAccessToken(null, verifier);
		
		OAuthRequest request = new OAuthRequest(Verb.GET, "https://graph.facebook.com/me?fields=email,name,id");
	    service.signRequest(token, request);
	    Response response = request.send();
		
	    String responseBody = response.getBody();
	    
	    JsonObject jsonObject = new JsonParser().parse(responseBody).getAsJsonObject();
	    
	    JsonElement id = jsonObject.get("id");
	    JsonElement name = jsonObject.get("name");
	    JsonElement email = jsonObject.get("email");
	    
	    User user = new User();
		user.setName(name != null ? name.getAsString() : null);
		user.setEmail(email != null ? email.getAsString() : null);
		user.setFacebookId(id != null ? id.getAsString() : null);
		user.setUserType(UserType.FACEBOOK);
	    
	    if(!dao.userExist(user)){
	    	dao.addUser(user);
		} 
	    
	    loggedUser.login(user);
	    result.redirectTo(DashboardController.class).dashboard();
	}
	
	@Get("/logout")
	public void logout() {
		loggedUser.logout();
		result.redirectTo(HomeController.class).home();
	}
	
	private OAuthService getOAuthService() {
		return new ServiceBuilder()
		.provider(FacebookApi.class)
		.apiKey(env.get("facebook.api.key"))
		.apiSecret(env.get("facebook.api.secret"))
		.callback("http://localhost:8080/b-easy/facebook/login")
		.scope("email")
		.build();
	}
}