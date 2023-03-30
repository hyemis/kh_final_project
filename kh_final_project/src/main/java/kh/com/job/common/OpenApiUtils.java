package kh.com.job.common;

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

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import kh.com.job.business.model.dto.BsRecruitDto;

@Component
public class OpenApiUtils {
	
	
	public <T> List<T> worknetApi() throws Exception{
		StringBuilder urlBuilder = new StringBuilder("http://openapi.work.go.kr/opi/opi/opia/wantedApi.do"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("authKey","UTF-8") + "=WNLBET6R0WPQK95R8VLU02VR1HJ"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("returnType","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*결과형식(xml)*/
        urlBuilder.append("&" + URLEncoder.encode("callTp","UTF-8") + "=" + URLEncoder.encode("L", "UTF-8")); /*L(목록), D(상세)*/
        urlBuilder.append("&" + URLEncoder.encode("startPage","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("display","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("region","UTF-8") + "=" + URLEncoder.encode("11000", "UTF-8")); /*지역-서울*/
//        urlBuilder.append("&" + URLEncoder.encode("region","UTF-8") + "=" + URLEncoder.encode("41000", "UTF-8")); /*지역-경기*/
        urlBuilder.append("&" + URLEncoder.encode("occupation","UTF-8") + "=" + URLEncoder.encode("024", "UTF-8")); /*직종-소프트웨어*/
//        urlBuilder.append("&" + URLEncoder.encode("occupation","UTF-8") + "=" + URLEncoder.encode("025", "UTF-8")); /*직종-데이터&네트워크*/
//        urlBuilder.append("&" + URLEncoder.encode("occupation","UTF-8") + "=" + URLEncoder.encode("017", "UTF-8")); /*직종-경영지원*/
//        urlBuilder.append("&" + URLEncoder.encode("occupation","UTF-8") + "=" + URLEncoder.encode("018", "UTF-8")); /*직종-회계,경리*/
//        urlBuilder.append("&" + URLEncoder.encode("occupation","UTF-8") + "=" + URLEncoder.encode("026201", "UTF-8")); /*직종-인사*/
//        urlBuilder.append("&" + URLEncoder.encode("occupation","UTF-8") + "=" + URLEncoder.encode("026301", "UTF-8")); /*직종-총무*/
 
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
//        StringBuilder sb = new StringBuilder();
//        String line;
//        while ((line = rd.readLine()) != null) {
//            sb.append(line+"\n");
//            System.out.println(line);
//        }
        
        Document doc = parseXML(conn.getInputStream());
        doc.getDocumentElement().normalize();
        
        NodeList wantedList = doc.getElementsByTagName("wanted"); 
        System.out.println(wantedList.getLength());
        
        List<T> list = new ArrayList<>();
        for(int i=0; i<wantedList.getLength(); i++) {
        	BsRecruitDto dto = new BsRecruitDto();
        	Node wanted = wantedList.item(i); 
        	Element ele = (Element) wanted;
        	//모집분야
        	dto.setRecruitType(getTextContentByTagName(ele,"jobsCd"));
        	// 회사명
        	dto.setCompanyName(getTextContentByTagName(ele,"company"));
        	// 사업자번호
        	dto.setBusino(getTextContentByTagName(ele,"busino"));
        	//지원자학력
        	dto.setUserEducation(getTextContentByTagName(ele,"maxEdubg"));
        	//연봉
        	dto.setSalary(getTextContentByTagName(ele,"sal"));
        	//연봉 최저치
        	dto.setMinSalary(getTextContentByTagName(ele,"minSal"));
        	//연봉 최대치
        	dto.setMaxSalary(getTextContentByTagName(ele,"maxSal"));
        	//지원등록기간
        	dto.setRegistDate(getTextContentByTagName(ele,"regDt"));
        	//지원마감일
        	dto.setCloseDate(getTextContentByTagName(ele,"closeDt"));
        	//채용제목
        	dto.setRaTitle(getTextContentByTagName(ele,"title"));
        	//경력
        	dto.setCareer(getTextContentByTagName(ele,"career"));
        	//근무형태
        	dto.setHolidayType(getTextContentByTagName(ele,"holidayTpNm"));
        	// 고용형태
        	dto.setEmpTypeCode(getTextContentByTagName(ele,"empTp"));

        	System.out.println(dto);
            list.add((T)dto);
        }
        
        rd.close();
        conn.disconnect();
		return list;
    }
	
	private String getTextContentByTagName(Element element, String tagName) {
		String textContent = null;
    	NodeList nodeList = element.getElementsByTagName(tagName);
    	if(nodeList != null && nodeList.getLength()>0) {
    		nodeList = nodeList.item(0).getChildNodes();
    		textContent = nodeList.item(0).getTextContent();
    	}
    	return textContent;
	}
	
	private Document parseXML(InputStream stream) {
		 
 		 DocumentBuilderFactory objDocumentBuilderFactory = DocumentBuilderFactory.newInstance();
		 DocumentBuilder objDocumentBuilder = null;
		 Document doc = null;
		 
		 try {
			 objDocumentBuilder = objDocumentBuilderFactory.newDocumentBuilder();
			 doc = objDocumentBuilder.parse(stream);
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		 return doc;
		 }

}
		

