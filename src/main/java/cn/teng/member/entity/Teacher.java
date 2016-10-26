package cn.teng.member.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 教师实体
 * 
 * @author tx
 * 
 */
public class Teacher implements Serializable {

	private static final long serialVersionUID = -1756241579303707517L;

	private Integer id;
	private String teacherId;
	private String username;
	private String password;
	private String major;
	private int age;
	private int teachAge;
	private int status;
	private String freeTime;
	private String description;
	public Teacher(Integer id, String teacherId, String username, String password, String major, int age, int teachAge,
			int status, String freeTime, String description) {
		super();
		this.id = id;
		this.teacherId = teacherId;
		this.username = username;
		this.password = password;
		this.major = major;
		this.age = age;
		this.teachAge = teachAge;
		this.status = status;
		this.freeTime = freeTime;
		this.description = description;
	}
	public Teacher() {
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getTeachAge() {
		return teachAge;
	}
	public void setTeachAge(int teachAge) {
		this.teachAge = teachAge;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getFreeTime() {
		return freeTime;
	}
	public void setFreeTime(String freeTime) {
		this.freeTime = freeTime;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
