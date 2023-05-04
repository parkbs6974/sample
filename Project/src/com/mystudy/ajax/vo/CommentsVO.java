package com.mystudy.ajax.vo;

public class CommentsVO {
	public int commNum;
	public String commCont;
	public String commDate;
	public int quesNum;
	public int getCommNum() {
		return commNum;
	}
	public void setCommNum(int commNum) {
		this.commNum = commNum;
	}
	public String getCommCont() {
		return commCont;
	}
	public void setCommCont(String commCont) {
		this.commCont = commCont;
	}
	public String getCommDate() {
		return commDate;
	}
	public void setCommDate(String commDate) {
		this.commDate = commDate;
	}
	public int getQuesNum() {
		return quesNum;
	}
	public void setQuesNum(int quesNum) {
		this.quesNum = quesNum;
	}
	@Override
	public String toString() {
		return "CommentsVO [commNum=" + commNum + ", commCont=" + commCont + ", commDate=" + commDate + ", quesNum="
				+ quesNum + "]";
	}
	
	
	
	
	
}
