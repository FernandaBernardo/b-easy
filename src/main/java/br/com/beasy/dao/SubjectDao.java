package br.com.beasy.dao;

import java.util.List;

import javax.inject.Inject;

import org.hibernate.Session;

import br.com.beasy.model.Subject;
import br.com.beasy.model.User;

public class SubjectDao {
	@Inject private Session session;
	
	public void addSubject(Subject subject) {
		session.save(subject);
	}
	
	public void updateSubject(Subject subject) {
		session.update(subject);
	}
	
	public Subject getSubjectByName(String name) {
		Subject subject = (Subject) session.createQuery("from Subject s where s.name=:name").setString("name", name);
		return subject;
	}
	
	public List<Subject> getAllSubjectsFromUser(User user) {
		List<Subject> subjects = (List<Subject>)session.createQuery("from Subject s where s.user_id=:user_id")
				.setLong("user_id", user.getId());
		return subjects;
	}
	
	public void deleteSubject(Subject subject) {
		session.delete(subject);
	}
}
