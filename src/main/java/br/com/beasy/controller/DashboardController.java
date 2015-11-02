package br.com.beasy.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.beasy.dao.SubjectDao;
import br.com.beasy.interceptor.AuthenticationRequired;
import br.com.beasy.model.LoggedUser;
import br.com.beasy.model.Subject;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;

@Controller
public class DashboardController {
	@Inject private Result result;
	@Inject private SubjectDao subjectDao;
	@Inject private LoggedUser loggedUser;

	@Get("/dashboard")
	@AuthenticationRequired
	public void dashboard() {
		List<Subject> subjects = subjectDao.getAllSubjectsFromUser(loggedUser.getUser());
		loggedUser.getUser().setSubjects(subjects);
	}

	@Post("/nova-materia")
	@AuthenticationRequired
	public void newSubject(Subject subject) {
		subject.setUser(loggedUser.getUser());
		subjectDao.addSubject(subject);
		result.redirectTo(DashboardController.class).dashboard();
	}
}
