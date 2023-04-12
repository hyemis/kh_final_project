package kh.com.job.person.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;

import kh.com.job.person.model.dao.PsResumeDao;
import kh.com.job.person.model.dto.PsCareerDto;
import kh.com.job.person.model.dto.PsCertiDto;
import kh.com.job.person.model.dto.PsClDto;
import kh.com.job.person.model.dto.PsGschoolDto;
import kh.com.job.person.model.dto.PsHschoolDto;
import kh.com.job.person.model.dto.PsResumeDto;
import kh.com.job.person.model.dto.PsUnivDto;

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
	public String upload(MultipartFile file,  String userId) {
		try {
			Storage storage = StorageOptions.newBuilder().setProjectId(projectId).build().getService();
			String fileName = UUID.randomUUID().toString();
			String extension = FilenameUtils.getExtension(file.getOriginalFilename());
			String fullName = userId + "/"+ "document" + "/"+ fileName + "." + extension;
			
			BlobInfo blobInfo = BlobInfo.newBuilder(bucketName, fullName).build();
			storage.create(blobInfo, file.getBytes());
			return "https://storage.googleapis.com/" + bucketName + "/" + fullName;
				
			} catch (IOException e) {
				 throw new RuntimeException(e);
			}
		}

	@Override
	public PsResumeDto rselectOne(Map<String, Object> infoMap) throws Exception {
		return dao.rselectOne(infoMap);
	}
	
	@Override
	public int insertHschool(PsHschoolDto dto) throws Exception {
		return dao.insertHschool(dto);
	}
	
	@Override
	public int insertUniv(PsUnivDto dto) throws Exception {
		return dao.insertUniv(dto);
	}

	@Override
	public int insertGschool(PsGschoolDto dto) throws Exception {
		return dao.insertGschool(dto);
	}

	@Override
	public int insertCareer(PsCareerDto dto) throws Exception {
		return dao.insertCareer(dto);
	}

	@Override
	public int insertCerti(PsCertiDto dto) throws Exception {
		return dao.insertCerti(dto);
	}
	
	@Override
	public int insertCl(PsClDto dto) throws Exception {
		return dao.insertCl(dto);
	}

	@Override
	public int getMaxHighNo() throws Exception {
		return dao.getMaxHighNo();
	}

	@Override
	public int insertHighInfo(Map<String, Object> InfoNo) throws Exception {
		return dao.insertHighInfo(InfoNo);
	}
	
	@Override
	public int getMaxUniNo() throws Exception {
		return dao.getMaxUniNo();
	}

	@Override
	public int insertUniInfo(Map<String, Object> InfoNo) throws Exception {
		return dao.insertUniInfo(InfoNo);
	}

	@Override
	public int getMaxGradNo() throws Exception {
		return dao.getMaxGradNo();
	}

	@Override
	public int insertGradInfo(Map<String, Object> InfoNo) throws Exception {
		return dao.insertGradInfo(InfoNo);
	}

	@Override
	public int getMaxCareerNo() throws Exception {
		return dao.getMaxCareerNo();
	}

	@Override
	public int insertCareerInfo(Map<String, Object> InfoNo) throws Exception {
		return dao.insertCareerInfo(InfoNo);
	}

	@Override
	public int getMaxCertiNo() throws Exception {
		return dao.getMaxCertiNo();
	}

	@Override
	public int insertCertiInfo(Map<String, Object> InfoNo) throws Exception {
		return dao.insertCertiInfo(InfoNo);
	}

	@Override
	public int getMaxClNo() throws Exception {
		return dao.getMaxClNo();
	}

	@Override
	public int insertClInfo(Map<String, Object> InfoNo) throws Exception {
		return dao.insertClInfo(InfoNo);
	}

	@Override
	public List<PsHschoolDto> selectListHigh(String userId) throws Exception {
		return dao.selectListHigh(userId);
	}

	@Override
	public List<PsUnivDto> selectListUni(String userId) throws Exception {
		return dao.selectListUni(userId);
	}

	@Override
	public List<PsGschoolDto> selectListGrad(String userId) throws Exception {
		return  dao.selectListGrad(userId);
	}

	@Override
	public List<PsCareerDto> selectListCareer(String userId) throws Exception {
		return dao.selectListCareer(userId);
	}

	@Override
	public List<PsCertiDto> selectListCerti(String userId) throws Exception {
		return dao.selectListCerti(userId);
	}

	



}




