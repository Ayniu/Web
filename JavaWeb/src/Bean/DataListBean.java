package Bean;

import java.sql.Timestamp;

public class DataListBean {
	
	private String username;
	private String dataname;
	private String dataintroduce;
	private String datapath;
	private String datatype;
	private Timestamp datadate;
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getDataname() {
		return dataname;
	}
	public void setDataname(String dataname) {
		this.dataname = dataname;
	}
	public String getDataintroduce() {
		return dataintroduce;
	}
	public void setDataintroduce(String dataintroduce) {
		this.dataintroduce = dataintroduce;
	}
	public String getDatapath() {
		return datapath;
	}
	public void setDatapath(String datapath) {
		this.datapath = datapath;
	}
	public String getDatatype() {
		return datatype;
	}
	public void setDatatype(String datatype) {
		this.datatype = datatype;
	}
	public Timestamp getDatadate() {
		return datadate;
	}
	public void setDatadate(Timestamp datadate) {
		this.datadate = datadate;
	}
	
}

