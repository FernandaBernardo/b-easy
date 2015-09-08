package br.com.beasy.dao;

import javax.inject.Inject;

import org.hibernate.Session;

import br.com.beasy.model.User;

public class UserDao {
	@Inject private Session session;
	
	public void addUser(User user) {
		session.save(user);
	}
	
	public void updateUser(User user) {
		session.update(user);
	}
	
	public User getUserByEmail(String email) {
		User user = (User) session.createQuery("from User u where u.email=:email").setString("email", email).setMaxResults(1);
		return user;
	}
}
