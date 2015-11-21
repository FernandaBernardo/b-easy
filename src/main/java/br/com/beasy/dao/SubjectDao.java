package br.com.beasy.dao;

import java.util.List;

import javax.inject.Inject;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

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
		Subject subject = (Subject) session.createQuery("from Subject s where s.name=:name")
				.setString("name", name)
				.uniqueResult();
		return subject;
	}
	
	public List<Subject> getAllSubjectsFromUser(User user) {
		return session.createCriteria(Subject.class)
				.add(Restrictions.eq("user.email", user.getEmail()))
				.list();
	}
	
	public void deleteSubject(Subject subject) {
		session.delete(subject);
	}

	public Subject getSubjectById(Long subjectId) {
		return (Subject) session.createCriteria(Subject.class)
				.add(Restrictions.eq("id", subjectId))
				.uniqueResult();
	}
}
