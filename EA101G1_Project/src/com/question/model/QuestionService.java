package com.question.model;

import java.util.List;

public class QuestionService {
	private Question_inetrface dao;
	
	public QuestionService() {
		dao=new QuestionDAO();
	}
	
	public QuestionVO addQuestion(String que,String ans) {
		QuestionVO queVO=new QuestionVO();
		queVO.setQue(que);
		queVO.setAns(ans);
		dao.insert(queVO);
		
		return queVO;
	}
	
	public QuestionVO updateQuestion(String que,String ans){
		QuestionVO queVO=new QuestionVO();
		queVO.setQue(que);
		queVO.setAns(ans);
		
		dao.update(queVO);
		return queVO;
	}
	public void deleteQuestion(String qa_id) {
		dao.delete(qa_id);
	}	
	public QuestionVO getQuestion(String qa_id) {
		return dao.findByPrimaryKey(qa_id);
	}
	public List<QuestionVO> getAll() {
//		List<CustomerMessageVO> a = new ArrayList<CustomerMessageVO>(new HashSet<CustomerMessageVO>(dao.getAll()));
		return dao.getAll();
	}
}
