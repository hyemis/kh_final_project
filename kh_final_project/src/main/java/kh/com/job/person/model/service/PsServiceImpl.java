package kh.com.job.person.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kh.com.job.person.model.dao.PsDao;
import kh.com.job.person.model.dto.PsScrapInfoDto;
import kh.com.job.person.model.dto.PsUserDto;

@Service
public class PsServiceImpl implements PsService {
	
	@Autowired
	private PsDao dao;

	@Override
	public PsUserDto selectOne(String userId) throws Exception {
		return dao.selectOne(userId);
	}

	@Override
	public List<PsUserDto> selectList() throws Exception {
		return dao.selectList();
	}

	@Override
	public int insert(PsUserDto dto) throws Exception {
		return dao.insert(dto);
	}
	
	@Override
	public int businessInsert(PsUserDto dto) throws Exception {
		return dao.businessInsert(dto);
	}

	@Override
	public int update(PsUserDto dto) throws Exception {
		return dao.update(dto);
	}

	@Override
	public int delete(String userId) throws Exception {
		return dao.delete(userId);
	}

	@Override
	public int idChk(String userId) throws Exception {
		return dao.idChk(userId);
	}
	
	// 카카오 로그인 
	@Override
	public String getAccessToken(String authorize_code) throws Exception {
			String access_Token = "";
			String refresh_Token = "";
			String reqURL = "https://kauth.kakao.com/oauth/token";

			try {
				URL url = new URL(reqURL);

				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				// POST 요청을 위해 기본값이 false인 setDoOutput을 true로

				conn.setRequestMethod("POST");
				conn.setDoOutput(true);
				// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송

				BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
				StringBuilder sb = new StringBuilder();
				sb.append("grant_type=authorization_code");

				sb.append("&client_id=77dfb2057fb10018f5dbf8b933cc96dd"); // REST_API키 본인이 발급받은 key 넣어주기
				sb.append("&redirect_uri=http://localhost:8090/job/person/login"); // REDIRECT_URI 본인이 설정한 주소 넣어주기

				sb.append("&code=" + authorize_code);
				bw.write(sb.toString());
				bw.flush();

				// 결과 코드가 200이라면 성공
				int responseCode = conn.getResponseCode();
				System.out.println("responseCode : " + responseCode);

				// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String line = "";
				String result = "";

				while ((line = br.readLine()) != null) {
					result += line;
				}
				System.out.println("response body : " + result);

				// jackson objectmapper 객체 생성
				ObjectMapper objectMapper = new ObjectMapper();
				// JSON String -> Map
				Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
				});

				access_Token = jsonMap.get("access_token").toString();
				refresh_Token = jsonMap.get("refresh_token").toString();

				System.out.println("access_token : " + access_Token);
				System.out.println("refresh_token : " + refresh_Token);

				br.close();
				bw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return access_Token;
		}
		
		@SuppressWarnings("unchecked")
		@Override
		public HashMap<String, Object> getUserInfo(String access_Token) throws Throwable {
			HashMap<String, Object> userInfo = new HashMap<String, Object>();
			String reqURL = "https://kapi.kakao.com/v2/user/me";

			try {
				URL url = new URL(reqURL);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("GET");

				// 요청에 필요한 Header에 포함될 내용
				conn.setRequestProperty("Authorization", "Bearer " + access_Token);

				int responseCode = conn.getResponseCode();
				System.out.println("responseCode : " + responseCode);

				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

				String line = "";
				String result = "";

				while ((line = br.readLine()) != null) {
					result += line;
				}
				System.out.println("response body : " + result);
				System.out.println("result type" + result.getClass().getName()); // java.lang.String

				try {
					// jackson objectmapper 객체 생성
					ObjectMapper objectMapper = new ObjectMapper();
					// JSON String -> Map
					Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
					});

					System.out.println(jsonMap.get("properties"));

					Map<String, Object> properties = (Map<String, Object>) jsonMap.get("properties");
					Map<String, Object> kakao_account = (Map<String, Object>) jsonMap.get("kakao_account");

					// System.out.println(properties.get("nickname"));
					// System.out.println(kakao_account.get("email"));

					String nickname = properties.get("nickname").toString();
					String email = kakao_account.get("email").toString();

					userInfo.put("nickname", nickname);
					userInfo.put("email", email);

				} catch (Exception e) {
					e.printStackTrace();
				}

			} catch (IOException e) {
				e.printStackTrace();
			}
			return userInfo;
		}

		// 카카오 로그인 
		@Override
		public PsUserDto selectUserEmail(String userEmail) throws Throwable {
			return dao.selectUserEmail(userEmail);
		}

		// 아이디 찾기 
		@Override
		public PsUserDto findId(Map<String, Object> findId) throws Exception {
			return dao.findId(findId);
		}
		
		// 비밀번호 찾기 
		@Override
		public PsUserDto findPw(Map<String, Object> findPw) throws Exception {
			return dao.findPw(findPw);
				}

		@Override
		public int scrapInfo(PsScrapInfoDto dto) throws Exception {
			return dao.scrapInfo(dto);
		}


	
	
	
	

}
