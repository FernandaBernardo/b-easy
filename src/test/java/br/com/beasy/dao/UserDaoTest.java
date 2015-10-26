package br.com.beasy.dao;

import static org.junit.Assert.assertEquals;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.junit.Before;
import org.junit.Test;

import br.com.beasy.converter.PasswordConverter;
import br.com.beasy.model.SubTask;
import br.com.beasy.model.Subject;
import br.com.beasy.model.Task;
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
		defaultUser.setPassword(PasswordConverter.encrypt(PASSWORD));
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
		AnnotationConfiguration configuration = new AnnotationConfiguration();
		configuration.addAnnotatedClass(User.class)
					.addAnnotatedClass(Subject.class)
		  			.addAnnotatedClass(Task.class)
		  			.addAnnotatedClass(SubTask.class);
		  configuration.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5InnoDBDialect");
		  configuration.setProperty("hibernate.connection.driver_class", "com.mysql.jdbc.Driver");
		  configuration.setProperty("hibernate.connection.url", "jdbc:mysql://localhost/b-easy");
		  configuration.setProperty("hibernate.connection.username", "root");
		  configuration.setProperty("hibernate.connection.password", "");
		  configuration.setProperty("hibernate.hbm2ddl.auto", "update");
		  
		  SessionFactory sessionFactory = configuration.buildSessionFactory();
		  this.session = sessionFactory.openSession();
	}
}
