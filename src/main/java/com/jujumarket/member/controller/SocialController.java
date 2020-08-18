package com.jujumarket.member.controller;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jujumarket.member.domain.MemberVO;
import com.jujumarket.member.domain.SocialVO;
import com.jujumarket.member.service.SocialService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class SocialController {
	
	private SocialService service;
	
	public static JsonNode getAccessToken(String autorize_code){ 

	    final String RequestUrl = "https://kauth.kakao.com/oauth/token";

	    final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
	    postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
	    postParams.add(new BasicNameValuePair("client_id", "01b574850137dfee5c295348e0be136f"));    // REST API KEY
	    postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost/member/kakaoLogin"));    // 리다이렉트 URI
	    postParams.add(new BasicNameValuePair("code", autorize_code));    // 로그인 과정중 얻은 code 값

	    final HttpClient client = HttpClientBuilder.create().build();
	    final HttpPost post = new HttpPost(RequestUrl);
	    
	    JsonNode returnNode = null;

	    try {
	      post.setEntity(new UrlEncodedFormEntity(postParams));
	      final HttpResponse response = client.execute(post);
	      
	      final int responseCode = response.getStatusLine().getStatusCode();
	      System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
	      System.out.println("Post parameters : " + postParams);
	      System.out.println("Response Code : " + responseCode);

	      //JSON 형태 반환값 처리
	      ObjectMapper mapper = new ObjectMapper();
	      returnNode = mapper.readTree(response.getEntity().getContent());

	    } catch (UnsupportedEncodingException e) {
	    	e.printStackTrace();
	    } catch (ClientProtocolException e) {
	    	e.printStackTrace();
	    } catch (IOException e) {
	    	e.printStackTrace();
	    } finally {
	        // clear resources
	    }

	    return returnNode;

	}
	
	public static JsonNode getKakaoUserInfo(String autorize_code) {

		final String RequestUrl = "https://kapi.kakao.com/v2/user/me";

		String CLIENT_ID = "01b574850137dfee5c295348e0be136f"; // REST API KEY
		String REDIRECT_URI = "http://localhost/member/kakaoLogin"; // 리다이렉트 URI
		String code = autorize_code; // 로그인 과정중 얻은 토큰 값

		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);

		// add header
		post.addHeader("Authorization", "Bearer " + autorize_code);
		JsonNode returnNode = null;
	    
		try {
	    	final HttpResponse response = client.execute(post);
		    final int responseCode = response.getStatusLine().getStatusCode();

		    System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
		    System.out.println("Response Code : " + responseCode);

		    //JSON 형태 반환값 처리
		    ObjectMapper mapper = new ObjectMapper();
		    returnNode = mapper.readTree(response.getEntity().getContent());

		} catch (UnsupportedEncodingException e) {
		      e.printStackTrace();
	    } catch (ClientProtocolException e) {
		      e.printStackTrace();
	    } catch (IOException e) {
		      e.printStackTrace();
	    } finally {
	        // clear resources
	    }

	    return returnNode;
	}


	@RequestMapping(value="/kakaoLogin", produces="application/json", method= {RequestMethod.GET, RequestMethod.POST})
	public String kakaoLogin(@RequestParam("code") String code, RedirectAttributes redirect, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("카카오 code : " + code);
		
		// socialVO
		//SocialVO socialVO = new SocialVO();
		MemberVO socialVO = new MemberVO();
		
		JsonNode jsonToken = SocialController.getAccessToken(code);

		System.out.println("JSON 반환 : " + jsonToken.get("access_token"));
		String accessCode = jsonToken.get("access_token").asText();
		
		//사용자 정보 요청
        JsonNode userInfo = SocialController.getKakaoUserInfo(accessCode);

        // Get id
 		String id = userInfo.path("id").asText();

        // 유저정보 카톡에서 가져오기 Get properties
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		
		if (properties.isMissingNode()) {
			// if "name" node is missing
			System.out.println("missing,,,,,,,ㅠ");
		} else {
			String nickname = properties.path("nickname").asText();
			// String thumbnailImage = properties.path("thumbnail_image").asText();
			// String profileImage = properties.path("profile_image").asText();
			String kakaoEmail = kakao_account.path("email").asText();
			String birthday = kakao_account.path("birthday").asText();

			System.out.println("kakao nickname : " + nickname);
			// System.out.println("thumbnailImage : " + thumbnailImage);
			// System.out.println("profileImage : " + profileImage);
			System.out.println("kakao Email : " + kakaoEmail);
			System.out.println("kakao birthday : " + birthday);	
			
			// 카카오 이메일이 null일 경우 닉네임을 이메일로 써준다
			kakaoEmail = kakaoEmail == ""? "kakao@"+nickname : kakaoEmail;
			
			// 이미 가입이 된 사람인지 체크
			int result = service.socialEmailCheck(kakaoEmail);
			if(result == 0) {
				
				// 전화번호는 주문 받으면서 받은 후에 update 해줘야 할듯!
				socialVO.setMemName(nickname);
				socialVO.setEmailAccount(kakaoEmail);
				socialVO.setMemCode("KAKAO");
				socialVO.setBirth(birthday);
				socialVO.setSocialType("kakao");
				service.register(socialVO);
			}else {
				socialVO = service.getSocialInfo(kakaoEmail);
			}
			
			session.setAttribute("sessionMember", socialVO);
			session.setAttribute("accessToken", accessCode);
		}
		
		return "redirect:/";
	}
	
	
	//로그아웃 세션
	@GetMapping("/kakaoLogout")
	public String logout(HttpSession session) throws IOException {
		SocialController.kakaoLogout((String)session.getAttribute("accessToken"));
	    session.removeAttribute("accessToken");
		
		session.invalidate();
		return "redirect:/";
	}
	
	// 카카오 로그아웃
	public static void kakaoLogout(String accessToken) throws IOException {
	    String reqURL = "https://kapi.kakao.com/v1/user/logout";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println(result);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}
	
	@GetMapping("/naverCallback")
	public void naverCallback() {
		
	}
	
	@RequestMapping(value = "/naverLogin", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity<String> naverLogin(String emailAccount, String memName, String birth, String naverToken, HttpSession session) {
		System.out.println("네이버 로그인 컨트롤러!!!!");
		// socialVO
		//SocialVO socialVO = new SocialVO();
		MemberVO socialVO = new MemberVO();
		
		birth = birth == null? "" : birth;
		
		System.out.println(naverToken + " 네이버 토큰 값");
		System.out.println(emailAccount + " 네이버 컨트롤러 이메일");
		System.out.println(memName + " 네이버 컨트롤러 이름");
		System.out.println(birth + " 네이버 컨트롤러 생일");
		
		// 이미 가입이 된 사람인지 체크
		int result = service.socialEmailCheck(emailAccount);
		if(result == 0) {
			// 전화번호는 주문 받으면서 받은 후에 update 해줘야 할듯!
			
			socialVO.setEmailAccount(emailAccount);
			socialVO.setMemName(memName);
			socialVO.setMemCode("NAVER");
			socialVO.setSocialType("naver");
			socialVO.setBirth(birth);
			service.register(socialVO);
		}else {
			socialVO = service.getSocialInfo(emailAccount);
		}
		
		session.setAttribute("accessToken", naverToken);
		session.setAttribute("sessionMember", socialVO);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
		
	}
	
	@GetMapping("/naverLogout")
	public String naverLogout(HttpSession session, Model model) {
		String accessToken = (String)session.getAttribute("accessToken");
		System.out.println("naver 로그아웃 >>>>"+ accessToken);
		
		// 토큰 값 아예 삭제할 때 필요
//		String deleteTokenUrl = SocialController.deleteToken(accessToken);
//
//		try {
//			URL url = new URL(deleteTokenUrl);
//			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//			conn.setRequestMethod("POST");
//			
//			int responseCode = conn.getResponseCode();
//	        System.out.println("responseCode : " + responseCode);
//	        
//	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//	        
//	        String result = "";
//	        String line = "";
//	        
//	        while ((line = br.readLine()) != null) {
//	            result += line;
//	        }
//	        System.out.println(result);
//
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		
		session.removeAttribute("accessToken");
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 토큰 값 아예 삭제할 때 필요
//	public static String deleteToken(String accessToken) {
//    	String deleteUrl = "https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=7Uw4MdMci9xWvrvnp_e8&client_secret=_8OKcfDMlg&access_token=" + accessToken + "&service_provider=NAVER";
//    	
//    	return deleteUrl;
//    }

	
	@RequestMapping(value = "/googleLogin", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity<String> googleLogin(String emailAccount, String memName, String googleToken, HttpSession session) {
		System.out.println("구글 로그인 컨트롤러!!!!");
		// socialVO
		//SocialVO socialVO = new SocialVO();
		MemberVO socialVO = new MemberVO();
		
		System.out.println(googleToken + " 구글 토큰 값");
		System.out.println(emailAccount + " 구글 컨트롤러 이메일");
		System.out.println(memName + " 구글 컨트롤러 이름");
		
		// 이미 가입이 된 사람인지 체크
		int result = service.socialEmailCheck(emailAccount);
		if(result == 0) {
			// 전화번호는 주문 받으면서 받은 후에 update 해줘야 할듯!
			socialVO.setEmailAccount(emailAccount);
			socialVO.setMemName(memName);
			socialVO.setMemCode("GOOGLE");
			socialVO.setSocialType("google");
			socialVO.setBirth("");
			service.register(socialVO);
		}else {
			socialVO = service.getSocialInfo(emailAccount);
		}
		
		session.setAttribute("accessToken", googleToken);
		session.setAttribute("sessionMember", socialVO);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
		
	}
	
	@GetMapping("/googleLogout")
	public String googleLogout(HttpSession session, Model model) {
		String accessToken = (String)session.getAttribute("accessToken");
		System.out.println("구글 로그아웃 >>>>"+ accessToken);
		
		session.removeAttribute("accessToken");
		session.invalidate();
		
		return "redirect:/";
	}

}