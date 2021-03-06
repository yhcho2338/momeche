package com.myspring.momeche001.member.service;

import java.io.*;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.myspring.momeche001.member.dao.MemberDAO;
import com.myspring.momeche001.member.vo.MemberVO;


import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;



@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberDAO getMemberDAO() {
		return memberDAO;
	}
	
	
	@Override
	public List listMembers(int offset, int count) throws DataAccessException{
		List membersList = null;
		membersList = memberDAO.selectAllMemberList(offset, count);
		return membersList;
	}
	
	
	@Override
	public int addMember(MemberVO memberVO) throws DataAccessException{
		return memberDAO.insertMember(memberVO);
	}
	
	@Override
	public int removeMember(String id) throws DataAccessException{
		return memberDAO.deleteMember(id);
	
	}
	
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		return memberDAO.loginById(memberVO);
	}
	
	
	
	@Override
	public String overlapped(String mb_id) throws Exception{
		return memberDAO.selectOverlappedID(mb_id);
	}
	
	
	// ????????? ??????
	@Override
	   public String find_id(HttpServletResponse response, String email_1) throws Exception {
	      response.setContentType("text/html;charset=utf-8");
	      PrintWriter out = response.getWriter();
	      String mb_id = memberDAO.find_id(email_1);
	      
	      if (mb_id == null) {
	         out.println("<script>");
	         out.println("alert('???????????? ????????? ?????????.');");
	         out.println("history.go(-1);");
	         out.println("</script>");
	         out.close();
	         return null;
	      } else {
	         return mb_id;
	      }
	   }

	
	@Override
	public void memberDelete(MemberVO memberVO) throws Exception {
		memberDAO.deleteMember(memberVO);
		
	}
	
	/**/
	@Override
	public String getAccessToken (String authorize_code) throws Exception {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //    POST ????????? ?????? ???????????? false??? setDoOutput??? true???
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //    POST ????????? ????????? ???????????? ???????????? ???????????? ?????? ??????
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=ddbb538ec4bed14008f92e3da8026791");
            sb.append("&redirect_uri=http://localhost:8080/momeche001/member/login");
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            //    ?????? ????????? 200????????? ??????
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            //    ????????? ?????? ?????? JSON????????? Response ????????? ????????????
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            //    Gson ?????????????????? ????????? ???????????? JSON?????? ?????? ??????
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return access_Token;
    }
	@Override
	public HashMap<String, Object> getUserInfo (String access_Token) throws Exception {

        //    ???????????? ????????????????????? ?????? ????????? ?????? ??? ????????? HashMap???????????? ??????
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");

            //    ????????? ????????? Header??? ????????? ??????
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

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            //JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            //String email = kakao_account.getAsJsonObject().get("email").getAsString();

            userInfo.put("nickname", nickname);
            //userInfo.put("email", email);

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return userInfo;
    }
	
	
	
	
	
}
