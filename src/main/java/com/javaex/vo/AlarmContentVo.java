package com.javaex.vo;

public class AlarmContentVo {

	public String payment_complete = "<b>[결제완료]</b> 결제가 완료되었습니다.";
	public String delivery_cancle = "<b>[배송불가]</b> 판매자의 요청으로 상품 결제가 취소되었습니다.";
	public String refund = "결제수단에 따라 1~4일정도 소요됩니다. ";
	public String delivery_ready = "<b>[배송준비중]</b> 주문하신 상품의 배송을 준비 중 입니다.";
	public String delivery_ing = "<b>[배송시작]</b> 주문하신 상품의 배송이 시작되었습니다.";
	public String delivery_complete = "<b>[배송완료]</b> 주문하신 상품의 배송이 완료되었습니다.";

	public String gym_reservation = "<b>[대관상품 예약중]</b> 대관등록하신 상품이 예약되었습니다.";
	public String booking_payment_complete01 = "<b>[대관상품 결제완료]</b> 대관등록하신 상품의 결제가 완료되었습니다.";
	public String booking_payment_complete02 = "<b>[대관상품 결제완료]</b> 예약된 대관상품의 결제가 완료되었습니다.";
	public String payment_complete_toSeller = "<b>[결제완료]</b> 대관상품예약이 결제완료되었습니다.";

	public String matching_successful = "<b>[매치진행중]</b> 매치가 성사되었습니다.";
	public String matching_competition = "<b>[수락대기중]</b> 매치신청을 받았습니다.";

	public String matching_accept = "<b>[매치진행중]</b> 매치신청이 수락되었습니다. 잔액을 결제해주세요.";
	public String matching_refused = "<b>[매칭종료]</b> 매치신청이 거절되었습니다.";

	public String matching_complete = "<b>[매칭종료]</b> 매치가 종료되었습니다.";

	public AlarmContentVo() {
		super();
	}

	public AlarmContentVo(String payment_complete, String delivery_cancle, String refund, String delivery_ready,
			String delivery_ing, String delivery_complete, String gym_reservation, String booking_payment_complete01,
			String booking_payment_complete02, String matching_successful, String matching_competition,
			String matching_accept, String matching_refused, String matching_complete) {
		super();
		this.payment_complete = payment_complete;
		this.delivery_cancle = delivery_cancle;
		this.refund = refund;
		this.delivery_ready = delivery_ready;
		this.delivery_ing = delivery_ing;
		this.delivery_complete = delivery_complete;
		this.gym_reservation = gym_reservation;
		this.booking_payment_complete01 = booking_payment_complete01;
		this.booking_payment_complete02 = booking_payment_complete02;
		this.matching_successful = matching_successful;
		this.matching_competition = matching_competition;
		this.matching_accept = matching_accept;
		this.matching_refused = matching_refused;
		this.matching_complete = matching_complete;
	}

	public String getPayment_complete() {
		return payment_complete;
	}

	public void setPayment_complete(String payment_complete) {
		this.payment_complete = payment_complete;
	}

	public String getDelivery_cancle() {
		return delivery_cancle;
	}

	public void setDelivery_cancle(String delivery_cancle) {
		this.delivery_cancle = delivery_cancle;
	}

	public String getRefund() {
		return refund;
	}

	public void setRefund(String refund) {
		this.refund = refund;
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

	public String getGym_reservation() {
		return gym_reservation;
	}

	public void setGym_reservation(String gym_reservation) {
		this.gym_reservation = gym_reservation;
	}

	public String getBooking_payment_complete01() {
		return booking_payment_complete01;
	}

	public void setBooking_payment_complete01(String booking_payment_complete01) {
		this.booking_payment_complete01 = booking_payment_complete01;
	}

	public String getBooking_payment_complete02() {
		return booking_payment_complete02;
	}

	public void setBooking_payment_complete02(String booking_payment_complete02) {
		this.booking_payment_complete02 = booking_payment_complete02;
	}

	public String getMatching_successful() {
		return matching_successful;
	}

	public void setMatching_successful(String matching_successful) {
		this.matching_successful = matching_successful;
	}

	public String getMatching_competition() {
		return matching_competition;
	}

	public void setMatching_competition(String matching_competition) {
		this.matching_competition = matching_competition;
	}

	public String getMatching_accept() {
		return matching_accept;
	}

	public void setMatching_accept(String matching_accept) {
		this.matching_accept = matching_accept;
	}

	public String getMatching_refused() {
		return matching_refused;
	}

	public void setMatching_refused(String matching_refused) {
		this.matching_refused = matching_refused;
	}

	public String getMatching_complete() {
		return matching_complete;
	}

	public void setMatching_complete(String matching_complete) {
		this.matching_complete = matching_complete;
	}

	@Override
	public String toString() {
		return "AlarmContentVo [payment_complete=" + payment_complete + ", delivery_cancle=" + delivery_cancle
				+ ", refund=" + refund + ", delivery_ready=" + delivery_ready + ", delivery_ing=" + delivery_ing
				+ ", delivery_complete=" + delivery_complete + ", gym_reservation=" + gym_reservation
				+ ", booking_payment_complete01=" + booking_payment_complete01 + ", booking_payment_complete02="
				+ booking_payment_complete02 + ", matching_successful=" + matching_successful
				+ ", matching_competition=" + matching_competition + ", matching_accept=" + matching_accept
				+ ", matching_refused=" + matching_refused + ", matching_complete=" + matching_complete + "]";
	}

}
