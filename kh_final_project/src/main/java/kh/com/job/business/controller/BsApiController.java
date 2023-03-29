package kh.com.job.business.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

@Controller
public class BsApiController {
	@GetMapping("/workApi")
	public ModelAndView workapi(ModelAndView mv) throws Exception{
		StringBuilder urlBuilder = new StringBuilder("http://openapi.work.go.kr/opi/opi/opia/wantedApi.do"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("authKey","UTF-8") + "=WNLBET6R0WPQK95R8VLU02VR1HJ"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("returnType","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*결과형식(xml)*/
        urlBuilder.append("&" + URLEncoder.encode("callTp","UTF-8") + "=" + URLEncoder.encode("L", "UTF-8")); /*L(목록), D(상세)*/
        urlBuilder.append("&" + URLEncoder.encode("startPage","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("display","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
       // urlBuilder.append("&" + URLEncoder.encode("region","UTF-8") + "=" + URLEncoder.encode("11000", "UTF-8")); /*지역*/
        
        
        
 
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
        
        Document doc = parseXML(conn.getInputStream());
        doc.getDocumentElement().normalize();
        NodeList wantedList = doc.getElementsByTagName("wanted"); 
        System.out.println(wantedList.getLength()); // 총 몇개인지 확인 가능
        for(int i=0; i<wantedList.getLength(); i++) {
        	Node wanted = wantedList.item(i); 
        	Element ele = (Element) wanted;
        	NodeList nlList = ele.getElementsByTagName("company").item(0).getChildNodes(); //company 이름이 꺼내짐
        	System.out.println(nlList.item(0).getTextContent());
//        	NodeList nList = ele.getChildNodes(); // wanted의 자식 태그들을 뽑아낼 수 있음
//            for(int i=0; i<wantedList.getLength(); i++) {
        	
        	System.out.println(wanted.getNodeName().equals("company"));
        }
        
        rd.close();
        conn.disconnect();
//        System.out.println(sb.toString());
		return mv;
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
		} catch (SAXException e) { //Simple API for XML 
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		 return doc;
		 }

}
		