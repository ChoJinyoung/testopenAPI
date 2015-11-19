package com.dorothy.test.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.xml.transform.stream.StreamSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.oxm.XmlMappingException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dorothy.test.service.convert.MarShallingConverter;
import com.dorothy.test.service.serviceItf.RestTemplateService;
import com.dorothy.test.vo.ItemsVo;
import com.dorothy.test.vo.SearchResultTbCase;

@Controller
@RequestMapping("/main")
public class OpenApiController {

	@Autowired
	@Resource(name = "restTemplateService")
	private RestTemplateService restTemplateService;

	@Autowired
	@Resource(name = "marshallingConverter")
	MarShallingConverter marshallingConverter;

	@RequestMapping("/searchForm")
	public String searchForm(Model model) throws XmlMappingException, IOException {
		String url="http://openapi.tago.go.kr/openapi/service/TrainInfoService/getCtyCodeList?ServiceKey=rf8h5nHqKpp9A%2Babq%2FQxu9vBC4N9S82ZPguUarHzZevdW2BEl7fks1Vx2DQHWVaEZ1nfgZfQKwucluBjFwo7qw%3D%3D";
		//Map<String, String> map = new HashMap<String, String>();
		
		StreamSource streamSourceResult = restTemplateService.getRestDataXml(
				url, StreamSource.class);
		SearchResultTbCase vo = marshallingConverter.unmarshalling(streamSourceResult);
		System.out.println(vo.getResultVo().getResultCode());
		System.out.println(vo.getResultVo().getMsg());
		
		
		model.addAttribute("vo", vo);
		
		
		return "/ecgSearchForm";
	}
	/*
	 * @RequestMapping("/search") public String
	 * search(@RequestParam("ServiceKey") String ServiceKey, Model model) throws
	 * XmlMappingException, IOException { String url =
	 * "http://openapi.tago.go.kr/openapi/service/TrainInfoService/getCtyCodeList?ServiceKey={ServiceKey}"
	 * ;
	 * 
	 * Map<String, String> map = new HashMap<String, String>();
	 * map.put("ServiceKey", ServiceKey); // 인증 코드 입력
	 * 
	 * // RestTemplate 클래스를 이용해서 xml 데이터를 StreamSource 타입으로 가져온다. StreamSource
	 * streamSourceResult = restTemplateService.getRestDataXml( url,
	 * StreamSource.class, map);
	 * 
	 * SearchResultTbCase searchResultTbCase = marshallingConverter
	 * .unmarshalling(streamSourceResult);
	 * 
	 * System.out.println(searchResultTbCase.getSection());
	 * 
	 * for(RailVo railVo : searchResultTbCase.getSection().getItems().getList())
	 * { System.out.println("CITYID: " + railVo.getCitycode());
	 * System.out.println("도시이름: " + railVo.getCityname()); System.out.println(
	 * "==================================================================================================="
	 * ); }
	 * 
	 * model.addAttribute("searchResultTbCase", searchResultTbCase);
	 * 
	 * return "/ecgSearchResult"; }
	 */
}
