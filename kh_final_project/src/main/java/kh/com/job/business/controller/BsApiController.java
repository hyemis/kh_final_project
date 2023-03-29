package kh.com.job.business.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import kh.com.job.business.model.dto.BsRecruitDto;
import kh.com.job.common.OpenApiUtils;

@Controller
public class BsApiController {
	
	@Autowired
	private OpenApiUtils util;
	
	@GetMapping("/workApi")
	public ModelAndView workapi(ModelAndView mv) throws Exception{
		List<BsRecruitDto> bsList = util.worknetApi();
		System.out.println(bsList);
		return mv;
    }
	
	
	
	
}