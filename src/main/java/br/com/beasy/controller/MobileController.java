package br.com.beasy.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.beasy.dao.SubjectDao;
import br.com.beasy.dao.UserDao;
import br.com.beasy.model.Subject;
import br.com.beasy.model.User;
import br.com.beasy.model.UserType;
import br.com.caelum.vraptor.Consumes;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;

@Controller
public class MobileController {
	@Inject
	private Result result;
	@Inject 
	private UserDao userDao;
	@Inject 
	private SubjectDao subjectDao;
	
	@Post("/mobile/login/")
	@Consumes("application/json")
	public void login(String email, String password) {
		User user = new User();
		user.setEmail(email);
		user.setPassword(password);
		user.setUserType(UserType.NATIVE);
		
		user = userDao.loadNativeUser(user);

		result.use(Results.json()).from(user).serialize();
		result.nothing();
	}
	
	@Post("/mobile/login-facebook/")
	@Consumes("application/json")
	public void loginFacebook(String facebookId) {
		User user = new User();
		user.setFacebookId(facebookId);
		user.setUserType(UserType.FACEBOOK);
		
		user = userDao.getUserByFacebookId(facebookId);
		
		result.use(Results.json()).from(user).serialize();
		result.nothing();
	}
	
	@Post("/mobile/add-subject/")
	@Consumes("application/json")
	public void addSubject(Subject subject) {
		subjectDao.addSubject(subject);
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
}
