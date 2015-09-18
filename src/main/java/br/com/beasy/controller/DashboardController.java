package br.com.beasy.controller;

import javax.inject.Inject;

import br.com.beasy.interceptor.AuthenticationRequired;
import br.com.beasy.model.WebUser;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Result;

@Controller
public class DashboardController {
	@Inject private Result result;
	@Inject private WebUser webUser;
	
	@Get("/dashboard")
	@AuthenticationRequired
	public void dashboard() {
		result.include("user", webUser);
	}
}
