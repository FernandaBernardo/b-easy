package br.com.beasy.dao;

import javax.inject.Inject;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import br.com.beasy.converter.PasswordConverter;
import br.com.beasy.model.User;
import br.com.beasy.model.UserType;

public class UserDao {
	private Session session;
	
	@Deprecated
	public UserDao() {
	}
	
	@Inject
	public UserDao(Session session) {
		this.session = session;
	}
	
	public void addUser(User user) {
		if (user.getLoginType() == UserType.NATIVE) {
			String password = user.getPassword();
			String encryptPass = PasswordConverter.encrypt(password);
			user.setPassword(encryptPass);
		}
		
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
	
	public User getUserByFacebookId(String facebookId) {
		User user = (User) session.createQuery("from User u where u.facebookId=:facebookId")
				.setString("facebookId", facebookId)
				.uniqueResult();
		return user;
	}
	
	public User loadNativeUser(User user) {
		String password = user.getPassword();
		String encryptPass = PasswordConverter.encrypt(password);
		user.setPassword(encryptPass);
		 return (User) session.createCriteria(User.class)
			      .add(Restrictions.eq("email", user.getEmail()))
			      .add(Restrictions.eq("password", user.getPassword()))
			      .uniqueResult();
	}
	
	public boolean userExist(User user) {
		UserType loginType = user.getLoginType();
		User userFound = null; 
		
		if(loginType == UserType.FACEBOOK) {
			userFound = (User) session.createCriteria(User.class)
					.add(Restrictions.eq("facebookId", user.getFacebookId()))
					.uniqueResult();
		} else {
			userFound = (User) session.createCriteria(User.class)
					.add(Restrictions.eq("email", user.getEmail()))
					.uniqueResult();
		}
		return userFound != null;
	}
}
