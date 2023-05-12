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
import kh.com.job.common.page.Paging;

@Service
public class BsAboutUsServiceImpl implements BsAboutUsService{
	
	@Autowired
	private BsAboutUsDao dao;
	
	@Value("${gcs.projectId}")
    private String projectId;
	
	@Value("${gcs.bucketName}")
	private String bucketName;
	
	
	@Override
	public BsUserDto viewAccount(String userId) {
		return dao.viewAccount(userId);
	}

	@Override
	@Transactional
	public int insertNewsletter(BoardDto dto) {
		return dao.insertNewsletter(dto);
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

	//회사소개 
	@Override
	public int insertCompanyInfo(BoardDto dto) {
		return dao.insertCompanyInfo(dto);
	}

	@Override
	public Paging newsLetterList(BoardDto dto) {
		//게시글이 표시될 개 수
				int pageLimit = 10;
				//페이지가 표시될 개 수
				int listLimit = 5;
				
				//총 게시글 개수
				int count = dao.countNewsletter(dto);

				//나타날 페이지의 첫번 째 글의 ra_num
				dto.setStartNum((dto.getPnum() -1)*pageLimit +1);
				//나타날 페이지의 마지막 글의 ra_num
				dto.setEndNum(dto.getPnum() * pageLimit);
				
				int mod = count % pageLimit ==0? 0 : 1;
				int pageCount = count/pageLimit + mod;
				
				//new Paging(게시글정보, 현재페이지, 페이지네이션 된 마지막 숫자 (<,1,2,3,4,5,> 여기서는 5))
				Paging list = new Paging(dao.newsLetterList(dto), dto.getPnum(), pageCount);
				//만약 게시글이 표시될 개수와 페이지를 표시할 개수를 바꾸고 싶으면  new Paging
				//(게시글정보, 현재페이지, 페이지네이션 된 마지막 숫자, int 게시글이 표시될 개 수, listLimit)
				//로 생성한다.
				
				return list;
	}

	@Override
	public BoardDto checkInfo(String userId) {
		return dao.checkInfo(userId);
	}

}
