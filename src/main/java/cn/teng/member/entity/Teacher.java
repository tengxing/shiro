package cn.teng.member.entity;

import java.io.Serializable;

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
	private String name;
	private String password;
	private String age;
	private String teachAge;
	private String description;

	public Teacher(Integer id, String teacherId, String name, String password, String age, String teachAge,
			String description) {
		super();
		this.id = id;
		this.teacherId = teacherId;
		this.name = name;
		this.password = password;
		this.age = age;
		this.teachAge = teachAge;
		this.description = description;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getTeachAge() {
		return teachAge;
	}

	public void setTeachAge(String teachAge) {
		this.teachAge = teachAge;
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
