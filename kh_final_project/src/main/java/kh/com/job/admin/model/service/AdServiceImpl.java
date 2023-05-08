package kh.com.job.admin.model.service;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;

import kh.com.job.admin.model.dao.AdAccountDao;
import kh.com.job.admin.model.dao.AdDao;
import kh.com.job.admin.model.dto.AdBannerDto;
import kh.com.job.business.model.dto.BsRecruitDetailDto;
import kh.com.job.business.model.dto.BsRecruitDto;

@Service
public class AdServiceImpl implements AdService{
	
	@Value("${gcs.projectId}")
    private String projectId;
	
	@Value("${gcs.bucketName}")
	private String bucketName;
	
	@Autowired
	private AdAccountDao dao;
	
	@Autowired
	private AdDao addao;

	@Override
	public List<AdBannerDto> bannerList() {
		return addao.bannerList();
	}

	@Override
	public AdBannerDto bannerDetail(int id) {
		return addao.bannerDetail(id);
	}

	@Override
	public String uploadThum(MultipartFile uploadReport) {
		//버켓 폴더 작업 추가해야됨
		try {
			Storage storage = StorageOptions.newBuilder().setProjectId(projectId).build().getService();
			String fileName = UUID.randomUUID().toString();
			String extension = FilenameUtils.getExtension(uploadReport.getOriginalFilename());
			
			//경로에 해당하는 폴더 명이 없을 때 자동으로 구글클라우드 스토리지에서 생성해 줌
			
			String fullName = "banner" + "/"+ "image" + "/"+ fileName + "." + extension;
			BlobInfo blobInfo = BlobInfo.newBuilder(bucketName, fullName).build();
			storage.create(blobInfo, uploadReport.getBytes());
			return "https://storage.googleapis.com/" + bucketName + "/" + fullName;
				
			} catch (IOException e) {
				 throw new RuntimeException(e);
			}
	}

	@Override
	public int bannerUpdate(AdBannerDto dto) {
		return addao.bannerUpdate(dto);
	}

	@Override
	public List<BsRecruitDto> recentRecruit() {
		return addao.recentRecruit();
	}


}
