package cn.teng.member.entity;

import java.io.Serializable;

/**
 * 学生实体
 * 
 * @author tx
 *
 */
public class Student implements Serializable {
	private static final long serialVersionUID = -1756241579303707517L;
	
	private Integer id;
	private String studentId;
	private String username;
	private String password;
	private String className;
	private String major;
	private String departdent;
	private Integer status;

	public Student(Integer id, String studentId, String username, String password, String className, String major,
			String departdent, Integer status) {
		super();
		this.id = id;
		this.studentId = studentId;
		this.username = username;
		this.password = password;
		this.className = className;
		this.major = major;
		this.departdent = departdent;
		this.status = status;
	}

	public Student() {
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
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

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getDepartdent() {
		return departdent;
	}

	public void setDepartdent(String departdent) {
		this.departdent = departdent;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", " + "studentId=" + studentId + "," + " username=" + username + ", "
				+ "password=" + password + ", " + "className=" + className + "," + " major=" + major + ", "
				+ "departdent=" + departdent +  ", status=" + status + "]";
	}

}
