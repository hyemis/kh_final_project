package kh.com.job.temp.model.dto;

import org.springframework.stereotype.Component;

@Component
public class ApplyProcessDto {
	private int apNum;
	private String step1;
	private String step2;
	private String step3;
	private String step4;
	private String step5;
	public int getApNum() {
		return apNum;
	}
	public void setApNum(int apNum) {
		this.apNum = apNum;
	}
	public String getStep1() {
		return step1;
	}
	public void setStep1(String step1) {
		this.step1 = step1;
	}
	public String getStep2() {
		return step2;
	}
	public void setStep2(String step2) {
		this.step2 = step2;
	}
	public String getStep3() {
		return step3;
	}
	public void setStep3(String step3) {
		this.step3 = step3;
	}
	public String getStep4() {
		return step4;
	}
	public void setStep4(String step4) {
		this.step4 = step4;
	}
	public String getStep5() {
		return step5;
	}
	public void setStep5(String step5) {
		this.step5 = step5;
	}
	@Override
	public String toString() {
		return "ApplyProcessDto [apNum=" + apNum + ", step1=" + step1 + ", step2=" + step2 + ", step3=" + step3
				+ ", step4=" + step4 + ", step5=" + step5 + "]";
	}
	
	
}
