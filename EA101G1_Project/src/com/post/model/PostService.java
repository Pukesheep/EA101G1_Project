package com.post.model;

import java.sql.*;

public class PostService {
	
	private PostDAO_interface dao;
	
	public PostService() {
		dao = new PostDAO();
	}
	
	public PostVO addPost(String mem_id,
			Integer ptype_id, Integer p_status, String p_title, 
			String text, byte[] image, Timestamp last_edit, Timestamp post_time) {
		
		PostVO postVO = new PostVO();
		
		postVO.setMem_id(mem_id);
		postVO.setPtype_id(ptype_id);
		postVO.setP_status(p_status);
		postVO.setP_title(p_title);
		postVO.setText(text);
		postVO.setImage(image);
		postVO.setLast_edit(last_edit);
		postVO.setPost_time(post_time);
		String generatedKey = dao.insert(postVO);
		postVO.setPost_id(generatedKey);
		
		return postVO;
	}
	
	public PostVO updatePost(String post_id, String mem_id, 
			Integer ptype_id, Integer p_status, String p_title, 
			String text, byte[] image, Timestamp last_edit, Timestamp post_time) {
		
		PostVO postVO = new PostVO();
		
		postVO.setPost_id(post_id);
		postVO.setMem_id(mem_id);
		postVO.setPtype_id(ptype_id);
		postVO.setP_status(p_status);
		postVO.setP_title(p_title);
		postVO.setText(text);
		postVO.setImage(image);
		postVO.setLast_edit(last_edit);
		postVO.setPost_time(post_time);
		dao.update(postVO);
		
		return postVO;
	}
	
	public void deletePost(String post_id) {
		dao.delete(post_id);
	}
	
	public PostVO getOnePost(String post_id) {
		return dao.findByPrimaryKey(post_id);
	}
	
	public java.util.List<PostVO> getAll() {
		return dao.getAll();
	}
	
}
