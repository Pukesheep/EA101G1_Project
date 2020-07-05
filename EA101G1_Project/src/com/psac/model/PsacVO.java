package com.psac.model;

public class PsacVO implements java.io.Serializable{
		private String psac_no;
		private String mem_id;
		private String post_id;
		private String adm_no;
		private String psac_content;
		private Integer psac_state;
		
		public PsacVO() {
			super();
		}

		public String getPsac_no() {
			return psac_no;
		}

		public void setPsac_no(String psac_no) {
			this.psac_no = psac_no;
		}

		public String getMem_id() {
			return mem_id;
		}

		public void setMem_id(String mem_id) {
			this.mem_id = mem_id;
		}

		public String getPost_id() {
			return post_id;
		}

		public void setPost_id(String post_id) {
			this.post_id = post_id;
		}

		public String getAdm_no() {
			return adm_no;
		}

		public void setAdm_no(String adm_no) {
			this.adm_no = adm_no;
		}

		public String getPsac_content() {
			return psac_content;
		}

		public void setPsac_content(String psac_content) {
			this.psac_content = psac_content;
		}

		public Integer getPsac_state() {
			return psac_state;
		}

		public void setPsac_state(Integer psac_state) {
			this.psac_state = psac_state;
		}
		
		
		

}
