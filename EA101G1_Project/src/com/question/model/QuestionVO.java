package com.question.model;

import java.io.Serializable;

public class QuestionVO implements Serializable{
	private String qa_id;
	private String ans;
	private String que;
	
	
	public QuestionVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getQa_id() {
		return qa_id;
	}
	public void setQa_id(String qa_id) {
		this.qa_id = qa_id;
	}
	public String getAns() {
		return ans;
	}
	public void setAns(String ans) {
		this.ans = ans;
	}
	public String getQue() {
		return que;
	}
	public void setQue(String que) {
		this.que = que;
	}
	
	
	
}
