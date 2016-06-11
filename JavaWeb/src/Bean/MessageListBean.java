package Bean;

import java.sql.Timestamp;

public class MessageListBean {

	private String id;
	private String userid;
	private String context;
	private Timestamp usertimetamp;
	private String manageid;
	private String answer;
	private Timestamp managetimetamp;
	
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public Timestamp getUsertimetamp() {
		return usertimetamp;
	}
	public void setUsertimetamp(Timestamp usertimetamp) {
		this.usertimetamp = usertimetamp;
	}
	public String getManageid() {
		return manageid;
	}
	public void setManageid(String manageid) {
		this.manageid = manageid;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Timestamp getManagetimetamp() {
		return managetimetamp;
	}
	public void setManagetimetamp(Timestamp managetimetamp) {
		this.managetimetamp = managetimetamp;
	}
	
}
