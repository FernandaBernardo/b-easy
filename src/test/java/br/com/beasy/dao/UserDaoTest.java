
package br.com.beasy.dao;

import static org.junit.Assert.assertEquals;

import org.hibernate.Session;
import org.hibernate.cfg.AnnotationConfiguration;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import br.com.beasy.model.User;
import br.com.beasy.model.UserType;

public class UserDaoTest {
	private static final String PASSWORD = "1234";
	private static final String EMAIL = "fernanda123@gmail.com";
	private static final String EMAIL_FACEBOOK = "fe@gmail.com";
	private static final String FACEBOOK_ID = "1234567890abcdefg";
	private UserDao dao;
	private Session session;
	private User defaultUser;
	private User facebookUser;
	
	@Before
	public void setup() {
		createConnection();
		dao = new UserDao(session);
		
		addUser();
	}

	@Test
	public void should_get_user_by_email() {
		User user2 = dao.getUserByEmail(EMAIL);
		
		assertUser(user2);
	}
	
	@Test
	public void should_verify_if_user_exist(){
		boolean userExist = dao.userExist(defaultUser);
		assertEquals(true, userExist);
		
		boolean userExist2 = dao.userExist(facebookUser);
		assertEquals(true, userExist2);
	}
	
	@Test
	public void should_verify_if_load_user(){
		User user = dao.loadNativeUser(defaultUser);
		assertUser(user);
	}
	
	@Test
	public void should_get_user_by_facebook_id(){
		User user = dao.getUserByFacebookId(FACEBOOK_ID);
		assertFacebookUser(user);
	}
	
	@Test
	public void should_merge_user(){
		assertUser(defaultUser);
		assertEquals(null, defaultUser.getPictureUrl());
		defaultUser.setPictureUrl("http://image.com.br");
		dao.mergeAndUpdateUser(defaultUser);
		assertEquals("http://image.com.br", defaultUser.getPictureUrl());
	}
	
	private void assertUser(User user2) {
		assertEquals(defaultUser.getPassword(), user2.getPassword());
		assertEquals(defaultUser.getAge(), user2.getAge());
		assertEquals(defaultUser.getCourse(), user2.getCourse());
		assertEquals(defaultUser.getSemester(), user2.getSemester());
		assertEquals(defaultUser.getCollege(), user2.getCollege());
		assertEquals(defaultUser.getName(), user2.getName());
	}
	
	private void assertFacebookUser(User user2) {
		assertEquals(facebookUser.getFacebookId(), user2.getFacebookId());
		assertEquals(facebookUser.getEmail(), user2.getEmail());
	}
	
	private void addUser() {
		defaultUser = new User();
		defaultUser.setEmail(EMAIL);
		defaultUser.setPassword(PASSWORD);
		defaultUser.setUserType(UserType.NATIVE);
		defaultUser.setAge(21);
		defaultUser.setCourse("Sistemas de Informação");
		defaultUser.setSemester(8);
		defaultUser.setCollege("USP");
		defaultUser.setName("Fernanda Bernardo");
		
		dao.addUser(defaultUser);
		
		facebookUser = new User();
		facebookUser.setEmail(EMAIL_FACEBOOK);
		facebookUser.setFacebookId(FACEBOOK_ID);
		facebookUser.setUserType(UserType.FACEBOOK);
		
		dao.addUser(facebookUser);
	}

	//TODO arrumar esse método
	private void createConnection() {
		AnnotationConfiguration cfg = new AnnotationConfiguration();
		cfg.configure().setProperty("hibernate.connection.url", "jdbc:mysql://localhost/b-easy");
		this.session = cfg.buildSessionFactory().openSession();
		session.beginTransaction();
	}
	
	@After
	public void tearDown() throws Exception {
		if (session != null && session.getTransaction().isActive()) {
			session.getTransaction().rollback();
		}
	}
}
