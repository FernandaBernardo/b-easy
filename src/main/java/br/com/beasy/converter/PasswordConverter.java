package br.com.beasy.converter;

import java.security.MessageDigest;
import java.util.Base64;

public class PasswordConverter {
	public static String encrypt(String password){
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			
			md.update(password.getBytes("UTF-8"));
			
			byte[] hash = md.digest();
			String output = Base64.getEncoder().encodeToString(hash);

			return output;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return null;
	}
}
