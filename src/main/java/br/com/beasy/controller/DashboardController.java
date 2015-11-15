package br.com.beasy.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.beasy.dao.SubjectDao;
import br.com.beasy.dao.TaskDao;
import br.com.beasy.interceptor.AuthenticationRequired;
import br.com.beasy.model.LoggedUser;
import br.com.beasy.model.Subject;
import br.com.beasy.model.Task;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;

@Controller
public class DashboardController {
	@Inject private Result result;
	@Inject private SubjectDao subjectDao;
	@Inject private TaskDao taskDao;
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
	
	@Post("/nova-tarefa")
	@AuthenticationRequired
	public void newTask(Task task) {
		Subject subject = subjectDao.getSubjectByName(task.getSubject().getName());
		task.setSubject(subject);
		taskDao.addTask(task);
		result.redirectTo(DashboardController.class).dashboard();
	}
}
