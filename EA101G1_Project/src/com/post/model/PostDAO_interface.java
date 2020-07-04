package com.post.model;

import java.util.*;

public interface PostDAO_interface {

	public String insert(PostVO postVO);
	public void update(PostVO postVO);
	public void delete(String post_id);
	public PostVO findByPrimaryKey(String post_id);
	public java.util.List<PostVO> getAll();
//	public java.util.List<PostVO> getAll(Map<String, String[]> map);
}
