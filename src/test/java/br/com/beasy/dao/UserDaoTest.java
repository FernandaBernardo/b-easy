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
	private static final String EMAIL = "fernanda@gmail.com";
	private UserDao dao;
	private Session session;
	private User defaultUser;
	
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
	}
	
	private void assertUser(User user2) {
		assertEquals(defaultUser.getPassword(), user2.getPassword());
		assertEquals(defaultUser.getAge(), user2.getAge());
		assertEquals(defaultUser.getCourse(), user2.getCourse());
		assertEquals(defaultUser.getSemester(), user2.getSemester());
		assertEquals(defaultUser.getCollege(), user2.getCollege());
		assertEquals(defaultUser.getName(), user2.getName());
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
