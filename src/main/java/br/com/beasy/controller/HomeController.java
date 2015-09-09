package br.com.beasy.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Result;

@Controller
public class HomeController {
	@Inject Result result;
	
	@Get("/")
	public void home() {
		
	}
}
