package br.com.beasy.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
public class Subject {
	@Id @GeneratedValue
	private Long id;
	private String name;
	private String color;
	@ManyToOne @Cascade(CascadeType.PERSIST)
	private User user;
	@OneToMany
	private List<Task> tasks;
	
	public int getProgress(){
		int progress = 0;
		int total = tasks.size() == 0 ? 1 : tasks.size();
		
		for (Task task : tasks) {
			if(task.getStatus().equals(Status.DONE)) {
				progress++;
			}
		}
		
		return progress/total;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<Task> getTasks() {
		return tasks;
	}
	public void setTasks(List<Task> tasks) {
		this.tasks = tasks;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
}
