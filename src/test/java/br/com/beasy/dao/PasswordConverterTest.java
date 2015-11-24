package br.com.beasy.dao;

import static org.junit.Assert.*;

import org.junit.Test;

import br.com.beasy.converter.PasswordConverter;

public class PasswordConverterTest {
	private static final String PASSWORD = "1234";
	private static final String PASSWORD2 = "4321";
	
	@Test
	public void should_not_return_equals() {
		String encrypt = PasswordConverter.encrypt(PASSWORD);
		String encrypt2 = PasswordConverter.encrypt(PASSWORD2);
		
		assertNotEquals(encrypt, encrypt2);
	}
	
	@Test
	public void should_return_equals() {
		String encrypt = PasswordConverter.encrypt(PASSWORD);
		String encrypt2 = PasswordConverter.encrypt(PASSWORD);
		
		assertEquals(encrypt, encrypt2);
	}
}
