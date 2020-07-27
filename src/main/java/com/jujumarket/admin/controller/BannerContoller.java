package com.jujumarket.admin.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jujumarket.admin.domain.BannerVO;
import com.jujumarket.admin.service.BannerService;
import com.jujumarket.main.service.EventService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class BannerContoller {

	private ServletContext servletContext;
	private BannerService service;
	private EventService eventService;
	
	@GetMapping("/eventBanner")
	public void banner(Model model) {
		log.info("eventBanner........");
		
		model.addAttribute("event", eventService.getEvent());
	}
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
//	이미지 파일 타입 확인 메서드
//	private boolean checkImageType(File file) {
//		try {
//			String contentType = Files.probeContentType(file.toPath());
//			
//			return contentType.startsWith("image");
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		return false;
//	}
	
	@PostMapping(value = "/eventBanner", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BannerVO>> uploadBanner(MultipartFile[] uploadFile) {
		List<BannerVO> list = new ArrayList<>();
		String uploadFolder = servletContext.getRealPath("/resources/banner");
		
		System.out.println(uploadFolder + " 업로드 패스");
		
		String uploadFolderPath = getFolder();
		
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("upload path : " + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multi : uploadFile) {
			BannerVO vo = new BannerVO();
			
			String uploadFileName = multi.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			vo.setImgName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multi.transferTo(saveFile);
				
				vo.setUuid(uuid.toString());
				vo.setImgPath(uploadFolderPath);
				vo.setBannerType("event");
				
				vo.setIdNo("임시idNo");
				service.register(vo);
				
				list.add(vo);
				
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String imgName) {
		File file = new File(servletContext.getRealPath("/resources/banner/") + imgName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
}