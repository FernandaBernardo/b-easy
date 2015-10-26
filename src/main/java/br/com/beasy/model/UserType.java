package br.com.beasy.model;


public enum UserType {
	NATIVE(0), 
	FACEBOOK(1);
	
	private int type;
	
	private UserType(int type) {
		this.type = type;
	}
	
	public int getType() {
		return type;
	}
}
