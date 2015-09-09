package br.com.beasy.dao;

import javax.inject.Inject;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import br.com.beasy.converter.PasswordConverter;
import br.com.beasy.model.User;

public class UserDao {
	@Inject private Session session;
	
	public void addUser(User user) {
		String password = user.getPassword();
		String encryptPass = PasswordConverter.encrypt(password);
		user.setPassword(encryptPass);
		
		session.save(user);
	}
	
	public void updateUser(User user) {
		session.update(user);
	}
	
	public User getUserByEmail(String email) {
		User user = (User) session.createQuery("from User u where u.email=:email")
				.setString("email", email)
				.uniqueResult();
		return user;
	}
	
	public User loadUser(User user) {
		String password = user.getPassword();
		String encryptPass = PasswordConverter.encrypt(password);
		user.setPassword(encryptPass);
		 return (User) session.createCriteria(User.class)
			      .add(Restrictions.eq("email", user.getEmail()))
			      .add(Restrictions.eq("password", user.getPassword()))
			      .uniqueResult();
	}
	
	public boolean userExist(User user) {
		User userFound = (User) session.createCriteria(User.class)
				.add(Restrictions.eq("email", user.getEmail()))
				.uniqueResult();
		return userFound != null;
	}
}
