package com.jujumarket.main.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jujumarket.main.domain.Criteria;
import com.jujumarket.main.domain.ReviewPageDTO;
import com.jujumarket.main.domain.ReviewVO;
import com.jujumarket.main.service.ReviewService;
import com.jujumarket.member.domain.SocialVO;
import com.jujumarket.order.domain.OrderRequestVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/review/")
@AllArgsConstructor
public class ReviewController {
	
	private ReviewService service;
	private ServletContext servletContext;
	
	// 리뷰 등록
	@PostMapping(value = "/regReview",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReviewVO vo) {
		log.info("ReviewVO : " + vo);
		
		int insertCount = service.register(vo);
		
		System.out.println("Review INSERT COUNT : " + insertCount);
		
		return insertCount == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 리뷰 사진 등록
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<String>> uploadAjaxPost(MultipartFile[] uploadFile, String itemCode) {
		
		String uploadFolder = servletContext.getRealPath("/resources/review");
		
	    File uploadPath = new File(uploadFolder, itemCode);
	    System.out.println("업로드 된 경로 " + uploadPath);
	      
	    if(uploadPath.exists() == false) {
	       uploadPath.mkdir();
	    }
	    
	    String uploadFilename = "";
	    for(MultipartFile multi : uploadFile) {     
	        uploadFilename = multi.getOriginalFilename();
	
	        uploadFilename = uploadFilename.substring(uploadFilename.lastIndexOf("\\") + 1);
	         
	        UUID uuid = UUID.randomUUID();
	        uploadFilename = uuid.toString() + "_" + uploadFilename;
	        
	        try {
	        	// 이미지 파일 path에 올리기
	        	File saveFile = new File(uploadPath, uploadFilename);
	            multi.transferTo(saveFile);
	            
	        } catch (Exception e) {
	        	log.error(e.getMessage());
	    	} // end catch
	    }
	    
	    List<String> list = new ArrayList<>();
	    list.add(uploadFilename);
	    
		return new ResponseEntity<>(list , HttpStatus.OK);
	}
	
	// 별점 평균 낼 때
	@GetMapping(value = "pages/{itemCode}",
			produces =
			{MediaType.APPLICATION_XML_VALUE,
			 MediaType.APPLICATION_JSON_UTF8_VALUE})
			
	public ResponseEntity<List<ReviewVO>> getScore(@PathVariable("itemCode") String itemCode){
			log.info("getList...............");
	         
        return new ResponseEntity<>(service.getList(itemCode), HttpStatus.OK);
	}
	
	// 페이징 별 리스트 출력
	@GetMapping(value = "pages/{itemCode}/{page}",
			produces =
			{MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	
	public ResponseEntity<ReviewPageDTO> getList(
			@PathVariable("page") int page,
			@PathVariable("itemCode") String itemCode){
			
			Criteria cri = new Criteria(page, 10);
			log.info("get Review List ItemCode : " + itemCode);
			log.info("cri : " + cri);
		
		return new ResponseEntity<>(service.getListPage(cri, itemCode), HttpStatus.OK);
	}
	
	// 리뷰 삭제
	@DeleteMapping(value="/{reviewNo}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("reviewNo") String reviewNo) {
		log.info("remove : " + reviewNo);
		
		ReviewVO vo = service.get(reviewNo);
		
		String filePath = servletContext.getRealPath("/resources/review");
		filePath = filePath + "/" + vo.getItemCode() + "/";

		File file = new File(filePath + vo.getReviewImg());
		
		if(file.exists()) {
			if(file.delete()) {
				System.out.println(file.getName() + "삭제성공");
			}else {
				System.out.println(file.getName() + "삭제실패");
			}
		}else {
			System.out.println("파일이 존재하지 않음");
		}
		
		return service.remove(reviewNo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 리뷰 수정
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/{reviewNo}",
			consumes = "application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReviewVO vo, @PathVariable("reviewNo") String reviewNo) {
		vo.setReviewNo(reviewNo);
		
		return service.modify(vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 리뷰 하나 불러오기
	@GetMapping(value = "/{reviewNo}",
			produces = {MediaType.APPLICATION_XML_VALUE,
		    MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReviewVO> get(@PathVariable("reviewNo") String reviewNo) {
		log.info("get : " + reviewNo);
		
		return new ResponseEntity<>(service.get(reviewNo), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/orderCheck", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity<String> orderCheck(String idNo, String itemCode) {
		
		String result = "reject";
		List<OrderRequestVO> list = service.getOrderStat(idNo);
		
		for(int i=0; i<list.size(); i++) {
			OrderRequestVO vo = list.get(i);
			
			if(vo.getItemCode().equals(itemCode) && vo.getOrderStat().equals("배송완료")) {
				result = "success";
			}
		}
		
		System.out.println("리뷰 남기기 가능한 사람인지 "+ result + "!!!!!!!!!!!!");
		
		return new ResponseEntity<String>(result, HttpStatus.OK);
		
	}


}
