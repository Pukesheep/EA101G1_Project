package com.question.model;

import java.util.List;


public interface Question_inetrface {
	public void insert(QuestionVO queVO);

	public void update(QuestionVO queVO);

	public void delete(String qa_id);

	public QuestionVO findByPrimaryKey(String qa_id);

	public List<QuestionVO> getAll();

}
