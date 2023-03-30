package kh.com.job.person.model.service;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;

import kh.com.job.person.model.dao.PsResumeDao;
import kh.com.job.person.model.dto.PsResumeDto;

@Service
public class PsResumeServieImpl implements PsResumeService {
	
	@Autowired
	private PsResumeDao dao;
	
	@Value("${gcs.projectId}")
    private String projectId;
	
	@Value("${gcs.bucketName}")
	private String bucketName;

	@Override
	public PsResumeDto selectOne(String userId) throws Exception {
		return dao.selectOne(userId);
	}

	@Override
	public List<PsResumeDto> selectList(String userId) throws Exception {
		return dao.selectList(userId);
	}

	@Override
	public int insert(PsResumeDto dto) throws Exception {
		return dao.insert(dto);
	}

	@Override
	public int update(PsResumeDto dto) throws Exception {
		return dao.update(dto);
	}

	@Override
	public int delete(int resumeNo) throws Exception {
		return dao.delete(resumeNo);
	}

	// google cloud
	@Override
	public String upload(MultipartFile file) {
		try {
			Storage storage = StorageOptions.newBuilder().setProjectId(projectId).build().getService();
			String fileName = UUID.randomUUID().toString();
			BlobInfo blobInfo = BlobInfo.newBuilder(bucketName, fileName).build();
			storage.create(blobInfo, file.getBytes());
			return "https://storage.googleapis.com/" + bucketName + "/" + fileName;
				
			} catch (IOException e) {
				 throw new RuntimeException(e);
			}
		}

	@Override
	public PsResumeDto rselectOne(Object[] params) throws Exception {
		return dao.rselectOne(params);
	}


	
	
	
	
	

}
