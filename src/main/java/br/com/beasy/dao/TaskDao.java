package br.com.beasy.dao;

import java.util.List;

import javax.inject.Inject;

import org.hibernate.Session;

import br.com.beasy.model.LoggedUser;
import br.com.beasy.model.Subject;
import br.com.beasy.model.Task;
import br.com.beasy.model.User;

public class TaskDao {
	@Inject private Session session;
	@Inject private LoggedUser loggedUser;
	
	public void addTask(Task task) {
		session.save(task);
	}
	
	public void updateTask(Task task) {
		session.update(task);
	}
	
	public List<Task> getAllTasksFromSubject(Subject subject) {
		List<Task> tasks = (List<Task>) session.createQuery("from Task t where t.subject_id=:subject_id")
				.setLong("subject_id", subject.getId());
		return tasks;
	}
	
	public List<Task> getAllTasksFromUser(User user) {
		List<Task> tasks = (List<Task>) session.createQuery("from Subject s, Task t where s.user_email = :user_email "
				+ "and t.subject_id = s.id").setString("user_email", user.getEmail());
		return tasks;
	}

	public void deleteTask(Task task) {
		session.delete(task);
	}

	public List<Task> getNextTasks() {
		List<Task> nextTasks = (List<Task>) session.createQuery
				("select t "
				+ "from Task t, Subject s, User u "
				+ "where t.subject.id = s.id "
				+ "and s.user.email = u.email "
				+ "and s.user.email = :user_email")
				.setString("user_email", loggedUser.getUser().getEmail())
				.list();
		return nextTasks;
	}
}
