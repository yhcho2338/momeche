package com.myspring.momeche001.smsService;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class SmsService {
	public static void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) { 
		
		// 유료서비스 - 시연시 주석 해제 필요
		/*
	      String api_key = "NCSM7FUSOUXTRCGE"; 
	      String api_secret = "TYHC9IQ6AUZVFYOMCZ4HQBEM8GNHMUKJ"; 
	      Message coolsms = new Message(api_key, api_secret); 
	      // 4 params(to, from, type, text) are mandatory. must be filled 
	      HashMap<String, String> params = new HashMap<String, String>(); 
	      params.put("to", userPhoneNumber); // ������ȭ��ȣ 
	      params.put("from", ""); // �߽���ȭ��ȣ. �׽�Ʈ�ÿ��� �߽�,���� �Ѵ� ���� ��ȣ�� �ϸ� �� 
	      params.put("type", "SMS"); 
	      params.put("text", "[MoMeChe ���θ�]ȸ�� ������ ���� ������ȣ��" + "["+randomNumber+"]" + "�Դϴ�."); // ���� ���� �Է� 
	      params.put("app_version", "test app 1.2"); // application name and version 
	      try { 
	         JSONObject obj = (JSONObject) coolsms.send(params); 
	         System.out.println(obj.toString()); 
	         } catch (CoolsmsException e) { 
	            System.out.println(e.getMessage()); System.out.println(e.getCode()); 
	            } 
	      
		*/
		}
		
}
