package com.javaex.vo;

public class MatchScoreVo {
	private int matchScore;
	private int user_no;
	private int score;
	private int win;
	private int lose;
	private int b_buy_no;
	private String matchAttri;
	
	
	public MatchScoreVo() {
		
	}


	public MatchScoreVo(int matchScore, int user_no, int score, int win, int lose, int b_buy_no, String matchAttri) {
		
		this.matchScore = matchScore;
		this.user_no = user_no;
		this.score = score;
		this.win = win;
		this.lose = lose;
		this.b_buy_no = b_buy_no;
		this.matchAttri = matchAttri;
	}


	public int getMatchScore() {
		return matchScore;
	}


	public void setMatchScore(int matchScore) {
		this.matchScore = matchScore;
	}


	public int getUser_no() {
		return user_no;
	}


	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}


	public int getScore() {
		return score;
	}


	public void setScore(int score) {
		this.score = score;
	}


	public int getWin() {
		return win;
	}


	public void setWin(int win) {
		this.win = win;
	}


	public int getLose() {
		return lose;
	}


	public void setLose(int lose) {
		this.lose = lose;
	}


	public int getB_buy_no() {
		return b_buy_no;
	}


	public void setB_buy_no(int b_buy_no) {
		this.b_buy_no = b_buy_no;
	}


	public String getMatchAttri() {
		return matchAttri;
	}


	public void setMatchAttri(String matchAttri) {
		this.matchAttri = matchAttri;
	}


	@Override
	public String toString() {
		return "MatchScore [matchScore=" + matchScore + ", user_no=" + user_no + ", score=" + score + ", win=" + win + ", lose=" + lose + ", b_buy_no="
				+ b_buy_no + ", matchAttri=" + matchAttri + "]";
	}
	
	
	
	
}
