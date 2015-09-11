package br.com.beasy.interceptor;

import javax.inject.Inject;

import br.com.beasy.controller.LoginController;
import br.com.beasy.model.WebUser;
import br.com.caelum.vraptor.InterceptionException;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.controller.ControllerMethod;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;

@Intercepts
public class AuthenticationInterceptor implements Interceptor{
	@Inject private WebUser user;
	@Inject private Result result;
	
	@Override
	public boolean accepts(ControllerMethod method) {
		return !this.user.isLogged() && method.containsAnnotation(AuthenticationRequired.class);
	}

	@Override
	public void intercept(InterceptorStack stack, ControllerMethod method,
			Object obj) throws InterceptionException {
		result.redirectTo(LoginController.class).login();
	}

}
