package br.com.beasy.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.beasy.dao.SubjectDao;
import br.com.beasy.dao.TaskDao;
import br.com.beasy.interceptor.AuthenticationRequired;
import br.com.beasy.model.LoggedUser;
import br.com.beasy.model.Status;
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
		
		List<Task> nextTasks = taskDao.getNextTasks();
		result.include("nextTasks", nextTasks);
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
	
	@Get("/{subject.id}/tarefas")
	@AuthenticationRequired
	public void showTasks(Subject subject) {
		Subject subjectById = subjectDao.getSubjectById(subject.getId());
		subjectById.setTasks(taskDao.getAllTasksFromSubject(subjectById));
		
		result.include("subject", subjectById);
	}
	
	@Get("/{subject.id}/tarefas/{task.id}/{status}")
	@AuthenticationRequired
	public void changeTask(Subject subject, Task task, Status toStatus) {
		
		result.forwardTo(DashboardController.class).showTasks(subject);;
	}
}
