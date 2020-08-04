package com.jujumarket.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
import com.jujumarket.admin.domain.ListItemVO;
import com.jujumarket.admin.service.BannerService;
import com.jujumarket.shop.domain.ItemCriteria;
import com.jujumarket.shop.domain.ItemPageDTO;
import com.jujumarket.shop.service.RegisterItemService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class BannerContoller {

	private ServletContext servletContext;
	private BannerService service;

	// 諛곕꼫 愿�由� 寃� 留ㅽ븨
	@GetMapping("/eventBanner")
	public void eventBanner(Model model) {
		log.info("eventBanner........");
		
		String bannerType = "event";
		model.addAttribute("event", service.getBanner(bannerType));
	}
	
	@GetMapping("/advertise")
	public void advertise(Model model) {
		log.info("advertise........");
		
		String bannerType = "advertise";
		model.addAttribute("advertise", service.getBanner(bannerType));
	}
	
	@GetMapping("/mainBanner")
	public void mainBanner(Model model) {
		log.info("mainBanner........");
		
		String bannerType = "main";
		model.addAttribute("main", service.getBanner(bannerType));
	}
	
	@GetMapping("/seasonalMagazine")
	public void seasonalMagazine(ItemCriteria cri, Model model) {
		log.info("eventBanner........");
		
		int total = service.getItemTotal(cri);
		
		String bannerType = "seasonal";
		model.addAttribute("seasonItemResult", service.getSeason());
		model.addAttribute("seasonal", service.getBanner(bannerType));
		model.addAttribute("list", service.getItemList(cri));
		model.addAttribute("pageMaker", new ItemPageDTO(cri, total));
	}
	
	// �뙆�씪 �뾽濡쒕뱶 以묐났肄붾뱶 硫붿꽌�뱶
	public List<BannerVO> imgSave(MultipartFile[] uploadFile, String bannerType, String idNo) {
		
		List<BannerVO> list = new ArrayList<>();
		String uploadFolder = servletContext.getRealPath("/resources/banner");
		
		System.out.println("�뾽濡쒕뱶 寃쎈줈 " + uploadFolder);
		
		String uploadFolderPath = File.separator + bannerType;
		
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
				vo.setBannerType(bannerType);
				
				vo.setIdNo(idNo);
				service.register(vo);
				
				list.add(vo);
				
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
		return list;
	}
	
	// �씠踰ㅽ듃 諛곕꼫
	@PostMapping(value = "/eventBanner", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BannerVO>> uploadBanner(MultipartFile[] uploadFile, String idNo) {
		
		List<BannerVO> list = imgSave(uploadFile, "event", idNo);
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	// 以묎컙 愿묎퀬 
	@PostMapping(value = "/advertise", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BannerVO>> advertise(MultipartFile[] uploadFile, String idNo) {
		List<BannerVO> list = imgSave(uploadFile, "advertise", idNo);
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	// 硫붿씤 �뒳�씪�씠�뱶 諛곕꼫
	@PostMapping(value = "/mainBanner", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BannerVO>> mainBanner(MultipartFile[] uploadFile, String idNo) {
		List<BannerVO> list = imgSave(uploadFile, "main", idNo);
		
		System.out.println(idNo + "�뿬湲� �븘�씠�뵒");
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	// �젣泥� �럹�씠吏�
	@PostMapping(value = "/seasonalMagazine", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BannerVO>> seasonalMagazine(MultipartFile[] uploadFile , String idNo) {
		List<BannerVO> list = imgSave(uploadFile, "seasonal", idNo);
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	// �삱由� �썑 蹂댁씠湲� 
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
	
	// �뙆�씪 �궘�젣 以묐났肄붾뱶 硫붿꽌�뱶
	public boolean removeImg(String fileName) {
		File file;
		String filePath = servletContext.getRealPath("/resources/banner");
		
		try {
			file = new File(filePath + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	// �삱由� �썑 �궘�젣
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type, String bannerType, String imgNo) {
		log.info("deleteFile : " + fileName);
		
		boolean deleteFile = removeImg(fileName);
		
		if(!deleteFile) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		service.remove(imgNo);
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	// �씠誘� �삱�씪媛� 諛곕꼫 �궘�젣
	@PostMapping("/remove")
	@ResponseBody
	public ResponseEntity<String> remove(String imgNo) {
		
		BannerVO vo = new BannerVO();
		vo = service.get(imgNo);

		String fileName = vo.getImgPath() + "/" + vo.getUuid() + "_" + vo.getImgName();
		
		boolean deleteFile = removeImg(fileName);
		
		if(!deleteFile) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		service.remove(imgNo);
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	@PostMapping("/regSeason")
	@ResponseBody
	public ResponseEntity<String> regSeason(String[] itemCode) {
		
		for(int i=0; i<itemCode.length; i++) {
			ListItemVO vo = service.getItem(itemCode[i]);
	
			service.regSeason(vo);
		}
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@PostMapping("/deleSeason")
	@ResponseBody
	public ResponseEntity<String> deleSeason(String[] itemCode) {
		
		for(int i=0; i<itemCode.length; i++) {
			
			service.deleSeason(itemCode[i]);
		}
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
}