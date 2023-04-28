package kh.com.job.admin.model.dto;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class AdBannerDto {
	
	private int bannerId;
	private String bannerSub;
	private String bannerLink;
	private String bannerThum;
	private int bannerSeq;
	private String registDate;
	private String userId;
	
}
