package br.com.beasy.dao;

import java.util.List;

import javax.inject.Inject;

import org.hibernate.Session;

import br.com.beasy.model.SubTask;
import br.com.beasy.model.Task;

public class SubTaskDao {
	@Inject private Session session;
	
	public void addSubTask(SubTask subTask) {
		session.save(subTask);
	}
	
	public void updateSubTask(SubTask subTask) {
		session.update(subTask);
	}
	
	public List<SubTask> getAllSubTasksFromTask(Task task) {
		List<SubTask> subTasks = (List<SubTask>) session.createQuery("from SubTask s where s.task_id=:task_id")
				.setLong("task_id", task.getId());
		return subTasks;
	}
	
	public void deleteSubTask(SubTask subTask) {
		session.delete(subTask);
	}
}
