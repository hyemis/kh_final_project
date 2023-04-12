package kh.com.job.person.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.com.job.person.model.dto.PsCareerDto;
import kh.com.job.person.model.dto.PsCertiDto;
import kh.com.job.person.model.dto.PsClDto;
import kh.com.job.person.model.dto.PsGschoolDto;
import kh.com.job.person.model.dto.PsHschoolDto;
import kh.com.job.person.model.dto.PsResumeDto;
import kh.com.job.person.model.dto.PsUnivDto;
import kh.com.job.person.model.dto.PsUserDto;
import kh.com.job.person.model.service.PsResumeService;
import kh.com.job.person.model.service.PsService;

@Controller
@RequestMapping("person/resume")
public class PsResumeController {

	@Autowired
	private PsResumeService rservice;
	@Autowired
	private PsService pservice;

	// 이력서관리 페이지 열기
	@GetMapping("/list")
	public ModelAndView doList(ModelAndView mv, Principal principal) {
		try {

			PsUserDto result = pservice.selectOne(principal.getName());
			List<PsResumeDto> resume = rservice.selectList(principal.getName());

			if (result != null) {
				mv.addObject("userinfo", result);
				mv.addObject("resumelist", resume);
				mv.setViewName("person/resume/list");
			} else {
				mv.setViewName("redirect:/");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 이력서 작성 페이지 열기
	@GetMapping("/write")
	public ModelAndView doResume(ModelAndView mv, Principal principal) {
		try {

			PsUserDto result = pservice.selectOne(principal.getName());
			if (result != null) {
				mv.addObject("userinfo", result);
				mv.setViewName("person/resume/write");
			} else {
				mv.setViewName("redirect:/");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 이력서 파일 업로드
	@PostMapping("/fileupload")
	@ResponseBody
	public ModelAndView fileupload(ModelAndView mv, @RequestParam(name = "report", required = false) MultipartFile file,
			Principal principal) throws Exception {

		if (!file.isEmpty()) {
			PsUserDto result = pservice.selectOne(principal.getName());
			if (result != null) {
				String url = rservice.upload(file, principal.getName());
				mv.addObject("url", url);
				mv.addObject("userinfo", result);
			}
		}
		mv.setViewName("person/resume/write");
		return mv;
	}

	// 이력서 작성
	@PostMapping("/write")
	@ResponseBody
	public int writeResume(Principal principal, PsResumeDto dto,
			@RequestParam(name = "uploadPortf", required = false) MultipartFile uploadPortf) {

		dto.setUserId(principal.getName());

		if (uploadPortf != null && !uploadPortf.isEmpty()) {
			String portfUrl = rservice.upload(uploadPortf, principal.getName());
			dto.setPortfFile(portfUrl);
		}

		int result = -1;
		try {
			result = rservice.insert(dto);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// 이력서 삭제
	@PostMapping("/delete")
	public ModelAndView deleteResume(ModelAndView mv, int resumeNo, Principal principal, RedirectAttributes rttr)
			throws Exception {

		int result = rservice.delete(resumeNo);

		if (result > 0) {
			rttr.addFlashAttribute("msg", "이력서가 삭제되었습니다.");

		} else {
			rttr.addFlashAttribute("msg", "이력서 삭제에 실패했습니다.");
		}

		mv.setViewName("redirect:/person/resume/list");
		return mv;
	}

	// 이력서 상세보기 화면
	@GetMapping("/read/{resumeNo}")
	public ModelAndView viewReadResume(ModelAndView mv, Principal principal, @PathVariable int resumeNo)
			throws Exception {
		String userId = principal.getName();

		Map<String, Object> infoMap = new HashMap<>();
		infoMap.put("userId", userId);
		infoMap.put("resumeNo", resumeNo);

		PsUserDto result = pservice.selectOne(userId);
		mv.addObject("userinfo", result);

		PsResumeDto dto = rservice.rselectOne(infoMap);
		mv.addObject("resume", dto);
		mv.setViewName("person/resume/read");
		return mv;
	}

	// 학력사항 페이지
	@GetMapping("school")
	public ModelAndView viewSchool(ModelAndView mv, Principal principal) throws Exception {

		// 고등학교 학력정보 불러오기
		List<PsHschoolDto> high = rservice.selectListHigh(principal.getName());
		mv.addObject("high", high);

		// 대학교 학력정보 불러오기
		List<PsUnivDto> uni = rservice.selectListUni(principal.getName());
		mv.addObject("uni", uni);

		// 대학원 학력정보 불러오기
		List<PsGschoolDto> grad = rservice.selectListGrad(principal.getName());
		mv.addObject("grad", grad);

		return mv;
	}

	// 고등학교입력
	@PostMapping("rHSchool")
	public ModelAndView rHschool(Principal principal, ModelAndView mv, PsHschoolDto dto, RedirectAttributes rttr) {
		int result = -1;
		try {
			result = rservice.insertHschool(dto);

			if (result > 0) {
				PsResumeDto resume = rservice.selectOne(principal.getName());
				int resumeNo = resume.getResumeNo();
				int highEduNo = rservice.getMaxHighNo();

				Map<String, Object> InfoNo = new HashMap<>();
				InfoNo.put("resumeNo", resumeNo);
				InfoNo.put("highEduNo", highEduNo);

				// 낀테이블 insert
				rservice.insertHighInfo(InfoNo);

				rttr.addFlashAttribute("msg", "성공");

			} else {
				rttr.addFlashAttribute("msg", "실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("redirect:/person/resume/school");
		return mv;
	}

	// 대학교 입력
	@PostMapping("rUniversity")
	public ModelAndView rUniversity(Principal principal, ModelAndView mv, PsUnivDto dto, RedirectAttributes rttr) {
		int result = -1;
		try {
			result = rservice.insertUniv(dto);

			if (result > 0) {
				PsResumeDto resume = rservice.selectOne(principal.getName());
				int resumeNo = resume.getResumeNo();
				int uniEduNo = rservice.getMaxUniNo();

				Map<String, Object> InfoNo = new HashMap<>();
				InfoNo.put("resumeNo", resumeNo);
				InfoNo.put("uniEduNo", uniEduNo);

				// 낀테이블 insert
				rservice.insertUniInfo(InfoNo);

				rttr.addFlashAttribute("msg", "성공");
			} else {
				rttr.addFlashAttribute("msg", "실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("redirect:/person/resume/school");
		return mv;
	}

	// 대학원 입력
	@PostMapping("rGSchool")
	public ModelAndView rGSchool(Principal principal, ModelAndView mv, PsGschoolDto dto, RedirectAttributes rttr) {
		int result = -1;
		try {
			result = rservice.insertGschool(dto);

			if (result > 0) {
				PsResumeDto resume = rservice.selectOne(principal.getName());
				int resumeNo = resume.getResumeNo();
				int gradEduNo = rservice.getMaxGradNo();

				Map<String, Object> InfoNo = new HashMap<>();
				InfoNo.put("resumeNo", resumeNo);
				InfoNo.put("gradEduNo", gradEduNo);

				// 낀테이블 insert
				rservice.insertUniInfo(InfoNo);
				rttr.addFlashAttribute("msg", "성공");
			} else {
				rttr.addFlashAttribute("msg", "실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("redirect:/person/resume/school");
		return mv;
	}

	// 경력사항 페이지
	@GetMapping("career")
	public ModelAndView viewCareer(Principal principal, ModelAndView mv) throws Exception {

		// 경력사항 불러오기
		List<PsCareerDto> career = rservice.selectListCareer(principal.getName());
		mv.addObject("career", career);

		return mv;
	}

	// 경력사항 입력
	@PostMapping("career")
	public ModelAndView doCareer(Principal principal, ModelAndView mv, PsCareerDto dto, RedirectAttributes rttr) {
		int result = -1;
		try {
			result = rservice.insertCareer(dto);

			if (result > 0) {
				PsResumeDto resume = rservice.selectOne(principal.getName());
				int resumeNo = resume.getResumeNo();
				int carNo = rservice.getMaxCareerNo();

				Map<String, Object> InfoNo = new HashMap<>();
				InfoNo.put("resumeNo", resumeNo);
				InfoNo.put("carNo", carNo);

				// 낀테이블 insert
				rservice.insertCareerInfo(InfoNo);
				rttr.addFlashAttribute("msg", "성공");
			} else {
				rttr.addFlashAttribute("msg", "실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("redirect:/person/resume/career");
		return mv;
	}

	// 자격증 페이지
	@GetMapping("certi")
	public ModelAndView viewCerti(Principal principal, ModelAndView mv) throws Exception {

		// 자격증 불러오기
		List<PsCertiDto> certi = rservice.selectListCerti(principal.getName());
		mv.addObject("certi", certi);

		return mv;
	}

	// 자격증 입력
	@PostMapping("certi")
	public ModelAndView doCerti(Principal principal, ModelAndView mv, PsCertiDto dto, RedirectAttributes rttr) {

		int result = -1;
		try {
			result = rservice.insertCerti(dto);

			if (result > 0) {
				PsResumeDto resume = rservice.selectOne(principal.getName());
				int resumeNo = resume.getResumeNo();
				int certiNo = rservice.getMaxCertiNo();

				Map<String, Object> InfoNo = new HashMap<>();
				InfoNo.put("resumeNo", resumeNo);
				InfoNo.put("certiNo", certiNo);

				// 낀테이블 insert
				rservice.insertCertiInfo(InfoNo);
				rttr.addFlashAttribute("msg", "성공");
			} else {
				rttr.addFlashAttribute("msg", "실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("redirect:/person/resume/certi");
		return mv;
	}

	// 자소서 페이지
	@GetMapping("cl")
	public ModelAndView viewCl(ModelAndView mv) {
		
		//TODO: 정보불러오기
		return mv;
	}

	// 자소서 페이지
	@PostMapping("cl")
	@ResponseBody
	public int doCl(ModelAndView mv, 
			@RequestParam("growth") String growth,
			@RequestParam("motive") String motive,
            @RequestParam("adv") String adv,
            @RequestParam("asp") String asp,
            @RequestParam(name = "uploadCl", required = false) MultipartFile clFile,
            PsClDto dto,
            Principal principal) {
		
		dto.setClGrowth(growth);
		dto.setClMotive(motive);
		dto.setClAdv(adv);
		dto.setClAsp(asp);
		

		if (clFile != null && !clFile.isEmpty()) {
			String portfUrl = rservice.upload(clFile, principal.getName());
			dto.setClFile(portfUrl);
		}
		
		int result = -1;
		
		try {
			result = rservice.insertCl(dto);
			if(result > 0) {
				PsResumeDto resume = rservice.selectOne(principal.getName());
				int resumeNo = resume.getResumeNo();
				int clNo = rservice.getMaxClNo();
				
				Map<String, Object> InfoNo = new HashMap<>();
				InfoNo.put("resumeNo", resumeNo);
				InfoNo.put("clNo", clNo);
				
				rservice.insertClInfo(InfoNo);
				return result;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// 예외처리는 프로젝트 후반에 작성

}
