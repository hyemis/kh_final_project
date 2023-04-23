package kh.com.job.business.model.service;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Bucket;
import com.google.cloud.storage.BucketInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;

import kh.com.job.board.model.dto.BoardDto;
import kh.com.job.business.model.dao.BsAboutUsDao;
import kh.com.job.business.model.dto.BsUserDto;



@Service
public class BsAboutUsServiceImpl implements BsAboutUsService{
	
	@Autowired
	private BsAboutUsDao dao;
	
	@Value("${gcs.projectId}")
    private String projectId;
	
	@Value("${gcs.bucketName}")
	private String bucketName;
	
	//USER
	@Override
	public BsUserDto viewAccount(String userId) {
		return dao.viewAccount(userId);
	}
	


	//BOARD
	@Override
	@Transactional
	public int insertNewsletter(BoardDto dto) {
		return dao.insertNewsletter(dto);
	}

	
	
	@Override
	public int updateNewsLetter(BoardDto dto) {
		return dao.updateNewsLetter(dto);
	}

	@Override
	public int deleteNewsLetter(BoardDto dto) {
		return dao.deleteNewsLetter(dto);
	}

	@Override
	public BoardDto newsLetterOne(int boardNum, String userId) {
		BoardDto result = dao.newsLetterOne(boardNum);
		if(result!=null && !result.getUserId().equals(userId)) {
			dao.updateReadCount(boardNum);	
		}
		return result;
	}

	@Override
	public List<BoardDto> newsLetterList(String userId) {
		return dao.newsLetterList(userId);
	}

	@Override
	public String uploadDocument(MultipartFile uploadReport, String userId) {
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
	public List<BoardDto> listAll(String userId) {
		return dao.listAll(userId);
	}


	//회사소개 
	@Override
	public int insertCompanyInfo(BoardDto dto) {
		return dao.insertCompanyInfo(dto);
	}

	@Override
	public int updateCompanyInfo(BoardDto dto) {
		return dao.updateCompanyInfo(dto);
	}



	@Override
	public BoardDto viewCompanyInfo(String userId) {
		return dao.viewCompanyInfo(userId);
	}

	

	







	

	
	
	
	
}
