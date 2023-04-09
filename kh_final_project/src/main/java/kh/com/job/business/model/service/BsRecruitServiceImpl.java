package kh.com.job.business.model.service;

import java.io.IOException;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Bucket;
import com.google.cloud.storage.BucketInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;

import kh.com.job.business.model.dao.BsAccountDao;
import kh.com.job.business.model.dao.BsRecruitDao;
import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.business.model.dto.BsUserDto;

@Service
public class BsRecruitServiceImpl implements BsRecruitService{
	
	@Autowired
	private BsAccountDao account;
	
	@Autowired
	private BsRecruitDao dao;
	
	@Value("${gcs.projectId}")
    private String projectId;
	
	@Value("${gcs.bucketName}")
	private String bucketName;

	@Override
	public Object getCateList(String categoryType) {
		return dao.getCateList(categoryType);
	}
	
	//구글클라우드 -채용공고 이력서 파일 파일 형식 업로드 기능 구분 	
	@Override
	public String uploadDocument(MultipartFile uploadReport, String userId) {
		//버켓 폴더 작업 추가해야됨
		try {
			Storage storage = StorageOptions.newBuilder().setProjectId(projectId).build().getService();
			String fileName = UUID.randomUUID().toString();
			String extension = FilenameUtils.getExtension(uploadReport.getOriginalFilename());
			
			//경로에 해당하는 폴더 명이 없을 때 자동으로 구글클라우드 스토리지에서 생성해 줌
			
			String fullName = userId + "/"+ "document" + "/"+ fileName + "." + extension;
			BlobInfo blobInfo = BlobInfo.newBuilder(bucketName, fullName).build();
			storage.create(blobInfo, uploadReport.getBytes());
			return "https://storage.googleapis.com/" + bucketName + "/" + fullName;
				
			} catch (IOException e) {
				 throw new RuntimeException(e);
			}
		
	}

	@Override
	public int insertRecruit(BsRecruitDto dto) {
		int result = -1;
		result = dao.insertRecruit(dto);
		return result;
	}

}
