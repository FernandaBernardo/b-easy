package br.com.beasy.model;

public enum UserType {
	NATIVE(1), 
	FACEBOOK(2);
	
	private int type;
	
	private UserType(int type) {
		this.type = type;
	}
	
	public int getType() {
		return type;
	}
}
