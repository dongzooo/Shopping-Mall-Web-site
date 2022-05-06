package com.message.service;

import java.util.HashMap;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MessageServiceImpl implements MessageService{

	@Override
	public void sendMessage(String toNumber, String randNumber) {
		String api_key = "NCSRFZNYYNF8ZLFJ";
	    String api_secret = "QJ2COKIVHD10CSVAXEU1G7PD4FDMDD96";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", toNumber);
	    params.put("from", "01041885093");
	    params.put("type", "SMS");
	    params.put("text", "[PRECYCLING] 인증번호 [" + randNumber +"] 를 입력하세요.");
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	}

}
