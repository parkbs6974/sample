package com.mystudy.ajax.vo;

public class QnaVO {
	public int quesNum;
	public String id;
	public String quesTitle;
	public String quesCont;
	public String pwCheck;
	public String queFile;
	public String queDate;
	
	public int getQuesNum() {
		return quesNum;
	}
	public void setQuesNum(int quesNum) {
		this.quesNum = quesNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQuesTitle() {
		return quesTitle;
	}
	public void setQuesTitle(String quesTitle) {
		this.quesTitle = quesTitle;
	}
	public String getQuesCont() {
		return quesCont;
	}
	public void setQuesCont(String quesCont) {
		this.quesCont = quesCont;
	}
	public String getPwCheck() {
		return pwCheck;
	}
	public void setPwCheck(String pwCheck) {
		this.pwCheck = pwCheck;
	}
	public String getqueFile() {
		return queFile;
	}
	public void setqueFile(String queFile) {
		this.queFile = queFile;
	}
	public String getQueDate() {
		return queDate;
	}
	public void setQueDate(String queDate) {
		this.queDate = queDate;
	}
	@Override
	public String toString() {
		return "QnaVO [quesNum=" + quesNum + ", id=" + id + ", quesTitle=" + quesTitle + ", quesCont=" + quesCont
				+ ", pwCheck=" + pwCheck + ", queFile=" + queFile + ", queDate=" + queDate + "]";
	}
	
	
	
	
}
