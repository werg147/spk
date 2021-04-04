package com.javaex.vo;

public class NaverVo {

	private String resultcode;
	private String message;
	private response response;

	

	public class response {
		private String id;
		private String nickname;
		private String name;
		private String gender;

		public response() {
		}

		public response(String id, String nickname, String name, String gender) {
			this.id = id;
			this.nickname = nickname;
			this.name = name;
			this.gender = gender;
		}

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getNickname() {
			return nickname;
		}

		public void setNickname(String nickname) {
			this.nickname = nickname;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getGender() {
			return gender;
		}

		public void setGender(String gender) {
			this.gender = gender;
		}

		@Override
		public String toString() {
			return "response [id=" + id + ", nickname=" + nickname + ", name=" + name + ", gender=" + gender + "]";
		}

	}
	public NaverVo() {
	}

	public NaverVo(String resultcode, String message, com.javaex.vo.NaverVo.response response) {
		this.resultcode = resultcode;
		this.message = message;
		this.response = response;
	}

	public String getResultcode() {
		return resultcode;
	}

	public void setResultcode(String resultcode) {
		this.resultcode = resultcode;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public response getResponse() {
		return response;
	}

	public void setResponse(response response) {
		this.response = response;
	}

	@Override
	public String toString() {
		return "NaverVo [resultcode=" + resultcode + ", message=" + message + ", response=" + response + "]";
	}


}
