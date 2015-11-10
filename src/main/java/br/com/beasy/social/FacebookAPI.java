package br.com.beasy.social;

import org.scribe.builder.ServiceBuilder;
import org.scribe.builder.api.FacebookApi;
import org.scribe.model.OAuthRequest;
import org.scribe.model.Response;
import org.scribe.model.Token;
import org.scribe.model.Verb;
import org.scribe.model.Verifier;
import org.scribe.oauth.OAuthService;

import br.com.beasy.model.User;
import br.com.beasy.model.UserType;
import br.com.caelum.vraptor.environment.Environment;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class FacebookAPI {
	private Token accessToken;
	private Environment env;
	private OAuthService service;

	public FacebookAPI(Environment env) {
		this.env = env;
	}
	
	public OAuthService getOAuthService() {
		this.service = new ServiceBuilder()
		.provider(FacebookApi.class)
		.apiKey(env.get("facebook.api.key"))
		.apiSecret(env.get("facebook.api.secret"))
		.callback(env.get("facebook.callback"))
		.scope("email")
		.build();
		
		return service;
	}
	
	public Token getAccessToken(String code) {
		Verifier verifier = new Verifier(code);
		this.accessToken = service.getAccessToken(null, verifier);
		return accessToken;
	}
	
	public Response makeRequest(String url) {
		OAuthRequest request = new OAuthRequest(Verb.GET, url);
	    service.signRequest(accessToken, request);
	    Response response = request.send();
	    return response;
	}

	public User getUserFromFacebookJson(String responseBody) {
		JsonObject jsonObject = new JsonParser().parse(responseBody).getAsJsonObject();
	    
	    JsonElement id = jsonObject.get("id");
	    JsonElement name = jsonObject.get("name");
	    JsonElement email = jsonObject.get("email");
	    JsonElement picture = jsonObject.getAsJsonObject("picture").getAsJsonObject("data").get("url");
	    
	    User user = new User();
		user.setName(name != null ? name.getAsString() : null);
		user.setEmail(email != null ? email.getAsString() : null);
		user.setFacebookId(id != null ? id.getAsString() : null);
		user.setUserType(UserType.FACEBOOK);
		user.setPictureUrl(picture.getAsString());
		
		return user;
	}
}
