package br.com.beasy.model;

public enum Status {
	TODO(0),
	DONE(1), 
	DOING(2);
	
	private int status;
	
	private Status(int status) {
		this.status = status;
	}
	
	public int getType() {
		return status;
	}
}
