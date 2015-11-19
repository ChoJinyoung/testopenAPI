package com.dorothy.test.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;

@XmlAccessorType(XmlAccessType.FIELD)
public class RailVo {
	@XmlElement(name="citycode")
	private String citycode;
	
	@XmlElement(name="cityname")
	private String cityname;

	

	public String getCitycode() {
		return citycode;
	}

	public void setCitycode(String citycode) {
		this.citycode = citycode;
	}

	public String getCityname() {
		return cityname;
	}
	
	public void setCityname(String cityname) {
		this.cityname = cityname;
	}
	@Override
	public String toString() {
		return "RailVo [citycode=" + citycode + ", cityname=" + cityname + "]";
	}
}
