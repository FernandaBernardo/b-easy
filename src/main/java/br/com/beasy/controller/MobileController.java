package br.com.beasy.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.beasy.dao.SubjectDao;
import br.com.beasy.dao.TaskDao;
import br.com.beasy.dao.UserDao;
import br.com.beasy.model.Subject;
import br.com.beasy.model.Task;
import br.com.beasy.model.User;
import br.com.beasy.model.UserType;
import br.com.caelum.vraptor.Consumes;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;

import com.google.gson.annotations.Expose;

@Controller
public class MobileController {
	@Inject
	private Result result;
	@Inject 
	private UserDao userDao;
	@Inject 
	private SubjectDao subjectDao;
	@Inject 
	private TaskDao taskDao;
	
	@Post("/mobile/login/")
	@Consumes("application/json")
	public void login(String email, String password) {
		User user = new User();
		user.setEmail(email);
		user.setPassword(password);
		user.setUserType(UserType.NATIVE);
		
		user = userDao.loadNativeUser(user);
		List<Subject> subjects = subjectDao.getAllSubjectsFromUser(user);
		user.setSubjects(subjects);
		
		result.use(Results.json()).from(user).include("subjects").serialize();
		result.nothing();
	}
	
	@Post("/mobile/login-facebook/")
	@Consumes("application/json")
	public void loginFacebook(String facebookId) {
		User user = new User();
		user.setFacebookId(facebookId);
		user.setUserType(UserType.FACEBOOK);
		
		user = userDao.getUserByFacebookId(facebookId);
		
		List<Subject> subjects = subjectDao.getAllSubjectsFromUser(user);
		user.setSubjects(subjects);
		
		result.use(Results.json()).from(user).include("subjects").serialize();
		result.nothing();
	}
	
	@Post("/mobile/add-subject/")
	@Consumes("application/json")
	public void addSubject(Subject subject) {
		subjectDao.addSubject(subject);
		
		result.use(Results.json()).from(subject).serialize();
		result.nothing();
	}
	
	@Post("/mobile/edit-subject/")
	@Consumes("application/json")
	public void editSubject(Subject subject) {
		subjectDao.updateSubject(subject);
		result.nothing();
	}
	
	@Post("/mobile/remove-subject/")
	@Consumes("application/json")
	public void removeSubject(Subject subject) {
		subjectDao.deleteSubject(subject);
		result.nothing();
	}
	
	@Post("/mobile/get-subjects/")
	@Consumes("application/json")
	public void getSubjects(String email) {
		User user = userDao.getUserByEmail(email);
		List<Subject> subjects = subjectDao.getAllSubjectsFromUser(user);
		result.use(Results.json()).from(subjects).serialize();
		result.nothing();
	}
	
	@Post("/mobile/add-task/")
	@Consumes("application/json")
	public void newTask(Task task) {
		Subject subject = subjectDao.getSubjectById(task.getSubject().getId());
		task.setSubject(subject);
		taskDao.addTask(task);
		result.nothing();
	}
	
	@Post("/mobile/edit-task/")
	@Consumes("application/json")
	public void editTask(Task task) {
		Subject subject = subjectDao.getSubjectById(task.getSubject().getId());
		task.setSubject(subject);
		taskDao.updateTask(task);
		result.nothing();
	}
	
	@Post("/mobile/remove-task/")
	@Consumes("application/json")
	public void removeTask(Task task) {
		taskDao.deleteTask(task);
		result.nothing();
	}
	
	@Post("/mobile/get-tasks/")
	@Consumes("application/json")
	public void removeTask(Subject subject) {
		List<Task> tasks = taskDao.getAllTasksFromSubject(subject);
		result.use(Results.json()).from(tasks).serialize();
		result.nothing();
	}
}
