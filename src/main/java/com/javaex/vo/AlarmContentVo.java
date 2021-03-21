package com.javaex.vo;

public class AlarmContentVo {

	public String payment_complete = "[결제완료] 결제가 완료되었습니다";
	public String delivery_ready = "[배송준비 중] 주문하신 상품의 배송울 준비 중 입니다.";
	public String delivery_ing = "[배송 중] 주문하신 상품을 고객님께 배송 중 입니다.";
	public String delivery_complete = "[배송완료] 주문하신 상품의 배송이 완료되었습니다.";
	public String match_registration = "[매칭대기 중] 매칭이 등록되었습니다.";
	public String match_application = "[수락대기 중] 매치를 신청하였습니다.";
	public String matching_refused = "[매칭종료] 매치신청이 거절되었습니다.";
	public String matching_accept = "[매치진행 중] 매치신청이 수락되었습니다.";
	public String matching_complete = "[매칭종료] 매치가 종료되었습니다.";

	public AlarmContentVo() {
		super();
	}

	public AlarmContentVo(String payment_complete, String delivery_ready, String delivery_ing, String delivery_complete,
			String match_registration, String match_application, String matching_refused, String matching_accept,
			String matching_complete) {
		super();
		this.payment_complete = payment_complete;
		this.delivery_ready = delivery_ready;
		this.delivery_ing = delivery_ing;
		this.delivery_complete = delivery_complete;
		this.match_registration = match_registration;
		this.match_application = match_application;
		this.matching_refused = matching_refused;
		this.matching_accept = matching_accept;
		this.matching_complete = matching_complete;
	}

	public String getPayment_complete() {
		return payment_complete;
	}

	public void setPayment_complete(String payment_complete) {
		this.payment_complete = payment_complete;
	}

	public String getDelivery_ready() {
		return delivery_ready;
	}

	public void setDelivery_ready(String delivery_ready) {
		this.delivery_ready = delivery_ready;
	}

	public String getDelivery_ing() {
		return delivery_ing;
	}

	public void setDelivery_ing(String delivery_ing) {
		this.delivery_ing = delivery_ing;
	}

	public String getDelivery_complete() {
		return delivery_complete;
	}

	public void setDelivery_complete(String delivery_complete) {
		this.delivery_complete = delivery_complete;
	}

	public String getMatch_registration() {
		return match_registration;
	}

	public void setMatch_registration(String match_registration) {
		this.match_registration = match_registration;
	}

	public String getMatch_application() {
		return match_application;
	}

	public void setMatch_application(String match_application) {
		this.match_application = match_application;
	}

	public String getMatching_refused() {
		return matching_refused;
	}

	public void setMatching_refused(String matching_refused) {
		this.matching_refused = matching_refused;
	}

	public String getMatching_accept() {
		return matching_accept;
	}

	public void setMatching_accept(String matching_accept) {
		this.matching_accept = matching_accept;
	}

	public String getMatching_complete() {
		return matching_complete;
	}

	public void setMatching_complete(String matching_complete) {
		this.matching_complete = matching_complete;
	}

	@Override
	public String toString() {
		return "AlarmContentVo [payment_complete=" + payment_complete + ", delivery_ready=" + delivery_ready
				+ ", delivery_ing=" + delivery_ing + ", delivery_complete=" + delivery_complete
				+ ", match_registration=" + match_registration + ", match_application=" + match_application
				+ ", matching_refused=" + matching_refused + ", matching_accept=" + matching_accept
				+ ", matching_complete=" + matching_complete + "]";
	}

}
