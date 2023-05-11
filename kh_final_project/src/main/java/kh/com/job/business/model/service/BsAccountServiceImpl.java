package kh.com.job.business.model.service;

import java.io.IOException;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;

import kh.com.job.business.model.dao.BsAccountDao;
import kh.com.job.business.model.dto.BsUserDto;

@Service
public class BsAccountServiceImpl implements BsAccountService{
	
	@Autowired
	private BsAccountDao dao;
	
	@Value("${gcs.projectId}")
    private String projectId;
	
	@Value("${gcs.bucketName}")
	private String bucketName;



	@Override
	public int updateAccount(BsUserDto dto) {
		return dao.updateAccount(dto);
	}

	@Override
	public int updatePassword(BsUserDto dto) {
		return dao.updatePassword(dto);
	}

	@Override
	public BsUserDto viewAccount(String userId) {
		return dao.viewAccount(userId);
	}

	//구글클라우드	
	@Override
	public String uploadUserPic(MultipartFile uploadReport, String userId) {
		//버켓 폴더 작업 추가해야됨
		try {
			Storage storage = StorageOptions.newBuilder().setProjectId(projectId).build().getService();
			String fileName = UUID.randomUUID().toString();
			String extension = FilenameUtils.getExtension(uploadReport.getOriginalFilename());
			
			//경로에 해당하는 폴더 명이 없을 때 자동으로 구글클라우드 스토리지에서 생성해 줌
			
			String fullName = userId + "/"+ "image" + "/"+ fileName + "." + extension;
			BlobInfo blobInfo = BlobInfo.newBuilder(bucketName, fullName).build();
			storage.create(blobInfo, uploadReport.getBytes());
			return "https://storage.googleapis.com/" + bucketName + "/" + fullName;
				
			} catch (IOException e) {
				 throw new RuntimeException(e);
			}
		
	}

}
